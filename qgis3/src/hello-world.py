import geopandas as gpd
import matplotlib.pyplot as plt

from qgis.core import QgsApplication, QgsVectorLayer, QgsProcessingFeedback
from processing.core.Processing import Processing
import processing

Processing.initialize()

input_vector = QgsVectorLayer("qgis3/data/test.geojson")
output_filename = "qgis3/output/vertices.geojson"
params = {
    'INPUT': input_vector,
    'OUTPUT': output_filename
}
feedback = QgsProcessingFeedback()

processing.run("native:extractvertices", params, feedback=feedback)

gdf = gpd.read_file(output_filename)
gdf.plot()

plt.savefig('qgis3/output/test.jpg')
