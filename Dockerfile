# 使用 Ubuntu 作为基础镜像
FROM dockerp.com/ubuntu:20.04

# 设置环境变量
ENV DEBIAN_FRONTEND=noninteractive

# 使用南京大学的 apt 源并安装常用工具和编译器
RUN sed -i 's/archive.ubuntu.com/mirrors.nju.edu.cn/g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    software-properties-common \
    apt-transport-https \
    gcc g++ make \
    openjdk-11-jdk \
    python3 python3-pip \
    golang \
    rustc cargo \
    ruby-full \
    php composer \
    ghc cabal-install \
    perl \
    lua5.3 \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# 安装 Node.js 和 NPM（南京大学源）
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get update && apt-get install -y nodejs && \
    npm config set registry https://repo.nju.edu.cn/repository/npm/ && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# 安装 .NET SDK
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && apt-get install -y dotnet-sdk-6.0 && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/* packages-microsoft-prod.deb

# 设置工作目录
WORKDIR /workspace

# 默认启动 Bash
CMD ["bash"]
