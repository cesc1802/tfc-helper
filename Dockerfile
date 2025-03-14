# Use the official Golang image as the base
FROM golang:1.20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files and download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the application code
COPY . .

# Build the tfc-helper binary
RUN go build -o tfc-helper ./main.go

# Set the entry point for the container
ENTRYPOINT ["./tfc-helper"]