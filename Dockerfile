# Use the official Python 3.8 slim image as the base image
FROM python:3.10-slim
# Set the working directory within the container
WORKDIR /backend
COPY requirements.txt .
# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt
# Copy the necessary files and directories into the container
COPY . .
WORKDIR /backend/app
# Expose port 5000 for the Flask application
EXPOSE 8000
# Define the command to run the Flask application using Gunicorn
CMD [ "gunicorn", "app:app", "-b", "0.0.0.0:8000", "-w", "4"]