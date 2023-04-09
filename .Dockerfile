FROM golang:1.17-alpine
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o main .
RUN apk add --no-cache git
RUN go get github.com/cosmtrek/air
CMD ["air"]