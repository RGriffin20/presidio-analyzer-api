# Use an official lightweight Python image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy presidio-analyzer code
COPY presidio-analyzer/ /app/

# Install presidio-analyzer and its dependencies
RUN pip install --no-cache-dir .

# Expose port 3000 for the analyzer API
EXPOSE 3000

# Start the analyzer
CMD ["python", "-m", "presidio_analyzer"]
