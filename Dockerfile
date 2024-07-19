# 使用Node.js官方镜像作为基础镜像
FROM node:20-alpine

# 设置工作目录
WORKDIR /app

# 复制package.json和package-lock.json
COPY package*.json ./


# 安装依赖
RUN npm install

# 构建Next.js应用
RUN npm run build

# 复制所有文件到工作目录
COPY . .

# 设置node环境变量
ENV NODE_ENV production

# 暴露应用端口
EXPOSE 3000

# 启动Next.js应用
CMD ["npm", "start"]
