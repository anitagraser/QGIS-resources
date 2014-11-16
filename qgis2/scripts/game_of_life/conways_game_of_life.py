import processing
import time
from PyQt4.QtCore import *
 
class GameOfLife(QObject):
   
    def __init__(self,steps,alive_field):
        QObject.__init__(self)
        #self.input = "C:/Users/anita_000/Dropbox/QgisSandbox/grid15.shp"
        self.input = "C:/Users/anita_000/Dropbox/QgisSandbox/gosper_glidergun.csv"
        self.input_layer = processing.load(self.input)
        self.input_layer.loadNamedStyle("C:/Users/anita_000/Dropbox/QgisSandbox/conways_game_of_life.qml")
        self.alive_field = alive_field
        self.index = QgsSpatialIndex()
        self._state = 0
        self.anim = QPropertyAnimation(self, "state")
        self.anim.setStartValue(0)
        self.anim.setEndValue(steps)
        self.anim.setDuration(5000)
        self.anim.valueChanged.connect(self.computeNextStep)

    @pyqtProperty(int)
    def state(self):
        return self._state

    @state.setter
    def state(self, value):
        self._state = value
       
    def countLivingNeighbors(self,cell):
        cell_geom = cell.geometry()
        living_neighbors = 0
        nearest = self.index.nearestNeighbor(cell.geometry().centroid().asPoint(),8)
        #for id in nearest: 
        req = QgsFeatureRequest().setFilterFids(nearest)
        f = self.input_layer.getFeatures(request=req)
        for feature in f:
            if cell_geom.touches(feature.geometry()):
                living_neighbors += feature[self.alive_field]
        return living_neighbors
       
    def getNewState(self,cell_state,living_neighbors):
        new_state = 0
        if cell_state and living_neighbors < 2:
            pass
        elif cell_state and living_neighbors < 4:
            new_state = 1
        elif cell_state:
            pass
        elif living_neighbors == 3:
            new_state = 1
        else:
            pass
        return new_state
       
    def computeNextStep(self,alive_field='alive'):
        self.anim.pause()
        print self.anim.currentValue() 
        i = self.anim.currentValue()
        l = QgsVectorLayer("Polygon?crs=epsg:4326&field=%s:integer" %(self.alive_field), "step%d" %(i), "memory")
        if not l.isValid():
            raise Exception("Failed to create memory layer")
        mem_layer_provider = l.dataProvider()
        
        self.index = QgsSpatialIndex()
        for cell in self.input_layer.getFeatures():
            self.index.insertFeature(cell)
 
        for cell in self.input_layer.getFeatures():
            cell_state = cell[self.alive_field]
            living_neighbors = self.countLivingNeighbors(cell)
            new_state = self.getNewState(cell_state,living_neighbors)
            output_feature = QgsFeature()
            output_feature.setGeometry(cell.geometry())
            attrs = [new_state]
            output_feature.setAttributes(attrs)
            mem_layer_provider.addFeatures([output_feature])
 
        QgsMapLayerRegistry.instance().addMapLayer(l)
        l.loadNamedStyle("C:/Users/anita_000/Dropbox/QgisSandbox/conways_game_of_life.qml")
        self.input_layer =  l
        #iface.mapCanvas().refresh()
        self.anim.resume()
           
    def run(self):
        self.anim.start()
        
global g
g = GameOfLife(100,'alive')
g.run()