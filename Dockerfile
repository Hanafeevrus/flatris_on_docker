FROM centos:7
LABEL version="1.0"  
LABEL maintainer="hanafeevrus@gmail.com"
COPY flatris /etc/flatris
RUN curl --silent --location https://rpm.nodesource.com/setup_10.x | bash -
RUN curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo && rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg
RUN yum install nodejs yarn -y
RUN cd /etc/flatris/ && yarn add package.json
RUN cd /etc/flatris/ && yarn build
EXPOSE 3000
CMD cd /etc/flatris/ && yarn start
