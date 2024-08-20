# 使用基础镜像
FROM alibaba-cloud-linux-3-registry.cn-hangzhou.cr.aliyuncs.com/alinux3/python:3.11.1

# 将当前目录下的 app.py 文件复制到容器中
COPY app.py /app/app.py

# 设置工作目录
WORKDIR /app

# 运行 Python 应用
CMD ["python", "app.py"]
