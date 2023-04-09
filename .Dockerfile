# Base image
FROM golang:latest

# Set working directory
WORKDIR /app

# Copy go.mod and go.sum files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the source code from the current directory to the working directory inside the container
COPY . .

# Install Air for live reloading
RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s

# Expose port 8080 to the outside world
EXPOSE 8080

# Run the app using Air
CMD ["./bin/air"]