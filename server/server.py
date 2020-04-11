from flask import Flask
from flask import Request, Response, jsonify
from flask_cors import CORS

from blueprint_city import city
from blueprint_movie import movie

app = Flask(__name__)
app.register_blueprint(city, url_prefix="/city")
app.register_blueprint(movie, url_prefix="/movie")

CORS(app)
# base route
@app.route("/")
def home():
    return ("Server is running ... ")


# run server
if __name__ == "__main__":
    app.run(debug=1)
