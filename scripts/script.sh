CHANNEL_NAME="mychannel"
peer channel create -o orderer0.example-com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/channel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example-com/orderers/orderer0.example-com/msp/tlscacerts/tlsca.example-com-cert.pem

peer channel join -b mychannel.block

peer chaincode install -n mycc -v 1.0 -p github.com/hyperledger/fabric/examples/chaincode/go/example02

peer chaincode instantiate -o orderer0.example-com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example-com/orderers/orderer0.example-com/msp/tlscacerts/tlsca.example-com-cert.pem -C $CHANNEL_NAME -n mycc -v 1.0 -c '{"Args":["init","a", "100", "b","200"]}'
