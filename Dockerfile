From ubuntu:latest
RUN useradd  --user-group --create-home --shell /bin/zsh developer
RUN mkdir /home/developer/.ssh /home/developer/.aws /home/developer/bin
RUN chmod 700 /home/developer/.ssh
RUN chown developer:developer /home/developer/.ssh
RUN chmod 700 /home/developer/.aws
RUN chown developer:developer /home/developer/.aws
RUN chmod 700 /home/developer/bin
RUN chown developer:developer /home/developer/bin
RUN echo 'TZ=JST-9' >> /home/developer/.zshrc
RUN echo 'eval "$(rbenv init - zsh)"' >> /home/developer/.zshrc
RUN apt-get update -qq && apt-get install -y \
zsh build-essential libpq-dev imagemagick \
gettext-base python python-dev \
curl groff \
rbenv ruby-build \
git sudo vim ssh direnv git wine-stable \
&& apt-get clean
RUN curl https://bootstrap.pypa.io/get-pip.py | python
RUN pip install awscli
RUN wget -O "/home/developer/bin/saml2aws.tar.gz" https://github.com/Versent/saml2aws/releases/download/v2.6.2/saml2aws_2.6.2_linux_amd64.tar.gz
RUN cd /home/developer/bin && tar xf saml2aws.tar.gz
RUN rm -f /home/developer/bin/saml2aws.tar.gz
RUN chmod 750 /home/developer/bin/saml2aws
RUN chown developer:developer /home/developer/bin/saml2aws
# set sudo nopassword 
RUN echo "developer  ALL=NOPASSWD: ALL" > /etc/sudoers.d/developer
RUN chmod 600 /etc/sudoers.d/developer
ENV LANG=ja_JP.UTF-8
WORKDIR /home/developer
USER developer
