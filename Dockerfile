FROM registry.cn-hangzhou.aliyuncs.com/alinux/alinux3

ARG REGION_ID=cn-hangzhou

RUN yum install -y curl && \
	repo_url=https://enclave-${REGION_ID}.oss-${REGION_ID}.aliyuncs.com/repo/alinux/enclave-expr.repo && \
	yum install -y yum-utils && \
	yum-config-manager --add-repo ${repo_url} && \
	yum install -y libsgx-urts libsgx-uae-service # 按需添加更多SGX运行时依赖

WORKDIR /src
COPY src/hello_world src/enclave.signed.so /src
ENTRYPOINT ["/src/hello_world"]
