# FROM node:18.15.0-alpine

# WORKDIR /app

# COPY package.json package-lock.json ./

# RUN npm install

# COPY . .

# CMD ["npm", "run", "dev"]

# EXPOSE 3333

FROM node:18.15.0-alpine

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build

COPY .env build/.env

WORKDIR /app/build

RUN npm ci --production

CMD ["node", "server.js"]

EXPOSE 3333