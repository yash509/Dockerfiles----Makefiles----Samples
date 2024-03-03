############################################
# For JavaScript and NodeJS based Projects #  
############################################


FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Bundle app source
COPY . .

EXPOSE 5000

CMD [ "node", "app.js" ]
