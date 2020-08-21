FROM ruby:2.6.5-alpine

RUN apk update && apk add bash build-base tzdata sqlite-dev

RUN mkdir /project
WORKDIR /project

COPY Gemfile Gemfile.lock ./
RUN gem install bundler --no-document
RUN bundle install --no-binstubs --jobs $(nproc) --retry 3

COPY . .

RUN rm -rf ./db/*.sqlite3

RUN bundle exec rails db:create
RUN bundle exec rails db:migrate
RUN bundle exec rails db:seed

RUN bundle exec rails rswag:specs:swaggerize

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
