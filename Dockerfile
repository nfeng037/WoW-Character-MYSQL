# Use the official Ruby image from the Docker Hub
FROM ruby:3.3.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs npm default-mysql-client
RUN npm install --global yarn

# Install the specified Bundler version
RUN gem install bundler:2.5.6

# Set the working directory inside the container
WORKDIR /myapp

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Install gems
RUN bundle install

# Copy the main application
COPY . /myapp

# Expose port 3000 to the Docker host, so we can access it from the outside.
EXPOSE 3000

# The main command to run when the container starts
CMD ["rails", "server", "-b", "0.0.0.0"]
