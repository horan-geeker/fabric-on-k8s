# fabric-on-k8s

## 部署

* 修改 `orderer.yaml` 的 `hostPath` 对应到本目录中的 `crypto-config` 和 `channel-artifacts`
* 运行 `chmod +x start.sh && ./start.sh`