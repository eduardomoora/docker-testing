#image to use version linux with node installed
FROM --platform=$BUILDPLATFORM node:19.2-alpine3.17

#cd /app
WORKDIR /app

#copy file to app folder
COPY  package.json ./

#install dependencies
RUN  npm install

#copy the rest of files
COPY . .

RUN  npm run test

RUN  rm -rf tests && rm -rf node_modules

RUN npm install --prod

#Command that will execute once the image is create a container
CMD ["node","app.js"]