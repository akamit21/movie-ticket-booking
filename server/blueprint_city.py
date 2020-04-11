from flask import Blueprint
from flask import request, jsonify
from db import connection

city = Blueprint("city", __name__)


@city.route("/list", methods=["GET"])
def getCityList():
    try:
        _, cursor = connection()
        cursor.execute(
            """SELECT * FROM cities""")
        result = cursor.fetchall()
        return jsonify({"error": False, "message": "SUCCESS", "result": result}), 200
    except Exception as e:
        print(str(e))
        return jsonify({"error": True, "message": "Error " + str(e)}), 400
    finally:
        cursor.close()
