import dvc.api

from qgis.core import QgsVectorLayer
from processing.core.Processing import Processing
import processing

Processing.initialize()

params = dvc.api.params_show()
pts_n = params['random-points']['n']

input_vector = QgsVectorLayer("qgis3/data/test.geojson")
output_filename = "qgis3/output/random-points.geojson"

results = {}
outputs = {}

alg_params = {
    'INCLUDE_POLYGON_ATTRIBUTES': True,
    'INPUT': input_vector,
    'MAX_TRIES_PER_POINT': 10,
    'MIN_DISTANCE': 0,
    'MIN_DISTANCE_GLOBAL': 0,
    'POINTS_NUMBER': pts_n,
    'SEED': None,
    'OUTPUT': output_filename
}
outputs['RandomPointsInPolygons'] = processing.run(
    'native:randompointsinpolygons', alg_params)


