FROM arm32v7/python:3.7-slim-buster

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    #python3 \
    gcc \
    python3-dev \
    python3-pip \
    gfortran \
    libxml2 \
    libxml2-dev \
    libssl-dev \
    libxslt-dev \
    libturbojpeg-dev\
    libffi-dev\
    g++ \
    zlib1g-dev\
    musl-dev \
    python3-statsmodels-lib \
    libatlas-base-dev \ 
    libhdf5-dev \
    libhdf5-serial-dev \
    libqtgui4 \
    libqt4-test \
    python3-numpy \ 
    libopenjp2-7 \ 
    libopenjp2-7-dev

COPY requirements.txt /app/

#RUN python3 -m pip install -U pip
RUN pip install --upgrade cython
#RUN pip install opencv-python 
RUN python3 -m pip install --index-url=https://www.piwheels.org/simple --no-cache-dir -r requirements.txt

COPY . /app/

# Pass parameters to the container run or mount your config.json into /app/
ENTRYPOINT [ "python3", "-u", "pycryptobot.py" ]
