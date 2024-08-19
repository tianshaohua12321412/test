FROM alibaba-cloud-linux-3-registry.cn-hangzhou.cr.aliyuncs.com/alinux3/alinux3

ARG DPDK_VERSION=21.11.3

# dpdk dependency
RUN yum groupinstall -y 'Development Tools' \
    && yum install -y python3 python3-pip pciutils iproute \
    && pip3 install meson ninja==1.8.2 pyelftools \
    && yum clean all

# dpdk build
WORKDIR /dpdk_build
RUN curl -OL http://fast.dpdk.org/rel/dpdk-${DPDK_VERSION}.tar.xz \
    && tar -xvf dpdk-${DPDK_VERSION}.tar.xz \
    && cd dpdk-stable-${DPDK_VERSION} \
    && meson build \
    && cd build \
    && ninja \
    && ninja install \
    && cd ../../ \
    && rm -rf dpdk-stable-${DPDK_VERSION} dpdk-${DPDK_VERSION}.tar.xz
