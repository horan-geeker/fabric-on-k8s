# fabric-on-k8s

## 部署

* 修改 `orderer.yaml` 的 `hostPath` 对应到本目录中的 `crypto-config` 和 `channel-artifacts`
* 运行 `chmod +x apply.sh && ./apply.sh`
* 到 cli pod 中执行 ./scripts/script.sh 来构建 channel 并部署合约

## 说明

* 使用的是 zk+kafka 集群, 3个 zk pod statefulset 方式部署，对外提供 headless service 接口，4个 kafka service，1个 orderer service，2个 peer service，对应的都是 deployment 的部署方式
* 本项目的联盟链使用了两个组织 org1,org2 相关配置文件已经提前生成只需要改部署中提到的路径即可
* 集群没有配置数据的持久化，您可自行根据业务调整持久化类型
* 由于 k8s 的 service 网络访问的域名是通过 namespace 来构成的,而 fabric 中 orderer 或 peer 等节点的域名是预先定义在组织里的，而且必须通过这里的域名来互相通信，所以就需要将这里的域名和 namespace 设置成相同的
* 更加接近生产环境的项目可以参考 https://github.com/horan-geeker/fabric-on-helm 具备持久化并且使用 helm 部署