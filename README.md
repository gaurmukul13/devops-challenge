# devops-challenge
# SimpleTimeService

A simple Flask-based microservice that returns the current timestamp and the visitor's IP address in JSON format.

## Requirements
- Docker

## Build and Run the Application

command to build 
# docker build -t simpletimeservice .
# docker run -p 8080:8080 simpletimeservice


# output - {"ip":"172.17.0.1","timestamp":"2025-02-02T08:52:05.790160"}

DockerHub
You can also pull the image from DockerHub:

docker pull gaurmukul378/simpletimeservice:latest



After pushing the code and the Docker image, you can test by pulling the image from DockerHub:

```bash
docker pull gaurmukul378/simpletimeservice:latest