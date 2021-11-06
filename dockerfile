FROM ubuntu:18.04
RUN apt-get update && apt-get install \
  -y python3
RUN apt-get -y install python3-pip

# Install dependencies:
COPY requirements.txt .
RUN pip3 install -r requirements.txt
