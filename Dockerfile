# Use the official image as a parent image
FROM ubuntu:latest

# Set the working directory
WORKDIR /usr/src/app

# Copy the file from your host to your current location of container
COPY gem /usr/src/ruby/

# Run the command to install Ruby and Nginx both by this single command.
RUN apt-get update && apt-get install ruby -y && apt-get install nginx -y

# CMD command to start Nginx services
CMD ["nginx", "-g", "daemon off",]

# Run the gem command to install Sinatra App
RUN gem install sinatra

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 80

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . .

