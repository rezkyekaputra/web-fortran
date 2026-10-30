#!/usr/bin/env python3
import subprocess
import os
from http.server import HTTPServer, BaseHTTPRequestHandler

PORT = int(os.environ.get("PORT", 8080))
FORTRAN_BIN = os.path.join(os.path.dirname(os.path.abspath(__file__)), "web_fortran")

class FortranHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        try:
            # Eksekusi biner Fortran secara real-time
            output = subprocess.check_output([FORTRAN_BIN])
            
            # Pisahkan HTTP Header dan Body HTML
            if b"\n\n" in output:
                header_part, body = output.split(b"\n\n", 1)
            elif b"\r\n\r\n" in output:
                header_part, body = output.split(b"\r\n\r\n", 1)
            else:
                body = output

            self.send_response(200)
            self.send_header("Content-Type", "text/html; charset=utf-8")
            self.send_header("Content-Length", str(len(body)))
            self.end_headers()
            self.wfile.write(body)
        except Exception as e:
            self.send_response(500)
            self.end_headers()
            self.wfile.write(f"Error: {e}".encode())

    def log_message(self, format, *args):
        # Log ringkas waktu ada pengunjung yang buka web
        print(f"🌸 Ada pengunjung: {self.client_address[0]} - {args[0]}")

if __name__ == "__main__":
    server = HTTPServer(("0.0.0.0", PORT), FortranHandler)
    print(f"🚀 Server FORTRAN onii-chan aktif di http://localhost:{PORT}")
    print("Tekan Ctrl + C untuk mematikan.")
    server.serve_forever()
