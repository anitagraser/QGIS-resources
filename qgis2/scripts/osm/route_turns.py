from PyQt4.QtCore import *
from xml.etree import ElementTree
import urllib2, os, qgis.utils, os.path, resources_rc, time

def requestRoute(start_point,stop_point):
    travel_type = 'Car'
    mode = 'Shortest'
    
    text = '''<?xml version="1.0" encoding="UTF-8" ?>
<xls:XLS xmlns:xls="http://www.opengis.net/xls" xsi:schemaLocation="http://www.opengis.net/xls http://schemas.opengis.net/ols/1.1.0/RouteService.xsd" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:gml="http://www.opengis.net/gml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1" xls:lang="it">
<xls:RequestHeader>
</xls:RequestHeader>
<xls:Request methodName="RouteRequest" version="1.1" requestID="00" maximumResponses="15">
<xls:DetermineRouteRequest>
<xls:RoutePlan>
    <xls:RoutePreference>'''
    text+=travel_type
    text+='''</xls:RoutePreference>
    <xls:ExtendedRoutePreference>
        <xls:WeightingMethod>'''
    text+=mode
    text+='''</xls:WeightingMethod>
    </xls:ExtendedRoutePreference>
    <xls:WayPointList>
        <xls:StartPoint>
            <xls:Position>
                <gml:Point xmlns:gml="http://www.opengis.net/gml">
                    <gml:pos srsName="EPSG:4326">'''
    text+=start_point
    text+='''</gml:pos>
                </gml:Point>
            </xls:Position>
        </xls:StartPoint>'''
    
    text+='''<xls:EndPoint>
            <xls:Position>
                <gml:Point xmlns:gml="http://www.opengis.net/gml">
                    <gml:pos srsName="EPSG:4326">'''
    text+=stop_point
    text+='''</gml:pos>
                </gml:Point>
            </xls:Position>
        </xls:EndPoint>
    </xls:WayPointList>
    <xls:AvoidList />
</xls:RoutePlan>
<xls:RouteInstructionsRequest provideGeometry="true" />
<xls:RouteGeometryRequest>
</xls:RouteGeometryRequest>
</xls:DetermineRouteRequest>
</xls:Request>
</xls:XLS>
'''
    url="http://openls.geog.uni-heidelberg.de/testing2015/routing?apikey=e2017639f5e987e6dc1f5f69a66d049c"
    req = urllib2.Request(url=url, data=text, headers={'Content-Type': 'application/xml'})
    response_route=urllib2.urlopen(req).read()
    newstr = response_route.replace("\n", "")
    response_route = newstr.replace("  ", "")

    #print response_route

    if response_route != "":
        xml_route = ElementTree.fromstring(response_route)

        fet = QgsFeature()
        seg=[]
        for i in range(0,len(xml_route[1][0][1][0])):
            seg.append(QgsPoint(float(str.split(xml_route[1][0][1][0][i].text)[0]),float(str.split(xml_route[1][0][1][0][i].text)[1])))
        print seg
        fet.setGeometry(QgsGeometry.fromPolyline(seg))
        fet.setAttributes(["route provided by openrouteservice.org", float(xml_route[1][0][0][1].attrib['value']), xml_route[1][0][0][0].text])
        return fet
    else:
        return None

input_layer = iface.activeLayer()
features = input_layer.getFeatures()

layer = QgsVectorLayer('LineString?crs=EPSG:4326', 'route_OSM', "memory")
pr = layer.dataProvider()
pr.addAttributes([QgsField("TURN_ID", QVariant.String)])
pr.addAttributes([QgsField("distance", QVariant.Double)])
pr.addAttributes([QgsField("time", QVariant.String)])
layer.updateFields()

fet=[]

for id,feature in enumerate(features):
    print id
    #print feature.geometry().asPolyline()
    start_point = feature.geometry().asPolyline()[0]
    stop_point = feature.geometry().asPolyline()[-1]
    start_point = '%f %f' % (start_point.x(),start_point.y())
    stop_point = '%f %f' % (stop_point.x(),stop_point.y())
    print "Requesting route from %s to %s ..." % (start_point,stop_point)
    f = requestRoute(start_point,stop_point)
    if f:
        f.setAttribute(0,feature["TURN_ID"])
        fet.append(f)

    
    
pr.addFeatures(fet)
    
layer.updateExtents() #update it
QgsMapLayerRegistry.instance().addMapLayer(layer)
