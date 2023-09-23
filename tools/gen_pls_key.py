# #!/usr/bin/python3
import sys
import bip44.utils
import coincurve
import mnemonic

# DEFAULT CUSTOM SEED PHRASE
CUST_SEED = "zero one two three four five six seven eight nine ten eleven thirteen fourteen fifteen sixteen seventeen eighteen nineteen twenty twenty-one twenty-two twenty-three"
# gloabl support
DIV = "#========================================================#"
listHoldAddress = []
NUM_ACTS = 10
STR_HELP = f'''
!! HELP ME !!

:- FLAGS (options) ...
    --help or -h
        print this help message
        
    --generate or -g
        generate {NUM_ACTS} accounts with {NUM_ACTS} random seed-phrases

    --generate-custom or -gc
        generate {NUM_ACTS} accounts w/ 1 custom seed-phrase (set in code: 'CUST_SEED')
    
:- USAGE (examples) ...
    $ python3 gen_pls_key.py --help
    $ python3 gen_pls_key.py --generate
    $ python3 gen_pls_key.py --generate-custom
    
        - OR -
        
    $ python3 gen_pls_key.py -h
    $ python3 gen_pls_key.py -g
    $ python3 gen_pls_key.py -gc
'''

def gen_from_seed(entropyStrength, seedPhrase, account_num=0):
    print(f"\n{DIV}")
    print(f"ACCOUNT # {x}")
    
    seedPhraseLength = len(seedPhrase.split(" "))
    
    # generate wallet w/ a single private/public key (address)
    wallet = bip44.Wallet(seedPhrase)
    secretKey, publicKey = wallet.derive_account("eth", account=account_num)
    
    # generate coincurve private key instance (to do stuff with...?)
    secretKey = coincurve.PrivateKey(secretKey)
    
    # coincurve instance validation
    if secretKey.public_key.format() != publicKey:
        print(f"\n** WARNING **: secretKey derived from coincurve DOES NOT match publicKey dervived from bip44; _ act#: {x}")
    else:
        pass
        #print(f"\n... note: coincurve validation success! _ act# {x}")
        
    # derive publc address from public key?
    address = bip44.utils.get_eth_addr(publicKey)

    listHoldAddress.append(address)
    
    # print everything
    print("\nSeed Phrase ({} words):\n {}" .format(seedPhraseLength, seedPhrase))
    print("\naddress: {}" .format(address))
    print("secret: {}".format(secretKey.to_hex()))

def gen_pls_key(language, entropyStrength, account_num=0):
    # generate seed phrase
    mnemo = mnemonic.Mnemonic(language)
    seedPhrase = mnemo.generate(entropyStrength)
    gen_from_seed(entropyStrength, seedPhrase, account_num)

def help_me():
    print(STR_HELP)

if __name__ == "__main__":
    language = str("english")
    entropyStrength = int(256)
    execute = None
    
    print(f"{DIV}\nGO - gen_pls_key.py\n{DIV}")
    if len(sys.argv) < 2: help_me()
    for command in sys.argv[1:]:
        if command == str("--help") or command == str("-h"):
            execute = help_me()
            break
        elif command == str("--generate") or command == str("-g"):
            print(f"\n** FOUND flag '-g' ** \n\n generating {NUM_ACTS} account keys from {NUM_ACTS} random seed-phrases ...")
            for x in range(0,NUM_ACTS):
                execute = gen_pls_key(language, entropyStrength, x)
            break
        elif command == str("--generate-custom") or command == str("-gc"):
            if not len(CUST_SEED):
                print("\n** ERROR **: no custom seed phrase entered in code\n")
            else:
                print(f'\n** FOUND flag "-gs" ** \n\n generating {NUM_ACTS} account keys from 1 custom seed-phrase ... \n   "{CUST_SEED}"')
                for x in range(0,NUM_ACTS):
                    execute = gen_from_seed(entropyStrength, CUST_SEED, x)
            break
        else:
            print("\n** ERROR **: invalid or no flag found, please try again (printing help)")
            help_me()
            break
    print(f"\n{DIV}\nDONE - gen_pls_key.py\n{DIV}")
