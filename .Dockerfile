# Set base image
FROM golang:latest

# Set working directory
WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the source code from the current directory to the working Directory inside the container
COPY . .

# Install air
RUN go get -u github.com/cosmtrek/air

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["air"]