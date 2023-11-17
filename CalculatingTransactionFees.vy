# CalculatingTransactionFees.vy - Example Smart Contract in Vyper

# Declaration of the contract
contract CalculatingTransactionFees:
    # State variables
    owner: public(address)
    transaction_fees: public(map(address, uint256))
    total_fees_collected: public(uint256)

    # Event for transaction fee calculation
    TransactionFeeCalculated: event({_from: indexed(address), to: indexed(address), gas_price: uint256, gas_used: uint256, transaction_fee: uint256})

    # Constructor to initialize the contract
    def __init__():
        self.owner = msg.sender
        self.total_fees_collected = 0

    # Function to calculate transaction fee
    @public
    def calculateTransactionFee(to: address, gas_price: uint256, gas_used: uint256) -> uint256:
        transaction_fee: uint256 = gas_price * gas_used
        self.transaction_fees[to] += transaction_fee
        self.total_fees_collected += transaction_fee
        log.TransactionFeeCalculated(_from=msg.sender, to=to, gas_price=gas_price, gas_used=gas_used, transaction_fee=transaction_fee)
        return transaction_fee

    # Function to get total fees collected by the contract
    @public
    @constant
    def getTotalFeesCollected() -> uint256:
        return self.total_fees_collected

    # Function to withdraw fees by the contract owner
    @public
    def withdrawFees(amount: uint256):
        assert msg.sender == self.owner
        assert amount <= self.total_fees_collected
        self.total_fees_collected -= amount
        send(self.owner, amount)