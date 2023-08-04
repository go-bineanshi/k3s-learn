# 创建 nfs 容器
nfs:
	multipass launch --name nfs
# 进入 nfs 容器
run-nfs:
	multipass shell nfs

# 挂载 nfs
# sudo mount -t nfs -o nolock,nfsvers=3 192.168.64.19:/nfsdata/share /nfsdata

# 访问 容器
# kubectl exec 容器name
# 创建 主使用节点
node:
	multipass launch --name server --mount /Users/bineanshi/workspace/node:/home/ubuntu/node
# 进入 主使用节点
run:
	multipass shell server
# 删除 主使用节点
node-del:
	multipass delete server
	multipass purge -v

# 安装 k3s
k3s:
	curl -sfL https://rancher-mirror.rancher.cn/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn sh -

# 查看所有 k3s pods
pods:
	kubectl get pods -A --watch

svc:
	kubectl get svc -A

# 查看挂载 卷
pvc:
	kubectl get pvc -A

# 查看 storage
storage:
	kubectl get storageclasses
storage-i:
	kubectl apply -f nfs/nfs-client.yaml
	kubectl apply -f nfs/nfs-pvc.yaml
storage-d:
	kubectl delete -f nfs/nfs-client.yaml
	kubectl delete -f nfs/nfs-pvc.yaml

# 创建 demo
demo-i:
	kubectl apply -f demo/deployment.yaml
	kubectl apply -f demo/service.yaml
	kubectl apply -f demo/route.yaml
demo-d:
	kubectl delete -f demo/deployment.yaml
	kubectl delete -f demo/service.yaml
	kubectl delete -f demo/route.yaml

# 创建 traefik 控制页面
traefik-i:
	cat traefik/dashboard-auth.yaml | envsubst | kubectl apply -f -
	cat traefik/dashboard-ingress.yaml | envsubst | kubectl apply -f -
# 删除 traefik 控制页面
traefik-d:
	cat traefik/dashboard-auth.yaml | envsubst | kubectl delete -f -
	cat traefik/dashboard-ingress.yaml | envsubst | kubectl delete -f -
# 创建  whoami 服务
whoami-i:
	kubectl apply -f whoami/
# 删除  whoami 服务
whoami-d:
	kubectl delete -f whoami/
