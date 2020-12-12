FROM alpine AS builder
RUN apk add gcc musl-dev \
	&& install -o root -g root -m 755 -d /app \
	&& install -o root -g root -m 755 -d /app/bin \
	&& install -o root -g root -m 755 -d /app/src
COPY lemon.c /app/src/
RUN gcc -o /app/bin/lemon /app/src/lemon.c \
	&& chmod 755 /app/bin/lemon \
	&& chown root:root /app/bin/lemon

FROM alpine
COPY --from=builder /app/bin/lemon /app/bin/lemon
