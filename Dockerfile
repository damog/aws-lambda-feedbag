FROM lambci/lambda:build-ruby2.5

RUN gem install nokogiri
RUN gem install feedbag

RUN gem update bundler

CMD "/bin/bash"
