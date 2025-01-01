# LABEL authors="fly"

# ENTRYPOINT ["top", "-b"]

# 使用 Ubuntu 作为基础镜像
FROM fly6516.synology.me:8080/ubuntu:20.04
#FROM ubuntu:20.04

# 设置环境变量
ENV DEBIAN_FRONTEND=noninteractive

# 使用南京大学的 apt 源
# RUN sed -i 's/archive.ubuntu.com/mirrors.nju.edu.cn/g' /etc/apt/sources.list

# 更新系统并安装常用工具
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    software-properties-common \
    apt-transport-https \
    && rm -rf /var/lib/apt/lists/*

# 安装 Node.js（替换为南京大学的源）
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    # sed -i 's|deb.nodesource.com|mirror.nju.edu.cn/nodesource/deb|g' /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && apt-get install -y nodejs && npm config set registry https://repo.nju.edu.cn/repository/npm/ # 修改源

# 安装其他语言的编译器和工具
RUN apt-get update && apt-get install -y \
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
    && rm -rf /var/lib/apt/lists/*

# 安装 .NET SDK
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && apt-get install -y dotnet-sdk-6.0 && \
    rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /workspace

# 暴露端口（如有需要）
#EXPOSE 3000

# 默认启动 Bash
CMD ["bash"]
