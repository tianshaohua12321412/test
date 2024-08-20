# 使用基础镜像
FROM alibaba-cloud-linux-3-registry.cn-hangzhou.cr.aliyuncs.com/alinux3/python:3.11.1

# 设置工作目录
WORKDIR /app

# 复制应用代码到容器
COPY app.py .

# 安装 Flask
RUN pip install Flask

# 开放端口
EXPOSE 5000

# 设置默认命令
CMD ["python", "app.py"]
