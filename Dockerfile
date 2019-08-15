FROM ruby:2.6.3-alpine3.9 as builder
RUN apk --update add --virtual build-dependencies \
    build-base \
    curl-dev \
    mysql-dev \
    linux-headers
RUN gem install bundler
WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
ENV BUNDLE_JOBS=4
RUN bundle install
RUN apk del build-dependencies

FROM ruby:2.6.3-alpine3.9
ENV APP_HOME /webapp
RUN apk --update add \
    bash \
    nodejs \
    mariadb-dev \
    tzdata \
    imagemagick \
    && rm -f /usr/lib/libmysqld* \
    && gem install bundler \
    && mkdir -p $APP_HOME
WORKDIR /tmp
COPY --from=builder /usr/local/bundle /usr/local/bundle
WORKDIR $APP_HOME
COPY . $APP_HOME