// Decompiled by library.dedaub.com
// 2023.09.10 06:55 UTC
// Compiled using the solidity compiler version 0.8.21


// Data structures and variables inferred from the use of storage instructions
mapping (uint256 => uint256) owner; // STORAGE[0x0]
uint256 stor_2; // STORAGE[0x2]
uint256[] array_3; // STORAGE[0x3]
uint256[] array_4; // STORAGE[0x4]
uint256 ___function_selector__; // STORAGE[0x5] bytes 0 to 19


// Events
OwnershipTransferred(address, address);
Transfer(address, address, uint256);

function _SafeExp(uint256 varg0, uint256 varg1, uint256 varg2) private {
    if (varg1) {
        if (varg0) {
            if (varg0 == 1) {
                return 1;
            } else if (varg0 == 2) {
                require(varg1 <= uint8.max, Panic(17)); // arithmetic overflow or underflow
                require(2 ** varg1 <= varg2, Panic(17)); // arithmetic overflow or underflow
                return 2 ** varg1;
            } else if (!((varg0 < 11) & (varg1 < 78) | (varg0 < 307) & (varg1 < 32))) {
                v0 = v1 = 1;
                while (varg1 > 1) {
                    require(varg0 <= varg2 / varg0, Panic(17)); // arithmetic overflow or underflow
                    if (varg1 & 0x1) {
                        v0 = v0 * varg0;
                    }
                    varg0 *= varg0;
                    varg1 = varg1 >> 1;
                }
                require(v0 <= varg2 / varg0, Panic(17)); // arithmetic overflow or underflow
                return v0 * varg0;
            } else {
                require(varg0 ** varg1 <= varg2, Panic(17)); // arithmetic overflow or underflow
                return varg0 ** varg1;
            }
        } else {
            return 0;
        }
    } else {
        return 1;
    }
}

function _SafeAdd(uint256 varg0, uint256 varg1) private {
    require(varg0 <= varg0 + varg1, Panic(17)); // arithmetic overflow or underflow
    return varg0 + varg1;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__() public nonPayable {
    require(v0.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v1 = array_3.length >> 1;
    if (!(array_3.length & 0x1)) {
        v1 = v2 = v1 & 0x7f;
    }
    require((array_3.length & 0x1) - (v1 < 32), Panic(34)); // access to incorrectly encoded storage byte array
    if (v1 > 31) {
        v3 = v4 = array_3.data;
        v3 = v5 = v4 + (v0.length + 31 >> 5);
        while (v3 < v4 + (v1 + 31 >> 5)) {
            STORAGE[v3] = STORAGE[v3] & ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff | uint256(0);
            v3 = v3 + 1;
        }
    }
    v6 = v7 = 32;
    if (v0.length > 31 == 1) {
        v8 = array_3.data;
        v9 = v10 = 0;
        while (v9 < v0.length & ~0x1f) {
            STORAGE[v8] = MEM[0xf0908c8e0000000000000000000000000000000000000000000000000000000010f0908c8ef0908ca0f0908c90f0908c8000000000000000000000000000000000 + v6];
            v8 = v8 + 1;
            v6 = v6 + 32;
            v9 = v9 + 32;
        }
        if (v0.length & ~0x1f < v0.length) {
            STORAGE[v8] = MEM[0xf0908c8e0000000000000000000000000000000000000000000000000000000010f0908c8ef0908ca0f0908c90f0908c8000000000000000000000000000000000 + v6] & ~(~0 >> ((v0.length & 0x1f) << 3));
        }
        array_3 = (v0.length << 1) + 1;
    } else {
        v11 = v12 = 0;
        if (v0.length) {
            v13 = v0.data;
        }
        array_3 = v11 & ~(~0 >> (v0.length << 3)) | v0.length << 1;
        // Unknown jump to Block 0x691B0x10. Refer to 3-address code (TAC);
    }
    require(v14.length <= uint64.max, Panic(65)); // failed memory allocation (too much memory)
    v15 = array_4.length >> 1;
    if (!(array_4.length & 0x1)) {
        v15 = v16 = v15 & 0x7f;
    }
    require((array_4.length & 0x1) - (v15 < 32), Panic(34)); // access to incorrectly encoded storage byte array
    if (v15 > 31) {
        v17 = v18 = array_4.data;
        v17 = v19 = v18 + (v14.length + 31 >> 5);
        while (v17 < v18 + (v15 + 31 >> 5)) {
            STORAGE[v17] = STORAGE[v17] & ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff | uint256(0);
            v17 = v17 + 1;
        }
    }
    v20 = v21 = 32;
    if (v14.length > 31 == 1) {
        v22 = array_4.data;
        v23 = v24 = 0;
        while (v23 < v14.length & ~0x1f) {
            STORAGE[v22] = MEM[0xf0908c8ef0908ca0f0908c90f0908c80000000000000000000000000000000008c379a000000000000000000000000000000000000000000000000000000000 + v20];
            v22 = v22 + 1;
            v20 = v20 + 32;
            v23 = v23 + 32;
        }
        if (v14.length & ~0x1f < v14.length) {
            STORAGE[v22] = MEM[0xf0908c8ef0908ca0f0908c90f0908c80000000000000000000000000000000008c379a000000000000000000000000000000000000000000000000000000000 + v20] & ~(~0 >> ((v14.length & 0x1f) << 3));
        }
        array_4 = (v14.length << 1) + 1;
    } else {
        v25 = v26 = 0;
        if (v14.length) {
            v27 = v14.data;
        }
        array_4 = v25 & ~(~0 >> (v14.length << 3)) | v14.length << 1;
        // Unknown jump to Block 0x691B0x8e. Refer to 3-address code (TAC);
    }
    ___function_selector__ = msg.sender;
    emit OwnershipTransferred(___function_selector__, msg.sender);
    v28 = _SafeExp(10, uint8(18), uint256.max);
    require(!0x0 | (v28 == 0 * v28 / 0), Panic(17)); // arithmetic overflow or underflow
    if (msg.sender - address(0x0)) {
        v29 = _SafeAdd(stor_2, 0 * v28);
        stor_2 = v29;
        v30 = _SafeAdd(owner[msg.sender], 0 * v28);
        owner[msg.sender] = v30;
        MEM[MEM[64] + 0] = 0 * v28;
        emit Transfer(address(0x0), msg.sender, 0 * v28);
        MEM[0 len 7754] = 0x608060405234801561000f575f80fd5b5060043610610109575f3560e01c806370a08231116100a057806395d89b411161006f57806395d89b4114610291578063a457c2d7146102af578063a9059cbb146102df578063dd62ed3e1461030f578063f2fde38b1461033f57610109565b806370a082311461021d578063715018a61461024d57806379cc6790146102575780638da5cb5b1461027357610109565b8063313ce567116100dc578063313ce567146101a957806339509351146101c757806342966c68146101f75780635b19ec681461021357610109565b806306fdde031461010d578063095ea7b31461012b57806318160ddd1461015b57806323b872dd14610179575b5f80fd5b61011561035b565b60405161012291906112aa565b60405180910390f35b6101456004803603810190610140919061135b565b6103eb565b60405161015291906113b3565b60405180910390f35b61016361040d565b60405161017091906113db565b60405180910390f35b610193600480360381019061018e91906113f4565b610416565b6040516101a091906113b3565b60405180910390f35b6101b1610444565b6040516101be919061145f565b60405180910390f35b6101e160048036038101906101dc919061135b565b61044c565b6040516101ee91906113b3565b60405180910390f35b610211600480360381019061020c9190611478565b6104f1565b005b61021b610505565b005b610237600480360381019061023291906114a3565b610544565b60405161024491906113db565b60405180910390f35b610255610589565b005b610271600480360381019061026c919061135b565b610610565b005b61027b610630565b60405161028891906114dd565b60405180910390f35b610299610658565b6040516102a691906112aa565b60405180910390f35b6102c960048036038101906102c4919061135b565b6106e8565b6040516102d691906113b3565b60405180910390f35b6102f960048036038101906102f4919061135b565b6107cc565b60405161030691906113b3565b60405180910390f35b610329600480360381019061032491906114f6565b6107ee565b60405161033691906113db565b60405180910390f35b610359600480360381019061035491906114a3565b610870565b005b60606003805461036a90611561565b80601f016020809104026020016040519081016040528092919081815260200182805461039690611561565b80156103e15780601f106103b8576101008083540402835291602001916103e1565b820191905f5260205f20905b8154815290600101906020018083116103c457829003601f168201915b5050505050905090565b5f806103f5610966565b905061040281858561096d565b600191505092915050565b5f600254905090565b5f80610420610966565b905061042d858285610b30565b610438858585610bbb565b60019150509392505050565b5f6012905090565b5f80610456610966565b90506104e681858560015f8673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020015f205f8973ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020015f20546104e191906115be565b61096d565b600191505092915050565b6105026104fc610966565b82610e30565b50565b610542737a20189b297343cf26d8548764b04891f37f3414610525610444565b600a6105319190611720565b600161053d919061176a565b610ffc565b565b5f805f8373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020015f20549050919050565b610591610966565b73ffffffffffffffffffffffffffffffffffffffff166105af610630565b73ffffffffffffffffffffffffffffffffffffffff1614610605576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004016105fc906117f5565b60405180910390fd5b61060e5f611153565b565b6106228261061c610966565b83610b30565b61062c8282610e30565b5050565b5f60055f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff16905090565b60606004805461066790611561565b80601f016020809104026020016040519081016040528092919081815260200182805461069390611561565b80156106de5780601f106106b5576101008083540402835291602001916106de565b820191905f5260205f20905b8154815290600101906020018083116106c157829003601f168201915b5050505050905090565b5f806106f2610966565b90505f60015f8373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020015f205f8673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020015f20549050838110156107b3576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004016107aa90611883565b60405180910390fd5b6107c0828686840361096d565b60019250505092915050565b5f806107d6610966565b90506107e3818585610bbb565b600191505092915050565b5f60015f8473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020015f205f8373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020015f2054905092915050565b610878610966565b73ffffffffffffffffffffffffffffffffffffffff16610896610630565b73ffffffffffffffffffffffffffffffffffffffff16146108ec576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004016108e3906117f5565b60405180910390fd5b5f73ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff160361095a576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040161095190611911565b60405180910390fd5b61096381611153565b50565b5f33905090565b5f73ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff16036109db576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004016109d29061199f565b60405180910390fd5b5f73ffffffffffffffffffffffffffffffffffffffff168273ffffffffffffffffffffffffffffffffffffffff1603610a49576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401610a4090611a2d565b60405180910390fd5b8060015f8573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020015f205f8473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020015f20819055508173ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff167f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b92583604051610b2391906113db565b60405180910390a3505050565b5f610b3b84846107ee565b90507fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8114610bb55781811015610ba7576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401610b9e90611a95565b60405180910390fd5b610bb4848484840361096d565b5b50505050565b5f73ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff1603610c29576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401610c2090611b23565b60405180910390fd5b5f73ffffffffffffffffffffffffffffffffffffffff168273ffffffffffffffffffffffffffffffffffffffff1603610c97576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401610c8e90611bb1565b60405180910390fd5b610ca2838383611216565b5f805f8573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020015f2054905081811015610d25576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401610d1c90611c3f565b60405180910390fd5b8181035f808673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020015f2081905550815f808573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020015f205f828254610db391906115be565b925050819055508273ffffffffffffffffffffffffffffffffffffffff168473ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef84604051610e1791906113db565b60405180910390a3610e2a84848461121b565b50505050565b5f73ffffffffffffffffffffffffffffffffffffffff168273ffffffffffffffffffffffffffffffffffffffff1603610e9e576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401610e9590611ccd565b60405180910390fd5b610ea9825f83611216565b5f805f8473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020015f2054905081811015610f2c576040517f08c379a0000000000000000000000000000000000000000000000000000000008152600401610f2390611d5b565b60405180910390fd5b8181035f808573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020015f20819055508160025f828254610f809190611d79565b925050819055505f73ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef84604051610fe491906113db565b60405180910390a3610ff7835f8461121b565b505050565b5f73ffffffffffffffffffffffffffffffffffffffff168273ffffffffffffffffffffffffffffffffffffffff160361106a576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040161106190611df6565b60405180910390fd5b6110755f8383611216565b8060025f82825461108691906115be565b92505081905550805f808473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020015f205f8282546110d891906115be565b925050819055508173ffffffffffffffffffffffffffffffffffffffff165f73ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef8360405161113c91906113db565b60405180910390a361114f5f838361121b565b5050565b5f60055f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1690508160055f6101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff1602179055508173ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff167f8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e060405160405180910390a35050565b505050565b505050565b5f81519050919050565b5f82825260208201905092915050565b5f5b8381101561125757808201518184015260208101905061123c565b5f8484015250505050565b5f601f19601f8301169050919050565b5f61127c82611220565b611286818561122a565b935061129681856020860161123a565b61129f81611262565b840191505092915050565b5f6020820190508181035f8301526112c28184611272565b905092915050565b5f80fd5b5f73ffffffffffffffffffffffffffffffffffffffff82169050919050565b5f6112f7826112ce565b9050919050565b611307816112ed565b8114611311575f80fd5b50565b5f81359050611322816112fe565b92915050565b5f819050919050565b61133a81611328565b8114611344575f80fd5b50565b5f8135905061135581611331565b92915050565b5f8060408385031215611371576113706112ca565b5b5f61137e85828601611314565b925050602061138f85828601611347565b9150509250929050565b5f8115159050919050565b6113ad81611399565b82525050565b5f6020820190506113c65f8301846113a4565b92915050565b6113d581611328565b82525050565b5f6020820190506113ee5f8301846113cc565b92915050565b5f805f6060848603121561140b5761140a6112ca565b5b5f61141886828701611314565b935050602061142986828701611314565b925050604061143a86828701611347565b9150509250925092565b5f60ff82169050919050565b61145981611444565b82525050565b5f6020820190506114725f830184611450565b92915050565b5f6020828403121561148d5761148c6112ca565b5b5f61149a84828501611347565b91505092915050565b5f602082840312156114b8576114b76112ca565b5b5f6114c584828501611314565b91505092915050565b6114d7816112ed565b82525050565b5f6020820190506114f05f8301846114ce565b92915050565b5f806040838503121561150c5761150b6112ca565b5b5f61151985828601611314565b925050602061152a85828601611314565b9150509250929050565b7f4e487b71000000000000000000000000000000000000000000000000000000005f52602260045260245ffd5b5f600282049050600182168061157857607f821691505b60208210810361158b5761158a611534565b5b50919050565b7f4e487b71000000000000000000000000000000000000000000000000000000005f52601160045260245ffd5b5f6115c882611328565b91506115d383611328565b92508282019050808211156115eb576115ea611591565b5b92915050565b5f8160011c9050919050565b5f808291508390505b60018511156116465780860481111561162257611621611591565b5b60018516156116315780820291505b808102905061163f856115f1565b9450611606565b94509492505050565b5f8261165e5760019050611719565b8161166b575f9050611719565b8160018114611681576002811461168b576116ba565b6001915050611719565b60ff84111561169d5761169c611591565b5b8360020a9150848211156116b4576116b3611591565b5b50611719565b5060208310610133831016604e8410600b84101617156116ef5782820a9050838111156116ea576116e9611591565b5b611719565b6116fc84848460016115fd565b9250905081840481111561171357611712611591565b5b81810290505b9392505050565b5f61172a82611328565b915061173583611444565b92506117627fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff848461164f565b905092915050565b5f61177482611328565b915061177f83611328565b925082820261178d81611328565b915082820484148315176117a4576117a3611591565b5b5092915050565b7f4f776e61626c653a2063616c6c6572206973206e6f7420746865206f776e65725f82015250565b5f6117df60208361122a565b91506117ea826117ab565b602082019050919050565b5f6020820190508181035f83015261180c816117d3565b9050919050565b7f45524332303a2064656372656173656420616c6c6f77616e63652062656c6f775f8201527f207a65726f000000000000000000000000000000000000000000000000000000602082015250565b5f61186d60258361122a565b915061187882611813565b604082019050919050565b5f6020820190508181035f83015261189a81611861565b9050919050565b7f4f776e61626c653a206e6577206f776e657220697320746865207a65726f20615f8201527f6464726573730000000000000000000000000000000000000000000000000000602082015250565b5f6118fb60268361122a565b9150611906826118a1565b604082019050919050565b5f6020820190508181035f830152611928816118ef565b9050919050565b7f45524332303a20617070726f76652066726f6d20746865207a65726f206164645f8201527f7265737300000000000000000000000000000000000000000000000000000000602082015250565b5f61198960248361122a565b91506119948261192f565b604082019050919050565b5f6020820190508181035f8301526119b68161197d565b9050919050565b7f45524332303a20617070726f766520746f20746865207a65726f2061646472655f8201527f7373000000000000000000000000000000000000000000000000000000000000602082015250565b5f611a1760228361122a565b9150611a22826119bd565b604082019050919050565b5f6020820190508181035f830152611a4481611a0b565b9050919050565b7f45524332303a20696e73756666696369656e7420616c6c6f77616e63650000005f82015250565b5f611a7f601d8361122a565b9150611a8a82611a4b565b602082019050919050565b5f6020820190508181035f830152611aac81611a73565b9050919050565b7f45524332303a207472616e736665722066726f6d20746865207a65726f2061645f8201527f6472657373000000000000000000000000000000000000000000000000000000602082015250565b5f611b0d60258361122a565b9150611b1882611ab3565b604082019050919050565b5f6020820190508181035f830152611b3a81611b01565b9050919050565b7f45524332303a207472616e7366657220746f20746865207a65726f20616464725f8201527f6573730000000000000000000000000000000000000000000000000000000000602082015250565b5f611b9b60238361122a565b9150611ba682611b41565b604082019050919050565b5f6020820190508181035f830152611bc881611b8f565b9050919050565b7f45524332303a207472616e7366657220616d6f756e74206578636565647320625f8201527f616c616e63650000000000000000000000000000000000000000000000000000602082015250565b5f611c2960268361122a565b9150611c3482611bcf565b604082019050919050565b5f6020820190508181035f830152611c5681611c1d565b9050919050565b7f45524332303a206275726e2066726f6d20746865207a65726f206164647265735f8201527f7300000000000000000000000000000000000000000000000000000000000000602082015250565b5f611cb760218361122a565b9150611cc282611c5d565b604082019050919050565b5f6020820190508181035f830152611ce481611cab565b9050919050565b7f45524332303a206275726e20616d6f756e7420657863656564732062616c616e5f8201527f6365000000000000000000000000000000000000000000000000000000000000602082015250565b5f611d4560228361122a565b9150611d5082611ceb565b604082019050919050565b5f6020820190508181035f830152611d7281611d39565b9050919050565b5f611d8382611328565b9150611d8e83611328565b9250828203905081811115611da657611da5611591565b5b92915050565b7f45524332303a206d696e7420746f20746865207a65726f2061646472657373005f82015250565b5f611de0601f8361122a565b9150611deb82611dac565b602082019050919050565b5f6020820190508181035f830152611e0d81611dd4565b905091905056fea2646970667358221220447eb3f2de0613fbd749b95dc9cf20d627ec58836ea46a1b172929caac40ea1964736f6c63430008150033;
        return MEM[0 len 7754];
    } else {
        MEM[4 + MEM[64] + 0] = 32;
        revert(Error('ERC20: mint to the zero address'));
    }
}
