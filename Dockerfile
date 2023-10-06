#image to use version linux with node installed
FROM node:19.2-alpine3.17 as dependecies

#cd /app
WORKDIR /app
#copy file to app folder
COPY  package.json ./
#install dependencies
RUN  npm install



FROM node:19.2-alpine3.17 as build
WORKDIR /app
COPY --from=dependecies /app/node_modules ./node_modules
COPY . .
RUN npm run test

# pre build prod dependencies
FROM node:19.2-alpine3.17 as pre-prod
WORKDIR /app
COPY package.json .
RUN npm install --prod


#Last stage
FROM node:19.2-alpine3.17 as runner
WORKDIR /app
COPY --from=pre-prod /app/node_modules ./node_modules
COPY app.js ./
COPY task/ ./task

#Command that will execute once the image is create a container
CMD ["node","app.js"]


