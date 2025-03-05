
# Multi-Language Compile Environment / 多语言编译环境

[English Version](#english-version) | [中文版本](#中文版本)

---

## English Version
<a id="english-version"></a>

### Overview
This project provides a Docker-based multi-language compile environment. It is designed to support development in various programming languages such as C/C++, Java, Python, Node.js, Go, Rust, Ruby, PHP, Haskell, Perl, Lua, and .NET.

### Prerequisites
- Docker (with Buildx support if needed)
- Internet access to download dependencies

### Build Instructions
1. **Build the Docker image:**  
   Execute the following command in the project directory:
   ```bash
   docker build -t multi-lang .
   ```
2. **Run the container:**  
   Start a container with:
   ```bash
   docker run -it --rm multi-lang
   ```

### Usage
Once inside the container, you can use the pre-installed compilers and tools to compile and run your projects. The working directory is set to `/workspace`.

---

[中文版本](#中文版本)

---

## 中文版本
<a id="中文版本"></a>

### 概述
该项目构建了一个基于 Docker 的多语言编译环境，支持 C/C++、Java、Python、Node.js、Go、Rust、Ruby、PHP、Haskell、Perl、Lua 以及 .NET 等多种语言的开发和编译。

### 前提条件
- 安装 Docker（如果需要可支持 Buildx）
- 具备下载依赖的网络环境

### 构建步骤
1. **构建 Docker 镜像：**  
   在项目目录下执行：
   ```bash
   docker build -t multi-lang .
   ```
2. **运行容器：**  
   使用以下命令启动容器：
   ```bash
   docker run -it --rm multi-lang
   ```

### 使用方法
进入容器后，所有的编译器与工具已经预先安装好，工作目录为 `/workspace`，可以直接在此目录下进行项目的开发和编译。


### 编译

#### 创建并启用 Buildx 构建器
```bash
docker buildx create --use
```

#### 启动 QEMU 支持的多架构模拟器
```bash
docker run --rm --privileged fly6516.synology.me:8080/multiarch/qemu-user-static --reset -p yes
```

#### 构建并推送多架构 Docker 镜像
```bash
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/ppc64le,linux/s390x,linux/mips64le -t fly6516/multilang:latest . --push
```

---

[English Version](#english-version)
