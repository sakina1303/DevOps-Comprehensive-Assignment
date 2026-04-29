FROM node:20-alpine

WORKDIR /app

COPY backend/package*.json ./backend/
COPY frontend/package*.json ./frontend/

RUN cd backend && npm install
RUN cd frontend && npm install

COPY . .

RUN cd frontend && npm run build

WORKDIR /app/backend

EXPOSE 5000

CMD ["node", "server.js"]
