FROM dpetersen/dev-container-base:latest
MAINTAINER Don Petersen <don@donpetersen.net>

# Much of this is borrowed from:
# https://github.com/tcnksm/dockerfile-rbenv

RUN sudo apt-get update

# Probably neccessary for compiling ruby and/or gems
RUN sudo apt-get install -y \
  zlib1g-dev \
  libssl-dev \
  libreadline-dev \
  libyaml-dev \
  libxml2-dev \
  libxslt-dev \
  libffi-dev \
  libsqlite3-dev \
# for postgres gem
  libpq-dev \
# updated SSL root certs
  ca-certificates \
# pretty much no asset pipeline without this
  nodejs

# rbenv is set up in my shell via an oh-my-zsh plugin
RUN git clone https://github.com/rbenv/rbenv.git /home/dev/.rbenv
RUN git clone https://github.com/rbenv/ruby-build.git /home/dev/.rbenv/plugins/ruby-build
ENV PATH /home/dev/.rbenv/bin:$PATH

RUN rbenv install 2.3.1
RUN rbenv global 2.3.1
