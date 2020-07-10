# flatris_on_docker
#### fork repo https://github.com/timurb/flatris#setup-and-running
готовый собранный образ на основе centos7 можно скачать с репозитария https://hub.docker.com/repository/docker/hanafeevrus/centos7_flatris    
#### Задача   
Тестовое задание: Есть проект https://github.com/timurb/flatris.git - необходимо его собрать и запаковать в Docker контейнер и предоставить публичную ссылку на рабочий вариант   
#### Реализация
#### Описание создания Dockerfile    
#скачивает официальный контейнер Centos7    
`FROM centos:7`   
#ставит лэйбл версия и сопровождающий    
`LABEL version="1.0"`   
`LABEL maintainer="hanafeevrus@gmail.com"`    
#копирует приложение    
`COPY flatris /etc/flatris`   
#включает репозитарий nodesource    
`RUN curl --silent --location https://rpm.nodesource.com/setup_10.x | bash -`   
#включает репозитарий yarn.repo и ипортирует ключ репозитария   
`RUN curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo && rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg`    
#устанавливает nodejs   
`RUN yum install nodejs yarn -y`    
#проваливается в директорию где лежит package.json устанавливает зависимости описанные в пакете   
`RUN cd /etc/flatris/ && yarn add package.json`   
#проваливается в директорию и запускает компиляцию    
`RUN cd /etc/flatris/ && yarn build`    
#запускает прослушивание 3000 порта   
`EXPOSE 3000`   
#запускает yarn
`CMD cd /etc/flatris/ && yarn start`    

#### Запуск    
* скачиваете контейнер    
`docker pull hanafeevrus/centos7_flatris`   
* запускаем контейнер и делаем проброс порта 3000   
`docker run -p 3000:3000 hanafeevrus/centos7_flatris`   
* проверка в браузере https://localhost:3000    


![screen](https://github.com/Hanafeevrus/flatris_on_docker/blob/master/photoeditorsdk-export%20(6).png)
