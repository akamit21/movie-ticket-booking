from flask import Blueprint
from flask import request, jsonify
from db import connection

movie = Blueprint("movie", __name__)


@movie.route("/list/<int:id>", methods=["GET"])
def getMovieByCity(id):
    try:
        _, cursor = connection()
        cursor.execute(
            """SELECT DISTINCT fk_movie_id, movie_name FROM viewShow WHERE fk_city_id = %s""", (id,))
        result = cursor.fetchall()
        return jsonify({"error": False, "message": "SUCCESS", "result": result}), 200
    except Exception as e:
        print(str(e))
        return jsonify({"error": True, "message": "Error " + str(e)}), 400
    finally:
        cursor.close()


@movie.route("/theatre/<int:city_id>/<int:movie_id>", methods=["GET"])
def getTheatreByCity(city_id, movie_id):
    try:
        _, cursor = connection()
        cursor.execute(
            """SELECT DISTINCT fk_theatre_id, theatre_name FROM viewShow WHERE fk_city_id = %s AND fk_movie_id = %s""", (city_id, movie_id,))
        result = cursor.fetchall()
        return jsonify({"error": False, "message": "SUCCESS", "result": result}), 200
    except Exception as e:
        print(str(e))
        return jsonify({"error": True, "message": "Error " + str(e)}), 400
    finally:
        cursor.close()


@movie.route("/show/<int:city_id>/<int:movie_id>", methods=["GET"])
def getShowByMovie(city_id, movie_id):
    try:
        _, cursor = connection()
        cursor.execute(
            """SELECT * FROM viewShow WHERE fk_city_id = %s AND fk_movie_id = %s""", (city_id, movie_id,))
        result = cursor.fetchall()
        return jsonify({"error": False, "message": "SUCCESS", "result": result}), 200
    except Exception as e:
        print(str(e))
        return jsonify({"error": True, "message": "Error " + str(e)}), 400
    finally:
        cursor.close()


@movie.route("/show/info/<int:id>", methods=["GET"])
def getShowById(id):
    try:
        _, cursor = connection()
        cursor.execute(
            """SELECT * FROM viewShow WHERE id = %s""", (id,))
        result = cursor.fetchall()
        return jsonify({"error": False, "message": "SUCCESS", "result": result}), 200
    except Exception as e:
        print(str(e))
        return jsonify({"error": True, "message": "Error " + str(e)}), 400
    finally:
        cursor.close()


@movie.route("/show/booked/<int:id>", methods=["GET"])
def getBookedTicketById(id):
    try:
        _, cursor = connection()
        cursor.execute(
            """SELECT * FROM tickets WHERE fk_show_id = %s""", (id,))
        result = cursor.fetchall()
        return jsonify({"error": False, "message": "SUCCESS", "result": result}), 200
    except Exception as e:
        print(str(e))
        return jsonify({"error": True, "message": "Error " + str(e)}), 400
    finally:
        cursor.close()


@movie.route("/book", methods=["POST"])
def bookTicket():
    show_id = int(request.json["fk_show_id"])
    date = request.json["date"]
    ticket_number = int(request.json["ticket_number"])
    seats = request.json["seats"]
    amount = int(request.json["amount"])
    try:
        conn, cursor = connection()
        cursor.execute(
            """INSERT INTO tickets (fk_show_id, date, ticket_number, seats, amount) VALUES (%s, %s, %s, %s, %s)""", (show_id, date, ticket_number, (seats), amount))
        conn.commit()
        return jsonify({"error": False, "message": "Ticket booked successfully ..."}), 201
    except Exception as e:
        print(str(e))
        return jsonify({"error": True, "message": "Error " + str(e)}), 400
    finally:
        cursor.close()
