#!../.env/bin/python

## Libraries
import argparse

from flask import Flask

## Arguments
parser = argparse.ArgumentParser()
parser.add_argument('--service-address', type=str, help="Address to listen on")
parser.add_argument('--service-port', type=int, help="Port to listen on")
args = parser.parse_args()

# Initiate Flask app
app = Flask(__name__)

# Define routes
@app.route('/')
def root():
    message = f"Hello, Skyward Solutions!\n"
    return message    

if __name__ == "__main__":
    # Run web service
    app.run(host=args.service_address, port=args.service_port)