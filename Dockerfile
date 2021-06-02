FROM ruby:2.6.3-alpine

RUN apk update && apk add bash && apk add git
WORKDIR /action
COPY Gemfile Gemfile.lock /action/

RUN bundle install
COPY lib /action/lib

#CMD ["ruby", "/action/lib/index.rb"]
COPY squashing.sh /squashing.sh

RUN chmod +x /squashing.sh

ENTRYPOINT ["sh","/squashing.sh", "ruby","/action/lib/index.rb"]