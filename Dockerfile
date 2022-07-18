FROM ruby:3.1.2 AS rails-toolbox

RUN apt-get update -qq && apt-get install -y postgresql-client
WORKDIR /acars_api
COPY Gemfile /acars_api/Gemfile
COPY Gemfile.lock /acars_api/Gemfile.lock
RUN bundle install
RUN chown -R $USER:$USER /acars_api

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]