CHANNEL_NAME="mychannel"
peer channel create -o orderer0.example-com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/channel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example-com/orderers/orderer0.example-com/msp/tlscacerts/tlsca.example-com-cert.pem

peer channel join -b mychannel.block

peer chaincode install -n mycc -v 1.0 -p github.com/hyperledger/fabric/examples/chaincode/go/

peer chaincode instantiate -o orderer0.example-com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example-com/orderers/orderer0.example-com/msp/tlscacerts/tlsca.example-com-cert.pem -C $CHANNEL_NAME -n mycc -v 1.0 -c '{"Args":["init","a", "100", "b","200"]}'


peer chaincode invoke -o orderer.example-com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example-com/orderers/orderer.example-com/msp/tlscacerts/tlsca.example-com-cert.pem -C $CHANNEL_NAME -n mycc --peerAddresses peer0.org1-example-com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1-example-com/peers/peer0.org1-example-com/tls/ca.crt --peerAddresses peer0.org2.example-com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example-com/peers/peer0.org2.example-com/tls/ca.crt -c '{"Args":["invoke","a","b","10"]}'
