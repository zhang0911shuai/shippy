FROM golang:alpine as builder

RUN apk update &&  apk upgrade && apk add --no-cache git gcc musl-dev

RUN mkdir /app
WORKDIR /app

ENV GO11MODULE=on

COPY . .
RUN go mod download
RUN CO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o shippy

FROM alpine:latest
RUN apk --no-cache add ca-certificates
RUN mkdir /app
WORKDIR /app
COPY --from=builder /app/shippy .

CMD ["./shippy"]
