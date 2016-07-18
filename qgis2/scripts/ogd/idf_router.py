from PyQt4.QtCore import *
from qgis.networkanalysis import *
from datetime import datetime

class IDFRouter:
    def __init__(self,idf_file,mode='distance',bbox=None):
        self.mode = mode 
        self.bbox = bbox
        
        """ for the basic network """
        self.nodes = {}
        self.links = {}
        self.node_features = []
        self.link_features = []
    
        """ for the routing graph """
        self.use_to_link = {}
        self.graph = QgsGraph()
        self.link_to_vertex = {}
        self.vertex_to_link = {}
        
        layers = self.readIdf(idf_file)
        
        for layer in layers:
            layer.updateExtents()
            
        self.node_layer = layers[0]
        self.link_layer = layers[1]
        
    def drawLayers(self):
        QgsMapLayerRegistry.instance().addMapLayer(self.node_layer)
        QgsMapLayerRegistry.instance().addMapLayer(self.link_layer)

    def readIdf(self,idf_file):
        status = ""
        
        with open(idf_file) as f:
            for line in f:
                
                line = line.strip().split(';')
                if line[0] == "tbl":
                    status = line[1]
                    print str(datetime.now()) + ' ' + status
                    
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
                    pt = QgsPoint(x,y)
                    if self.bbox and not self.bbox.contains(pt):
                        continue
                    self.nodes[id] = pt
                    fet.setGeometry(QgsGeometry.fromPoint(pt))
                    fet.setAttributes(line[1:])
                    self.node_features.append(fet)
                    
                """ LINK """    
                if status == "Link" and line[0] == "atr":
                    node_pr.addFeatures(self.node_features)
                    self.node_features = []
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
                    try:
                        from_node = self.nodes[int(line[4])]
                        to_node = self.nodes[int(line[5])]
                    except KeyError:
                        continue
                    self.links[id] = (line[1:], [from_node,to_node])
                    
                """ LINK COORDINATE """
                if status == "LinkCoordinate" and line[0] == "rec":
                    id = int(line[1])
                    #count = int(line[2])
                    x = float(line[3])
                    y = float(line[4])
                    try:
                        self.links[id][1].insert(-1,QgsPoint(x,y))
                    except KeyError:
                        continue
                    
                    
                """ LINK USE"""
                if status == "LinkUse" and line[0] == "rec":
                    #use_id = line[1]
                    #link_id = line[2]
                    #self.use_to_link[use_id] = link_id
                    pass
                
                if status == "TurnEdge" and line[0] == "atr":
                    """ prepare the links """
                    for id,[attrs,line] in self.links.iteritems():
                        fet = QgsFeature()
                        fet.setGeometry(QgsGeometry.fromPolyline(line))
                        fet.setAttributes(attrs)
                        self.link_features.append(fet)
                        
                        """ create routing graph entry """
                        vertex_id = self.graph.addVertex(QgsGeometry.fromPolyline(line).centroid().asPoint())
                        self.link_to_vertex[id] = vertex_id
                        self.vertex_to_link[vertex_id] = id
                        
                    link_pr.addFeatures(self.link_features)
                    self.link_features = []
                    
                if status == "TurnEdge" and line[0] == "rec":
                    """ create routing graph entry """
                    id = line[1]
                    from_link_id = int(line[2])
                    to_link_id = int(line[3])
                    vehicle_type = "{0:08b}".format(int(line[5]))
                    #distance = QgsGeometry.fromPolyline(self.links[from_link_id][1]).length()/2 + QgsGeometry.fromPolyline(self.links[to_link_id][1]).length()/2
                    try:
                        from_link = self.links[from_link_id]
                        to_link = self.links[to_link_id]
                    except KeyError:
                        continue
                    len_from_link = float(from_link[0][15])
                    len_to_link = float(to_link[0][15])
                    
                    weights = []
                    for i in range(1,4):
                        if int(vehicle_type[i*-1]) == 1:
                            if self.mode == 'traveltime':
                                if i == 1: # pedestrian
                                    speed_from_link = 5 # km/h 
                                    speed_to_link = 5
                                elif i == 2: # bike
                                    speed_from_link = 15
                                    speed_to_link = 15
                                elif i == 3: # car
                                    speed_from_link = max([0.1,float(from_link[0][5]),float(from_link[0][6])])
                                    speed_to_link = max([0.1,float(to_link[0][5]),float(to_link[0][6])])
                                minutes_from_link = len_from_link / (speed_from_link *1000/60)
                                minutes_to_link = len_to_link / (speed_to_link *1000/60)
                                traveltime = minutes_from_link/2 + minutes_to_link/2
                                weights.append(traveltime) 
                            elif self.mode == 'ambulance':
                                if i == 1: # pedestrian
                                    speed_from_link = 5 # km/h 
                                    speed_to_link = 5
                                elif i == 2: # bike
                                    speed_from_link = 15
                                    speed_to_link = 15
                                elif i == 3: # car
                                    speed_from_link = 1.33 * max([0.1,float(from_link[0][5]),float(from_link[0][6])])*1000/60
                                    speed_to_link = 1.33 * max([0.1,float(to_link[0][5]),float(to_link[0][6])])*1000/60
                                minutes_from_link = len_from_link / speed_from_link
                                minutes_to_link = len_to_link / speed_to_link
                                traveltime = minutes_from_link/2 + minutes_to_link/2
                                weights.append(traveltime)
                            else:
                                distance = len_from_link/2 + len_to_link/2
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
                    print str(datetime.now()) + " finishing up "
                    return [node_layer, link_layer]
    
    def computeRoute(self,from_link,to_link,vehicle_type):
        """ computes the route for the given vehicle type and adds a route layer to the map """
        print 'route from %s to %s' %(from_link,to_link)
        print str(datetime.now()) + " started"
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
        
        print str(datetime.now()) + " finished"

    def computeCatchment(self,from_link,vehicle_type,r=0.020):
        """ computes the catchment zone for the given vehicle type and adds it to the map """
        print 'catchment zone around %s with size %f' %(from_link,r)
        print str(datetime.now()) + " started"
        from_id = self.link_to_vertex[from_link]
        
        upperBound = []
        withinBound = []
        i = 0
        (tree,cost) = QgsGraphAnalyzer.dijkstra(self.graph,from_id,vehicle_type)

        reachable_layer = QgsVectorLayer(
            "LineString?crs=epsg:4326&field=id:integer&field=cost:double&index=yes", 
            "reachable links", 
            "memory")
        reachable_pr = reachable_layer.dataProvider()
        
        while i < len(cost):
            if cost[i] > r and tree[i] != -1:
                outVertexId = self.graph.arc(tree[i]).outVertex()
                if cost[outVertexId] < r:
                    attrs,line = self.links[self.vertex_to_link[outVertexId]]
                    attrs.append(cost[outVertexId])
                    upperBound.append(i)
                    fet = QgsFeature()
                    fet.setGeometry(QgsGeometry.fromPolyline(line))
                    fet.setAttributes(attrs)
                    reachable_pr.addFeatures([fet])
            elif tree[i] != -1:
                withinBound.append(self.graph.arc(tree[i]).outVertex())
                withinBound.append(self.graph.arc(tree[i]).inVertex())
            i = i + 1

        for id in withinBound:
            attrs,line = self.links[self.vertex_to_link[id]]
            attrs = [ attrs[0] ]
            attrs.append(float(cost[id]))
            fet = QgsFeature()
            fet.setGeometry(QgsGeometry.fromPolyline(line))
            fet.setAttributes(attrs)
            reachable_pr.addFeatures([fet])

        reachable_layer.updateExtents()
        QgsMapLayerRegistry.instance().addMapLayer(reachable_layer)

        print str(datetime.now()) + " finished"
        
        

""" 
You can get the IDF datasets used by this router from 
https://www.data.gv.at/katalog/dataset/intermodales-verkehrsreferenzsystem-osterreich-gip-at-beta/resource/0775cf69-7119-43ec-af09-9da1016a4b94 
"""

idf_file = "D:/Downloads/3_routingexport_wien_ogd/Routingexport_Wien_OGD.txt"
idf_file = "C:/Users/anita/Downloads/3_routingexport_ogd/3_routingexport_ogd.txt"
#idf_file = "C:/Users/anita/Documents/GitHub/QGIS-resources/qgis2/scripts/ogd/Routingexport_Wien_OGD.txt"

"""
Supported router modes are:
default = distance (in meters)
traveltime (in minutes) 
ambulance (faster traveltime)
"""

router = IDFRouter(idf_file,mode='traveltime',bbox=QgsRectangle(16.2,48.0,16.5,48.3)) 
router.drawLayers()

""" 
This router supports three different modes of transport:
0 ... pedestrian
1 ... cyclist
2 ... car 
"""

router.computeRoute(33000844,33114053,2)

router.computeCatchment(33000844,2,2) # two minutes by car
router.computeCatchment(33000844,0,10) # ten minutes by foot

