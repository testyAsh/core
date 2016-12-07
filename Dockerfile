FROM library/ubuntu:14.04

RUN mkdir /code

ADD . /code

WORKDIR /code

RUN \
    apt-get -qq update && \
    apt-get -qq install -y \
        python \
        python-dev \ 
        python-setuptools

RUN \ 
	apt-get -qq install -y \
        libmysqlclient-dev \
        mysql-client \
        mysql-server 

RUN easy_install pip

RUN pip install -q -r requirements.txt

EXPOSE 5000

CMD ./run.py