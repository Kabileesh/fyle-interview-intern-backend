# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container at /app
COPY . .

# Make run.sh executable
RUN chmod +x run.sh

# Expose the port the app runs on
EXPOSE 7755

# Command to run the application
CMD ["bash", "run.sh"]
