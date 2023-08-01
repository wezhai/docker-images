# 基于Ubuntu22.04、Deiban12和CentOS7.9.2009操作系统的Python镜像
这种方式构建的Docker镜像相对较小，通常不会超过500MB

## 构建指定版本的Docker镜像
通过变量`PYTHON_VERSION`指定需要构建的Python版本
```
docker build --build-arg PYTHON_VERSION=3.11.4 -t "wezhai/python:3.11.4-debian12" -f Dockerfile-debian12 .
docker build --build-arg PYTHON_VERSION=3.11.4 -t "wezhai/python:3.11.4-ubuntu22.04" -f Dockerfile-ubuntu22.04 .
docker build --build-arg PYTHON_VERSION=3.11.4 -t "wezhai/python:3.11.4-centos7.9.2009" -f Dockerfile-centos7.9.2009 .
```
