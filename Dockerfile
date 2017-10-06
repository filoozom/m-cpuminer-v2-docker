FROM ubuntu:16.04
MAINTAINER Philippe Schommers <philippe@schommers.be>

RUN apt-get update -qq && \
	apt-get install -qqy --no-install-recommends build-essential automake libcurl4-openssl-dev git ca-certificates libgmp-dev && \
	git clone https://github.com/magi-project/m-cpuminer-v2.git && \
	cd m-cpuminer-v2 && \
	./autogen.sh && \
	./configure CFLAGS="-O3" && \
	make && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /m-cpuminer-v2
ENTRYPOINT ["./m-minerd"]
