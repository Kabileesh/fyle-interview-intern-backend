# Flask Backend Application

This repository contains a Flask backend application using **gunicorn**, **SQLite**, and **pytest** for testing. The application can be run locally or through Docker for easier setup and deployment.

## Installation

1. Fork this repository to your github account
2. Clone the forked repository and proceed with steps mentioned below
 
## 1. Docker Setup:
## Pre-requisites:
Ensure the following tools are installed on your machine:

* [Docker](https://docs.docker.com/desktop/)
* [Docker Compose](https://docs.docker.com/compose/install/)

## Build and Run the Application Using Docker Compose:
### a) Start the Application:
To build and start the Docker container, run the following commands in the root of your application:

```
docker-compose build

docker-compose up
```

This command will:
* Build the Docker image for the Flask application.
* Start the application container, exposing it on port **7755**.

You can now access the application at: **http://localhost:7755**

### b) Stop the Application:
To stop and remove the containers, run:
```
docker-compose down
```

### Additional Guides:
* To run the containers in the background: ``` docker-compose up -d ```
* To force a rebuild without cache: ``` docker-compose build --no-cache ```

<hr>

## 2. Local Setup (Without Docker):
### Install requirements

```
virtualenv env --python=python3.8
source env/bin/activate
pip install -r requirements.txt
```
### Reset DB

```
export FLASK_APP=core/server.py
rm core/store.sqlite3
flask db upgrade -d core/migrations/
```
### Start Server

```
bash run.sh
```
### Run Tests

```
pytest -vvv -s tests/

# for test coverage report
# pytest --cov
# open htmlcov/index.html
```
