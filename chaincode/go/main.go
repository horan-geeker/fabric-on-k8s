/*

Chaincode Template for Fabric

*/

package main

import (
	"fmt"

	"github.com/hyperledger/fabric/core/chaincode/shim"
	pb "github.com/hyperledger/fabric/protos/peer"
)

// TemplateChaincode example simple Chaincode implementation
type TemplateChaincode struct {
}

// Initialize when deploying the chaincode
// Init function will only execute once
func (t *TemplateChaincode) Init(stub shim.ChaincodeStubInterface) pb.Response {

	// Init operations here

	return shim.Success(nil)
}

func (t *TemplateChaincode) Invoke(stub shim.ChaincodeStubInterface) pb.Response {
	function, args := stub.GetFunctionAndParameters()
	if function == "interfaceA" {
		// invoke interfaceA
		return t.interfaceA(stub, args)
	} else if function == "interfaceB" {
		// invoke interfaceB
		return t.interfaceB(stub, args)
	}

	return shim.Error("Invalid invoke function name. Expecting \"interfaceA\" \"interfaceB\"")
}

// interfaceA
func (t *TemplateChaincode) interfaceA(stub shim.ChaincodeStubInterface, args []string) pb.Response {

	// interfaceA operations here

	return shim.Success(nil)
}

// interfaceA
func (t *TemplateChaincode) interfaceB(stub shim.ChaincodeStubInterface, args []string) pb.Response {

	// interfaceB operations here

	return shim.Success(nil)
}

func main() {
	err := shim.Start(new(TemplateChaincode))
	if err != nil {
		fmt.Printf("Error starting chaincode: %s", err)
	}
}
