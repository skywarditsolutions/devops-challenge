############################
## BUILD
############################
FROM python:3.10-slim as builder

# Copy in service code
COPY ./src /app/src

# Copy in requirements file
COPY requirements.txt /app/requirements.txt

# Set working directory
WORKDIR /app

# Setup python virtualenv
RUN python -m venv .env &&\
    . .env/bin/activate &&\
    python -m pip install --upgrade pip setuptools &&\
    python -m pip install --no-cache-dir -r requirements.txt


############################
## RELEASE
############################
FROM scratch as release

# Handle args
ARG SERVICE_ADDRESS=0.0.0.0
ARG SERVICE_PORT=8000
ENV SERVICE_ADDRESS=${SERVICE_ADDRESS}
ENV SERVICE_PORT=${SERVICE_PORT}

# Set path
ENV PATH=/usr/local/bin:$PATH

# Pull in app directory from builder
COPY --from=builder /app /app

# Set the working directory
WORKDIR /app

# Expose the service port
EXPOSE ${SERVICE_PORT}

# Run the service
CMD ["src/app.py --service-address $SERVICE_ADDRESS --service-port $SERVICE_PORT"]