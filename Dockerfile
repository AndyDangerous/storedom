FROM ruby:2.2.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture)" && chmod +x /usr/local/bin/gosu

WORKDIR /usr/src/app/

COPY Gemfile /usr/src/app/Gemfile
COPY Gemfile.lock /usr/src/app/Gemfile.lock
RUN bundle install

COPY . /usr/src/app

CMD ["rails", "s"]
