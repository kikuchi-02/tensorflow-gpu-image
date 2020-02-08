FROM nvidia/cuda:10.2-devel-ubuntu18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq \
    build-essential libbz2-dev libdb-dev \
    libreadline-dev libffi-dev libgdbm-dev liblzma-dev \
    libncursesw5-dev libsqlite3-dev libssl-dev \
    zlib1g-dev uuid-dev tk-dev wget gcc

# python
WORKDIR /root
RUN wget https://www.python.org/ftp/python/3.7.5/Python-3.7.5.tgz \
    && tar xzvf Python-3.7.5.tgz

WORKDIR /root/Python-3.7.5
RUN ./configure --enable-shared \
    && make \
    && make install \
    && sh -c "echo '/usr/local/lib' > /etc/ld.so.conf.d/custom_python3.conf" \
    && ldconfig

RUN pip3 install --upgrade pip

