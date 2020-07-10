FROM centos:7
LABEL version="1.0"  
LABEL maintainer="hanafeevrus@gmail.com"
RUN yum update && yum upgrade && yum install -y curl
COPY flatris /etc/flatris
RUN curl --silent --location https://rpm.nodesource.com/setup_10.x | sudo bash -
RUN curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo && sudo rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg
RUN yum install nodejs yarn
RUN yarn add /etc/flatris/package.json && yarn build
EXPOSE 3000
CMD yarn start
