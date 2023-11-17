use web3::transports::Http;
use web3::types::U64;
use web3::Web3;

#[tokio::main]
async fn main() {
    let transport = Http::new("http://localhost:8545").unwrap(); // Remplacez par votre adresse de nœud Ethereum
    let web3 = Web3::new(transport);

    let gas_price = web3.eth().gas_price().await.unwrap();
    let gas_used: U64 = 21000.into(); // Limite de gas pour une transaction standard

    let transaction_fee = gas_price.as_u64() * gas_used.as_u64();
    println!("Transaction fee: {} Wei", transaction_fee);
}