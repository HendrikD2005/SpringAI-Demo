
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    python3-pip \
    python3-dev \
    && apt-get clean

RUN curl -fsSL https://ollama.com/install.sh | sh

WORKDIR /workspace

CMD ["bash", "-c", "ollama start & ollama run deepseek-r1"]