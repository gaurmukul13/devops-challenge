# Start with an official Python base image
FROM python:3.9-slim

# Set environment variables for non-root user
ENV USER=nonrootuser
ENV HOME=/home/$USER

# Create a non-root user and set permissions
RUN adduser --disabled-password --gecos "" $USER \
    && mkdir -p $HOME/app \
    && chown -R $USER:$USER $HOME

# Set the working directory
WORKDIR /home/$USER/app

# Copy the application code to the container
COPY app.py ./

# Install dependencies
RUN pip install --no-cache-dir Flask

# Switch to non-root user
USER $USER

# Expose the port Flask will run on
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
