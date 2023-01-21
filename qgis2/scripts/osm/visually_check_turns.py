def next():
    f = features.next()
    id = f['TURN_ID']
    print "Going to %s" % (id)
    QgsExpressionContextUtils.setProjectVariable('myvar',id)
    iface.mapCanvas().zoomToFeatureExtent(f.geometry().boundingBox())
    if iface.mapCanvas().scale() < 500:
        iface.mapCanvas().zoomScale(500)

layer = iface.activeLayer()
features = layer.getFeatures()
next()