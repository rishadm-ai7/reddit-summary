# Use the official Python image from the Docker Hub
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy the requirements.txt file
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port Streamlit and FastAPI will run on
EXPOSE 8501
EXPOSE 8000

RUN chmod +x start_services.sh

# Start both Streamlit and FastAPI using a shell script
CMD ["./start_services.sh"]
