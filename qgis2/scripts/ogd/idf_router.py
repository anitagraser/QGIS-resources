from PyQt4.QtCore import *
from qgis.networkanalysis import *

class IDFRouter:
    def __init__(self,idf_file):
        
        """ for the basic network """
        self.nodes = {}
        self.links = {}
        
        """ for the routing graph """
        self.use_to_link = {}
        self.graph = QgsGraph()
        self.link_to_vertex = {}
        self.vertex_to_link = {}
        
        layers = self.read_idf(idf_file)
        
        for layer in layers:
            layer.updateExtents()
            QgsMapLayerRegistry.instance().addMapLayer(layer)
            
        self.node_layer = layers[0]
        self.link_layer = layers[1]

    def read_idf(self,idf_file):
        status = ""
        
        with open(idf_file) as f:
            for line in f:
                
                line = line.strip().split(';')
                if line[0] == "tbl":
                    status = line[1]
                    print status 
                    
                """ NODE """
                if status == "Node" and line[0] == "atr":
                    attribute_names = line[1:]
                if status == "Node" and line[0] == "frm":
                    node_layer = QgsVectorLayer(
                        "Point?crs=epsg:4326&index=yes", 
                        "nodes", 
                        "memory")
                    node_pr = node_layer.dataProvider()
                    for frm in line [1:]:
                        atr = attribute_names.pop(0)
                        frm = frm.split("(")[0]
                        if frm == "decimal":
                            field = QgsField(atr,QVariant.Double)
                        elif frm == "string":
                            field = QgsField(atr,QVariant.String)
                        node_pr.addAttributes([field])
                    node_layer.updateFields()
                if status == "Node" and line[0] == "rec":
                    id = int(line[1])
                    x = float(line[4])
                    y = float(line[5])
                    # add a feature
                    fet = QgsFeature()
                    self.nodes[id] = QgsPoint(x,y)
                    fet.setGeometry(QgsGeometry.fromPoint(QgsPoint(x,y)))
                    fet.setAttributes(line[1:])
                    node_pr.addFeatures([fet])
                    
                """ LINK """    
                if status == "Link" and line[0] == "atr":
                    attribute_names = line[1:]
                if status == "Link" and line[0] == "frm":
                    link_layer = QgsVectorLayer(
                        "LineString?crs=epsg:4326&index=yes", 
                        "links", 
                        "memory")
                    link_pr = link_layer.dataProvider()
                    for frm in line [1:]:
                        atr = attribute_names.pop(0)
                        frm = frm.split("(")[0]
                        if frm == "decimal":
                            field = QgsField(atr,QVariant.Double)
                        elif frm == "string":
                            field = QgsField(atr,QVariant.String)
                        link_pr.addAttributes([field])
                    link_layer.updateFields()            
                if status == "Link" and line[0] == "rec":
                    id = int(line[1])
                    from_node = self.nodes[int(line[4])]
                    to_node = self.nodes[int(line[5])]
                    self.links[id] = (line[1:], [from_node,to_node])
                    
                """ LINK COORDINATE """
                if status == "LinkCoordinate" and line[0] == "rec":
                    id = int(line[1])
                    #count = int(line[2])
                    x = float(line[3])
                    y = float(line[4])
                    self.links[id][1].insert(-1,QgsPoint(x,y))
                    
                    
                """ LINK USE"""
                if status == "LinkUse" and line[0] == "rec":
                    #use_id = line[1]
                    #link_id = line[2]
                    #self.use_to_link[use_id] = link_id
                    pass
                
                if status == "TurnEdge" and line[0] == "atr":
                    """ prepare the links and return the layers """
                    for id,[attrs,line] in self.links.iteritems():
                        fet = QgsFeature()
                        fet.setGeometry(QgsGeometry.fromPolyline(line))
                        fet.setAttributes(attrs)
                        link_pr.addFeatures([fet])
                        
                        """ create routing graph entry """
                        vertex_id = self.graph.addVertex(QgsGeometry.fromPolyline(line).centroid().asPoint())
                        self.link_to_vertex[id] = vertex_id
                        self.vertex_to_link[vertex_id] = id
                    
                if status == "TurnEdge" and line[0] == "rec":
                    """ create routing graph entry """
                    id = line[1]
                    from_link_id = int(line[2])
                    to_link_id = int(line[3])
                    vehicle_type = "{0:08b}".format(int(line[5]))
                    distance = QgsGeometry.fromPolyline(self.links[from_link_id][1]).length()/2 + QgsGeometry.fromPolyline(self.links[to_link_id][1]).length()/2
                    weights = []
                    for i in range(1,4):
                        if int(vehicle_type[i*-1]) == 1:
                            weights.append(distance)
                        else:
                            weights.append(9999999)
                    arc_id = edge_id = self.graph.addArc(
                        self.link_to_vertex[from_link_id],
                        self.link_to_vertex[to_link_id],
                        weights
                        )
                    
                if status == "TurnUse":
                    """ not implemented yet """
                    print "finishing up"
                    return [node_layer, link_layer]
    
    def computeRoute(self,from_link,to_link,vehicle_type):
        """ computes the route for the given vehicle type and adds a route layer to the map """
        print 'route from %s to %s' %(from_link,to_link)
        from_id = self.link_to_vertex[from_link]
        to_id = self.link_to_vertex[to_link]

        (tree,cost) = QgsGraphAnalyzer.dijkstra(self.graph,from_id,vehicle_type)

        if tree[to_id] == -1:
            pass # since the id cannot be found in the tree 
        else:
            """ collect all the vertices from target to source """
            route_vertices = []
            curPos = to_id 
            while (curPos != from_id):
                route_vertices.append(curPos)
                curPos = self.graph.arc(tree[curPos]).outVertex()
        route_vertices.append(from_id)
        route_vertices.reverse()
        
        route_layer = QgsVectorLayer(
            "LineString?crs=epsg:4326&field=id:integer&index=yes", 
            "route", 
            "memory")
        route_pr = route_layer.dataProvider()
        for id in route_vertices:
            attrs,line = self.links[self.vertex_to_link[id]]
            fet = QgsFeature()
            fet.setGeometry(QgsGeometry.fromPolyline(line))
            fet.setAttributes(attrs)
            route_pr.addFeatures([fet])
        
        route_layer.updateExtents()
        QgsMapLayerRegistry.instance().addMapLayer(route_layer)
            
idf_file = "C:/Users/anita/Documents/GitHub/QGIS-resources/qgis2/scripts/ogd/Routingexport_Wien_OGD.txt"
#idf_file = "C:/Users/anita/Documents/GitHub/QGIS-resources/qgis2/scripts/ogd/Routingexport_Klagenfurt_OGD.txt"

router = IDFRouter(idf_file)

# 0 ... pedestrian
# 1 ... cyclist
# 2 ... car 

router.computeRoute(33000844,33114053,2)
#router.computeRoute(601297920,601206884,2)