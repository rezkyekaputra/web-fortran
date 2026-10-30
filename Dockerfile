FROM alpine:latest

# Install gfortran, socat, dan compiler toolchain
RUN apk add --no-cache gfortran musl-dev socat

WORKDIR /app
COPY app.f90 entrypoint.sh ./

# Compile kode Fortran onii-chan dengan optimasi O3 dan baris bebas panjang
RUN gfortran -O3 -ffree-line-length-none app.f90 -o web_fortran && chmod +x entrypoint.sh web_fortran

# Port default yang diharapkan Google Cloud Run
EXPOSE 8080

CMD ["./entrypoint.sh"]
