FROM python:3.10-slim

# Pull in CLI args
ARG SERVICE_ADDRESS=0.0.0.0
ARG SERVICE_PORT=8080

# Set working directory
WORKDIR /app

# Copy in service code
COPY ./src /app/src

# Copy in requirements file
COPY requirements.txt /app/requirements.txt

# Install python dependencies
RUN python -m pip install --no-cache-dir -r requirements.txt

# Expose the service port
EXPOSE ${SERVICE_PORT}

# Run the service
CMD ["python","src/app.py","--service-address",${SERVICE_ADDRESS},"--service-port",${SERVICE_PORT}]