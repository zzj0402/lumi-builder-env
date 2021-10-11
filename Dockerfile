FROM ubuntu:16.04
ENV TZ=Pacific/Auckland
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata \
    software-properties-common \
    curl \
    vim \
    htop \
    libgl1-mesa-glx \
    libssl-dev \
    openssl \
    wget \
    build-essential \
    git
RUN wget https://www.python.org/ftp/python/3.7.6/Python-3.7.6.tgz
RUN tar xzvf Python-3.7.6.tgz
RUN cd Python-3.7.6 && ./configure && make && make install
RUN update-alternatives --install /usr/bin/python python /usr/local/bin/python3.7 1
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
# COPY ./requirements.txt ./
# RUN pip install -r requirements.txt