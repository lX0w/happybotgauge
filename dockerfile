# Use the official Golang image to build the Go application
FROM golang:1.18 as builder

# Set the working directory
WORKDIR /app

# Copy the source code into the container
COPY . .

# Build the Go application
RUN go build -o main .

# Use a minimal base image to reduce the size of the final image
FROM alpine:latest

# Copy the Go binary from the builder stage
COPY --from=builder /app/main /main

# Expose port 8080
EXPOSE 8080

# Command to run the application
CMD ["/main"]
