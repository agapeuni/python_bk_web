from http.server import HTTPServer
from http.server import BaseHTTPRequestHandler

class MyHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response_only(200, 'OK')
        self.send_header('Content-Type', 'text/plain')
        self.end_headers()
        self.wfile.write(b"Hello World 2")


if __name__ == '__main__':    
    server = HTTPServer(('', 8888), MyHandler)
    server.serve_forever()

    print("Started WebServer on port 8888...")
    print("Press ^C to quit WebServer.")
