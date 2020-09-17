FROM node:12

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

ENV SECRET=Rahasia
ENV GMAIL_USERNAME=
ENV GMAIL_PASSWORD=
ENV DB_USERNAME=root
ENV DB_PASSWORD=abror123
ENV DB_HOST=172.19.0.2
ENV DB_NAME=simple_wms

RUN npx sequelize-cli db:migrate

EXPOSE 8080
CMD [ "node", "app.js" ]