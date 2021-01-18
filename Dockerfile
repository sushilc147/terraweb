FROM ubuntu:16.04

ARG TAG=swan
ENV env_var_name=$TAG
ENV TERRAFORM_VERSION=0.13.6
#ENV TERRAFORM_VERSION=0.15.0-alpha20210107

ARG AWS_ACCESS_KEY_ID=test
ENV access_key=$AWS_ACCESS_KEY_ID

ARG AWS_SECRET_ACCESS_KEY=test2
ENV secret_key=$AWS_SECRET_ACCESS_KEY

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
	ntp \
  && rm -rf /var/lib/apt/lists/*
#RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_386.zip && \
    #unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \ 
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin
#COPY ./abc /$TAG/
#RUN echo $TAG

#COPY ./abc /$env_var_name/
RUN echo $env_var_name

#COPY ./abc /$TAG/
#COPY ./tf_aws.tf /$TAG/
WORKDIR /tmp/
RUN echo "hello"
RUN echo `pwd`
RUN echo `ls -las`
RUN echo `ntpq -p`

RUN echo $access_key

RUN echo $secret_key
