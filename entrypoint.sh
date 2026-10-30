#!/bin/sh
PORT=${PORT:-8080}
echo "🌸 Server Fortran aktif di port $PORT..."
exec socat TCP-LISTEN:$PORT,fork,reuseaddr EXEC:/app/web_fortran
