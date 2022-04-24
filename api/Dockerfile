FROM node:alpine
RUN apk add --no-cache git libc6-compat g++ make python3
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
COPY ./ ./
RUN npm i
CMD ["npm", "run", "dev"]
