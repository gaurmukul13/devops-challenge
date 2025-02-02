# devops-challenge
# SimpleTimeService

A simple Flask-based microservice that returns the current timestamp and the visitor's IP address in JSON format.
Flask is used to create the web server.
The root endpoint (/) will return the current timestamp and the IP address of the client in JSON format.

# Requirements and  Install dependencies
Docker, python, flask
RUN pip install --no-cache-dir Flask

# Dockerfile 
The Dockerfile uses a slim Python base image, installs the required dependencies, and sets up a non-root user.
The application will run on port 8080.

# Build and Run the Application
command to build 
docker build -t simpletimeservice .
docker run -p 8080:8080 simpletimeservice

#DockerHub
command to push the image to dockerhub
docker tag simpletimeservice gaurmukul378/simpletimeservice:latest
docker push gaurmukul378/simpletimeservice:latest


# You can also pull the image from DockerHub:
After pushing the code and the Docker image, you can test by pulling the image from DockerHub:

docker pull gaurmukul378/simpletimeservice:latest
docker run -p 8080:8080 gaurmukul378/simpletimeservice:latest
output - {"ip":"172.17.0.1","timestamp":"2025-02-02T08:52:05.790160"}