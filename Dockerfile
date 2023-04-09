FROM golang:1.17-alpine

# set working directory
WORKDIR /golang-fiber

# install Comstreak Air
RUN apk update && apk add curl git && \
    curl -sL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b /usr/local/bin

# install PostgreSQL client
RUN apk add --no-cache postgresql-client

# copy go.mod and go.sum files
COPY go.mod go.sum ./

# download Go modules
RUN go mod download

# copy source code
COPY . .

# run the application with hot reload using Comstreak Air
CMD ["air"]
