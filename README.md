## 基于Docker的Android编译打包环境（非开发环境）

#### 环境
基于centos:7.2.1511+jdk8+android-sdk-tools+kotlin的编译环境

## usage
1. 下载配置docker环境
2. git clone this resp...
3. cd 到当前目录，执行`docker build -t groupname/docker_buildandroid:0.0.1 .`
4. 等待一直到构件好，执行docker images,应该能看到‘groupname/docker_buildandroid’的一个镜像文件，这个就是一个构件好的Android编译环境
