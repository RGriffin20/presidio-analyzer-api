FROM python:3.10-slim

WORKDIR /app

# Copy only analyzer code
COPY presidio-analyzer /app/

# Install required packages manually
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 3000 for the REST API
EXPOSE 3000

# Start the analyzer API server
CMD ["python", "app.py"]
