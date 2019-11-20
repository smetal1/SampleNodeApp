
FROM node:7

COPY . .

RUN npm install

CMD ["npm", "start"]