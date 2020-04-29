FROM alpine AS builder
COPY lemon.c lempar.c lempar.php /app/
RUN apk add gcc musl-dev \
	&& cd /app \
	&& gcc -o lemon lemon.c \
	&& rm /app/lemon.c \
	&& chmod 755 /app/lemon \
	&& chown root:root /app/lemon

FROM alpine
COPY --from=builder /app /app
WORKDIR /src
ENTRYPOINT ["/app/lemon"]
