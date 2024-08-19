FROM alibaba-cloud-linux-3-registry.cn-hangzhou.cr.aliyuncs.com/alinux3/alinux3
ARG DPDK_VERSION=21.11.3
# dpdk dependency
RUN yum groupinstall -y 'Development Tools' && yum install -y python3 pciutils iproute && pip3 install meson ninja==v1.8.2 pyelftools
# dpdk build
RUN mkdir dpdk_build && cd dpdk_build && curl -OL http://fast.dpdk.org/rel/dpdk-${DPDK_VERSION}.tar.xz  \
    && tar -xvf dpdk-${DPDK_VERSION}.tar.xz  \
    && cd dpdk-stable-${DPDK_VERSION}  \
    && meson build && cd build && ninja && ninja install
