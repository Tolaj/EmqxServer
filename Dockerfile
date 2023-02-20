FROM alpine:latest

# Copy the .sh file into the container
COPY hello.sh /

# Make the .sh file executable
RUN chmod +x /hello.sh

# Run the .sh file when the container starts
CMD ["/hello.sh"]