# Use uma imagem base com Node.js 16.x
FROM node:16-alpine

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

RUN ls -la /app

# Instale a versão específica do npm (8.19.4)
RUN npm install -g npm@8.19.4

# Verifique a versão instalada do npm
RUN npm --version

# Copie os arquivos de dependências
COPY package*.json ./

# Instale as dependências do projeto com legacy-peer-deps para evitar conflitos
RUN npm install --legacy-peer-deps

# Copie o restante do código da aplicação
COPY . .

# Compile a aplicação (se for necessário para o Vue.js)
RUN npm run start

# Exponha a porta da aplicação
EXPOSE 8080

# Comando para rodar a aplicação
CMD ["npm", "run", "serve"]
