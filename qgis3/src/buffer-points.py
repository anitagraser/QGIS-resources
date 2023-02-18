import dvc.api
import geopandas as gpd
import matplotlib.pyplot as plt

from qgis.core import QgsVectorLayer
from processing.core.Processing import Processing
import processing

Processing.initialize()

params = dvc.api.params_show()
buffer_size = params['buffer-points']['size']

input_vector = QgsVectorLayer("qgis3/output/random-points.geojson")
output_filename = "qgis3/output/buffered-points.geojson"

results = {}
outputs = {}

alg_params = {
    'DISSOLVE': False,
    'DISTANCE': buffer_size,
    'END_CAP_STYLE': 0,  # Round
    'INPUT': input_vector,
    'JOIN_STYLE': 0,  # Round
    'MITER_LIMIT': 2,
    'SEGMENTS': 5,
    'OUTPUT': output_filename
}
outputs['Buffer'] = processing.run('native:buffer', alg_params)

gdf = gpd.read_file(output_filename)
gdf.plot()

plt.savefig('qgis3/output/buffered-points.png')
