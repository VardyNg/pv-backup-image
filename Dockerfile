FROM ubuntu:22.04
ARG AWS_CLI_URL
RUN apt update -y
RUN apt install -y curl unzip
RUN curl $AWS_CLI_URL -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN rm -rf awscliv2.zip aws
