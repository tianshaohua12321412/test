FROM yunqi-registry.cn-shanghai.cr.aliyuncs.com/lab/stable-diffusion:model-only-v1.5 as model

FROM docker.io/nvidia/cuda:12.1.0-cudnn8-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1 libglib2.0-0 wget git curl vim python3.10 python3-venv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git && \
cd stable-diffusion-webui && git checkout v1.6.0

COPY --from=model /data/v1-5-pruned-emaonly.safetensors /stable-diffusion-webui/models/Stable-diffusion/
COPY --from=model /root/.cache/huggingface /root/.cache/huggingface

WORKDIR /stable-diffusion-webui/

RUN ./webui.sh -f can_run_as_root --exit --skip-torch-cuda-test

ENV VIRTUAL_ENV=/stable-diffusion-webui/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

CMD ["python3", "launch.py", "--listen --skip-torch-cuda-test --no-half"]
