package main

import (
	"fmt"
	"github.com/ethereum/go-ethereum/rpc"
	"log"
	"math/big"
)

func calculateTransactionFee(gasPrice *big.Int, gasUsed uint64) *big.Int {
	return new(big.Int).Mul(gasPrice, new(big.Int).SetUint64(gasUsed))
}

func main() {
	client, err := rpc.Dial("http://localhost:8545") // Remplacez par votre adresse de nœud Ethereum
	if err != nil {
		log.Fatal(err)
	}

	var gasPrice *big.Int
	err = client.Call(&gasPrice, "eth_gasPrice")
	if err != nil {
		log.Fatal(err)
	}

	gasUsed := uint64(21000) // Limite de gas pour une transaction standard
	transactionFee := calculateTransactionFee(gasPrice, gasUsed)

	fmt.Printf("Transaction fee: %s Wei\n", transactionFee.String())
}