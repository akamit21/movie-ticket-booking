# Ticket Booking App

This is a sample blog I created as to get started with React and Flask.
It shows how to simply use the redux, route and flask-API.

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
