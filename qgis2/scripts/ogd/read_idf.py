from PyQt4.QtCore import *

def read_idf(idf_file):
    status = ""    
    nodes = {}
    links = {}
    node_features = []
    link_features = []
    
    counter = 0
    
    with open(idf_file) as f:
        
        for line in f:
            
            if counter % 100000 == 0:
                print "."
            counter +=1
            
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
                nodes[id] = QgsPoint(x,y)
                fet.setGeometry(QgsGeometry.fromPoint(QgsPoint(x,y)))
                fet.setAttributes(line[1:])
                node_features.append(fet)
                
                
            """ LINK """    
            
            if status == "Link" and line[0] == "atr":
                node_pr.addFeatures(node_features)
                node_features = []
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
                from_node = nodes[int(line[4])]
                to_node = nodes[int(line[5])]
                links[id] = (line[1:], [from_node,to_node])
                
            """ LINK COORDINATE """
            if status == "LinkCoordinate" and line[0] == "rec":
                id = int(line[1])
                #count = int(line[2])
                x = float(line[3])
                y = float(line[4])
                links[id][1].insert(-1,QgsPoint(x,y))
                
            """ LINK USE"""
            if status == "LinkUse":
                """ not implemented yet """
                
                """ prepare the links and return the layers """
                for id,[attrs,line] in links.iteritems():
                    fet = QgsFeature()
                    fet.setGeometry(QgsGeometry.fromPolyline(line))
                    fet.setAttributes(attrs)
                    link_features.append(fet)
                    
                link_pr.addFeatures(link_features)   
                link_features = []
                
                return [node_layer, link_layer]
            
            
idf_file = "D:\Documents\QGIS\scripts\Routingexport_Wien_OGD.txt"

layers = read_idf(idf_file)

for layer in layers:
    layer.updateExtents()
    QgsMapLayerRegistry.instance().addMapLayer(layer)

