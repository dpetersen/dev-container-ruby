FROM dpetersen/dev-container-base:latest
MAINTAINER Don Petersen <don@donpetersen.net>

# Much of this is borrowed from:
# https://github.com/tcnksm/dockerfile-rbenv

RUN apt-get update

# Probably neccessary for compiling ruby and/or gems
RUN apt-get install -y zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev

# You'll probably need it
RUN apt-get install -y libsqlite3-dev

# rbenv is set up in my shell via an oh-my-zsh plugin
RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN /root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH

RUN rbenv install 2.2.2
RUN rbenv global 2.2.2
RUN gem install --no-rdoc --no-ri bundler
