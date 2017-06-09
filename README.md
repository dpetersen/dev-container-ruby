# dev-container-ruby

[![Docker Hub](https://img.shields.io/badge/docker-ready-blue.svg)](https://registry.hub.docker.com/u/dpetersen/dev-container-ruby/)
[![](https://badge.imagelayers.io/dpetersen/dev-container-ruby.svg)](https://imagelayers.io/?images=dpetersen%2Fdev-container-ruby:latest,dpetersen%2Fdev-container-base:latest 'Get your own badge on imagelayers.io')

A container, based on [dev-container-base](https://github.com/dpetersen/dev-container-base), for developing in Ruby. A recent stable Ruby is installed by default, and more can be installed and managed with [rbenv](https://github.com/sstephenson/rbenv).

## Usage

The base container starts an SSH server, so you can read more about that in [its README](https://github.com/dpetersen/dev-container-base). You'll probably want to volume mount a directory to hold your code, so your changes are easy to get to if you shut down the container.

I usually start it with something like:

```bash
docker run -d \
  -e AUTHORIZED_GH_USERS="dpetersen" \
  -p 0.0.0.0:31981:22 \
  -v `pwd`:/home/dev/ruby \
  dpetersen/dev-container-ruby:latest
```
I'd advise you to set up an SSH alias as [explained here](https://github.com/dpetersen/dev-container-base#connecting).

## Development

Helpful reminders on how to build, tag, and push this can be found in [the Development section](https://github.com/dpetersen/dev-container-base#development) of the other image.
