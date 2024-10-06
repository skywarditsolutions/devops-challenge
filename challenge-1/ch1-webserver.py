import http.server
import socketserver
import time
from datetime import datetime

HOST= "0.0.0.0"
PORT = 8000

class HelloWorldHandler(socketserver.BaseRequestHandler):
    def handle(self):
        RESPONSE_CODE = "200"
        self.data = self.request.recv(1024).strip()
        decoded_data = self.data.decode('utf-8')
        current_time = datetime.fromtimestamp(time.time())
        print("{} - - [{}] \"{}\" {} -".format(self.client_address[0], current_time.strftime("%d/%b/%Y %H:%M:%S"), decoded_data.split('\r\n')[0], RESPONSE_CODE))
        self.request.sendall(bytes("Hello, World!", "utf-8"))

#Handler = HelloWorldHandler

with socketserver.TCPServer((HOST, PORT), HelloWorldHandler) as httpd:
    start_time = datetime.fromtimestamp(time.time())
    print(start_time.strftime("%Y-%m-%d %H:%M:%S"), " - HelloWorldServer - [INFO]: Webserver listening: http://" + HOST + ":" + str(PORT))
    httpd.serve_forever()