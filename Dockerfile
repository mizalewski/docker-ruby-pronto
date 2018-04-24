FROM ruby:2.5.1-alpine3.7

ENV BUILD_PACKAGES bash ruby-dev build-base cmake
ENV RUNTIME_PACKAGES git

RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $RUNTIME_PACKAGES && \
    rm -rf /var/cache/apk/*

RUN gem install yamllint
RUN gem install pronto
RUN git clone https://github.com/mizalewski/pronto-rubocop.git && cd pronto-rubocop && \
    git checkout -b offences-for-whole-block origin/offences-for-whole-block && \
    bundle install --path vendor/bundle && rake build
RUN gem install pronto-brakeman pronto-fasterer pronto-flay pronto-poper pronto-rails_best_practices pronto-reek \
    pronto-scss pronto-slim pronto-yamllint
