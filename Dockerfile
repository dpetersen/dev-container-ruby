FROM dpetersen/dev-container-base:v1.5
MAINTAINER Don Petersen <don@donpetersen.net>

# Much of this is borrowed from:
# https://github.com/tcnksm/dockerfile-rbenv

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
# pretty much no asset pipeline without this
  nodejs

# rbenv is set up in my shell via an oh-my-zsh plugin
RUN git clone https://github.com/rbenv/rbenv.git /home/dev/.rbenv
RUN git clone https://github.com/rbenv/ruby-build.git /home/dev/.rbenv/plugins/ruby-build
ENV PATH /home/dev/.rbenv/bin:$PATH

RUN rbenv install 2.4.1
RUN rbenv global 2.4.1

# it's difficult to install gems (like bundler, which I wanted to do) at this
# point. You need a real shell with rbenv, which is a shell alias and not a
# real executable. I'm sure it's possible, but I gave up.
