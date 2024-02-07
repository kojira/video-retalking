FROM pytorch/pytorch:2.2.0-cuda12.1-cudnn8-runtime

RUN mkdir /work
WORKDIR /work
ADD . /work

RUN apt-get update \
  && apt-get install -y locales locales-all

ENV LANG="ja_JP.UTF-8" \
  LANGUAGE="ja_JP:ja" \
  LC_ALL="ja_JP.UTF-8"

RUN apt-get install -y wget

RUN wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh &&\
  bash Anaconda3-2023.09-0-Linux-x86_64.sh -b

ENV PATH $PATH:/root/anaconda3/bin

# RUN pip install --upgrade pip
# COPY ./requirements.txt .
# RUN pip install -r requirements.txt

# RUN apt-get install -y git g++

# RUN mkdir /var/work
# WORKDIR /var/work
# RUN git clone -b 0.60.0dev0 https://github.com/numba/numba.git
# WORKDIR /var/work/numba
# RUN pip install -e .
