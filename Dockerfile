FROM codemdd/ubuntu-deploy-basic:0.2
MAINTAINER Jonathan Melville <jonathan@jonathanmelville.com>

# Update apt repos for Nodejs and Yarn
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y yarn nodejs
RUN yarn global add gulp-cli

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
