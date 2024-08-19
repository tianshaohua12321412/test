# 使用基础镜像
FROM test-0722-registry-vpc.cn-hangzhou.cr.aliyuncs.com/test/test12:latest

# 将自定义的 HTML 文件复制到 Nginx 的默认网页目录
COPY index.html /usr/share/nginx/html/index.html

# 曝露 Nginx 默认端口
EXPOSE 80

# 启动 Nginx 服务
CMD ["nginx", "-g", "daemon off;"]
