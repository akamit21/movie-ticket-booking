# Ticket Booking App

This is a sample Online Movie Ticket Booking website to help the customers to book online tickets for a movie. It is build HTML, CSS, JavaScript, Flask, MySQl and Rest-API.

## Getting started

### Import Database

First create a datebase by name movie.
Steps:

```bash
mysql -u root -p
CREATE DATABASE movie;

mysql -u username -p movie < movie.sql
```

### Backend

First import database

```bash
export FLASK_DEV=development
export FLASK_APP=server.py
export FLASK_DEBUG=1
flask run
```

### Amit Kumar
