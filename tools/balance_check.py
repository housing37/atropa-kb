# house_091223
'''
    HOW-TO use this code from CLI (command line interface)
        1) install python3 on your system
            ref: https://letmegooglethat.com/?q=how+to+install+python3+on+my+system
        2) open up the CLI and install web3.py
            $ python3 -m pip install web3
        3) set variables below
            'account_address'   = the address of the wallet to check balance
            'contract_address'  = address for the token you want to check the balance of
        4) run the script from CLI
            $ python3 balance_check.py
            
        short-hand:
            $ python3 -m pip install web3
            $ python3 balance_check.py
'''
# 1) include other code we need (other than this .py file)
from web3 import Web3

# 2) set the address of the wallet to check balance
account_address = '0xYourWalletAddress' # random new (returns 0)

# 3) set variables for the token you want to check the balance of
contract_address = "0x6B175474E89094C44Da98b954EedeAC495271d0F" # pDAI token
contract_abi = [
    {
        "constant": True,
        "inputs": [{"name": "_owner", "type": "address"}],
        "name": "balanceOf",
        "outputs": [{"name": "balance", "type": "uint256"}],
        "type": "function"
    },
    {
        "constant": True,
        "inputs": [],  # No inputs required
        "name": "symbol",
        "outputs": [{"name": "", "type": "string"}],
        "type": "function"
    }
]

# 4) connect to pulse chain
w3 = Web3(Web3.HTTPProvider('https://rpc.pulsechain.com'))

# 5) connect to the contract
contract = w3.eth.contract(address=contract_address, abi=contract_abi)

# 6) use the contract to get the balance & ticker symbol of the token address
balance = contract.functions.balanceOf(account_address).call()
symbol = contract.functions.symbol().call()

# 7) print the balance to screen
print(f'''\n\nFunction 'balanceOf' executed successfully...\n address: {account_address}\n balance: {balance} ${symbol}\n\n

       .--.
      |o_o |
      |:_/ |
     //   \\ \\
    (|     | )
    /'\_   _/`\\
    \___)=(___/
    
''')

'''
       .--.
      |o_o |
      |:_/ |
     //   \ \
    (|     | )
    /'\_   _/`\
    \___)=(___/
    
'''



