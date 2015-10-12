FROM phusion/baseimage:0.9.15

ENV HOME /root

RUN apt-get update -qq && apt-get install -y -qq git curl wget

# Install HHVM
RUN wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -
RUN echo deb http://dl.hhvm.com/ubuntu trusty main | tee /etc/apt/sources.list.d/hhvm.list
RUN apt-get update -qq && apt-get install -y -qq hhvm

# Install composer
RUN bash -c "wget http://getcomposer.org/composer.phar && mv composer.phar /usr/local/bin/composer"

#RUN mkdir /root/.ssh
#RUN chmod 600 /root/.ssh

RUN echo `ssh-keyscan github.com` >> /root/.ssh/known_hosts
WORKDIR /srv

ENTRYPOINT ["hhvm", "/usr/local/bin/composer"]
