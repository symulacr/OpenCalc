from web3 import Web3

# Initialise Web3 avec un nœud Ethereum
web3 = Web3(Web3.HTTPProvider('http://localhost:8545'))  # Remplacez par votre adresse de nœud Ethereum

def calculate_transaction_fee(gas_price, gas_used):
    return gas_price * gas_used

# Exemple de calcul de frais de transaction
gas_price = web3.eth.gas_price
gas_used = 21000  # Limite de gas pour une transaction standard
transaction_fee = calculate_transaction_fee(gas_price, gas_used)

print(f"Transaction fee: {transaction_fee} Wei")