# 使用一个较新的 Alpine 版本
FROM node:20-alpine

# 设置工作目录
WORKDIR /app

# 复制package.json和package-lock.json
COPY package*.json ./

# 安装依赖
RUN npm install

# 复制应用代码
COPY . .

# 暴露应用端口
EXPOSE 3000

# 启动应用
CMD ["npm", "start"]
