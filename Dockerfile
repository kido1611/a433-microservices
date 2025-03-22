FROM golang:1.15-alpine AS builder

WORKDIR /go/src/github.com/dicodingacademy/karsajobs
ENV GO111MODULE=on
ENV APP_PORT=8080

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .
RUN mkdir /build; \
  go build -o /build/ ./...

# -------------------------------------------------------
FROM golang:1.15-alpine

# Memberi label pada hasil image
LABEL org.opencontainers.image.description="karsajobs"
LABEL org.opencontainers.image.source="https://github.com/kido1611/a433-microservices"

ENV GO111MODULE=on
ENV APP_PORT=8080

WORKDIR /app
COPY --from=builder /build/web /app/web

EXPOSE 8080

CMD ["/app/web"]
