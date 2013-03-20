#QGIS Styles

This is a collection of QGIS .qml and .sld styles. [Styled Layer Descriptor (SLD)](http://anitagraser.com/2012/06/03/sld-support-and-other-qgis1-8-style-features/) is supported by QGIS >= 1.8

##Contents

###Land Cover

* **clc_2006_SLC_de.sld**: Corine Land Cover - official colors (German labels)
* **corine_nice_de.qml**: Corine Land Cover - nice colors (German)
* **corine_nice_pl.qml**: Corine Land Cover - nice colors (Polish)
* **corine_nice_pl.sld**: Corine Land Cover - nice colors (Polish)
* **nvc_phase_1.qml**: National Vegetation Classification
* **ogdwien_realnut_level2**: OGDWien Realnutzung Level 2 

###Road and general base map styles

####Lighter fare

_Lighter base maps are best for adding location context your own thematic data._

* **osm_light_line.qml**: OpenStreetMap light line style, mostly road classes
* **osm_light_polygon.qml**: OpenStreetMap light polygon styles, mostly water, forest and buildings
* **osm2po_light.qml**: Light road style for OpenStreetMap data loaded into PostGIS using osm2po tool
* **v_osm_roads_google.qml**: Roadstyle for OpenStreetMap roads shapfiles loaded into PostGIS with advanced data-defined labeling rules

####Driving focused

_When navigation & route planning is your map's primary focus._

* **osm2po_google.qml**: Road style inspired by Google Maps for OpenStreetMap data loaded into PostGIS using osm2po tool
* **osm2pgsql_google_line_map.qml**: Roadway line style inspired by Google Maps Map View for OpenStreetMap data loaded into PostGIS using osm2pgsql tool
* **osm2pgsql_google_polygon_map.qml**: Roadway polygon style inspired by Google Maps Map View for OpenStreetMap data loaded into PostGIS using osm2pgsql tool
* **osm2pgsql_google_line_satellite.qml**: Roadway line style inspired by Google Maps Satellite View for OpenStreetMap data loaded into PostGIS using osm2pgsql tool
