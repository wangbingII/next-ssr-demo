# 使用 Node.js 官方的稳定版本作为基础镜像
FROM node:20-alpine

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json 到工作目录
COPY package*.json ./

# 安装生产环境的依赖
RUN npm ci --only=production

# 复制应用代码到工作目录
COPY . .

# 生成 Next.js 静态文件
RUN npm run build

# 公开端口
EXPOSE 3000

ENV NODE_ENV production

# 启动应用
CMD ["npm", "start"]
