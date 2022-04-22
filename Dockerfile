FROM golang:1.18-alpine as builder

WORKDIR /app
COPY go.* ./
RUN go mod download

COPY . .

RUN go build .

FROM alpine:3.15 as runner

WORKDIR /app
COPY --from=builder /app ./

ENTRYPOINT ["./main"]

