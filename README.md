# fabric-on-k8s

## 部署

* 修改 `orderer.yaml` 的 `hostPath` 对应到本目录中的 `crypto-config` 和 `channel-artifacts`
* 运行 `chmod +x apply.sh && ./apply.sh`
* 到 cli pod 中执行 ./scripts/script.sh 来构建 channel 并部署合约

## 说明

本项目的联盟链使用了两个组织 org1,org2 相关配置文件已经提前生成只需要改部署中提到的路径即可，集群没有配置数据的持久化，您可自行根据业务调整持久化类型