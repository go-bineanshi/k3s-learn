# 学习 基于 k3s 的部署

## html
> 存于 nfs service 的共享目录中，用于 demo 的数据挂载

## k3s 学习
- 主要参考
  - [简书-FatherXiao](https://www.jianshu.com/p/64c34d69ea39)
  - [K3s Deployment Guide](https://docs.openeuler.org/en/docs/22.03_LTS_SP1/docs/K3s/K3s-deployment-guide.html)
  - [K3s: Enable NFS Storage](https://www.phillipsj.net/posts/k3s-enable-nfs-storage/)

## 使用虚拟主机 multipass
- 具体使用参考
  - [简书-FatherXiao-【Multipass - 在Mac book 上轻松搭建Linux 虚拟机】](https://www.jianshu.com/p/360f491dc878)
  - [csdn-刘先生的u写倒了-【修改multipass虚拟机内存】](https://blog.csdn.net/weixin_43792401/article/details/130895176?spm=1001.2101.3001.6650.3&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EYuanLiJiHua%7EPosition-3-130895176-blog-125466239.235%5Ev38%5Epc_relevant_sort_base2&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EYuanLiJiHua%7EPosition-3-130895176-blog-125466239.235%5Ev38%5Epc_relevant_sort_base2&utm_relevant_index=6)

## 额外配置
```bash
# vim /etc/hosts
虚拟主机ip traefik.example.com
```
