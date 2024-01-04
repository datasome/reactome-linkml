FROM python:3.9-slim

# install git
RUN apt-get update && apt-get install -y --no-install-recommends git
RUN apt-get -y install gcc

RUN pip install linkml

COPY . ./

# Print out functionality available for all the scripts in the image
CMD ./help.py
