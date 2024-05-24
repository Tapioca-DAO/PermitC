// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import "../src/interfaces/IImmutableCreate2Factory.sol";

contract DeployDeterministicPermitC is Script {
    bytes permitCBytecode =
        hex"000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000031e0000000000000000000000000000000000000000000000000000000000000322000000000000000000000000000000000000000000000000000000000000031476101606040523480156200001257600080fd5b506040516200314738038062003147833981016040819052620000359162000247565b818162000044826000620000f5565b6101205262000055816001620000f5565b61014052815160208084019190912060e052815190820120610100524660a052620000e360e05161010051604080517f8b73c3c69bb8fe3d512ecc4cf759cc79239f7b179b0ffacaa9a75d522b39400f60208201529081019290925260608201524660808201523060a082015260009060c00160405160208183030381529060405280519060200120905090565b60805250503060c05250620004669050565b600060208351101562000115576200010d836200012e565b905062000128565b8162000122848262000340565b5060ff90505b92915050565b600080829050601f8151111562000165578260405163305a27a960e01b81526004016200015c91906200040c565b60405180910390fd5b8051620001728262000441565b179392505050565b634e487b7160e01b600052604160045260246000fd5b60005b83811015620001ad57818101518382015260200162000193565b50506000910152565b600082601f830112620001c857600080fd5b81516001600160401b0380821115620001e557620001e56200017a565b604051601f8301601f19908116603f011681019082821181831017156200021057620002106200017a565b816040528381528660208588010111156200022a57600080fd5b6200023d84602083016020890162000190565b9695505050505050565b600080604083850312156200025b57600080fd5b82516001600160401b03808211156200027357600080fd5b6200028186838701620001b6565b935060208501519150808211156200029857600080fd5b50620002a785828601620001b6565b9150509250929050565b600181811c90821680620002c657607f821691505b602082108103620002e757634e487b7160e01b600052602260045260246000fd5b50919050565b601f8211156200033b57600081815260208120601f850160051c81016020861015620003165750805b601f850160051c820191505b81811015620003375782815560010162000322565b5050505b505050565b81516001600160401b038111156200035c576200035c6200017a565b62000374816200036d8454620002b1565b84620002ed565b602080601f831160018114620003ac5760008415620003935750858301515b600019600386901b1c1916600185901b17855562000337565b600085815260208120601f198616915b82811015620003dd57888601518255948401946001909101908401620003bc565b5085821015620003fc5787850151600019600388901b60f8161c191681555b5050505050600190811b01905550565b60208152600082518060208401526200042d81604085016020870162000190565b601f01601f19169190910160400192915050565b80516020808301519190811015620002e75760001960209190910360031b1b16919050565b60805160a05160c05160e051610100516101205161014051612c86620004c1600039600061075201526000610728015260006117ec015260006117c40152600061171f01526000611749015260006117730152612c866000f3fe608060405234801561001057600080fd5b50600436106101b95760003560e01c806384ee428c116100f9578063c435f43511610097578063d9acaa3d11610071578063d9acaa3d1461041e578063db188e6314610431578063dd71105d14610444578063df21dc1d1461045757600080fd5b8063c435f435146103e5578063cd0d056c146103f8578063cfb671cb1461040b57600080fd5b80639c380975116100d35780639c38097514610399578063b36f4940146103ac578063b9460d4a146103bf578063c1454c6d146103d257600080fd5b806384ee428c14610360578063856adc451461037357806390485fd31461038657600080fd5b80633e8a0bc9116101665780637ad5408b116101405780637ad5408b1461030c5780637df81b901461031f5780638352f4791461033257806384b0196e1461034557600080fd5b80633e8a0bc9146102cb5780634df65ed3146102d357806378e890ba146102f657600080fd5b80631f2fdc79116101975780631f2fdc791461023f57806322fb54cc146102905780633826b70e146102a357600080fd5b8063016889de146101be57806312d3848a146102075780631a0b4d221461022a575b600080fd5b6101d16101cc366004612067565b61048d565b6040805178ffffffffffffffffffffffffffffffffffffffffffffffffff90931683529015156020830152015b60405180910390f35b61021a61021536600461210b565b61050c565b60405190151581526020016101fe565b61023d610238366004612189565b610533565b005b61021a61024d366004612224565b73ffffffffffffffffffffffffffffffffffffffff9091166000908152600460209081526040808320600885901c845290915290205460ff9091161c6001161590565b61021a61029e36600461224e565b610612565b6102b66102b136600461210b565b61063f565b604080519283526020830191909152016101fe565b61023d61065d565b61021a6102e13660046122c5565b60009081526003602052604090205460ff1690565b6102fe61069b565b6040519081526020016101fe565b6102b661031a3660046122de565b6106aa565b61021a61032d3660046122de565b6106c7565b61021a610340366004612329565b6106ec565b61034d61071a565b6040516101fe9796959493929190612413565b61021a61036e3660046124d2565b6107be565b61023d610381366004612563565b6107fb565b61021a6103943660046125c1565b610810565b6101d16103a7366004612067565b61084c565b61021a6103ba36600461265d565b610889565b61021a6103cd366004612719565b6108b5565b61021a6103e03660046127e1565b61090b565b61023d6103f33660046122c5565b610947565b61021a61040636600461289e565b610956565b61023d610419366004612925565b610991565b61021a61042c366004612967565b610a37565b61023d61043f366004612a1a565b610a74565b61021a6104523660046122de565b610b13565b6102fe610465366004612a5c565b73ffffffffffffffffffffffffffffffffffffffff1660009081526005602052604090205490565b6000808261049a81610b32565b60006104e18c8c8f60000160208101906104b49190612a7e565b78ffffffffffffffffffffffffffffffffffffffffffffffffff168d8c8c65ffffffffffff168c8c610b7a565b90506104f78e8e8e8e8e8e8d8d89610bba610c6d565b909f909e509c50505050505050505050505050565b600061051c86858585600061109b565b6105298487878686610bba565b9695505050505050565b8265ffffffffffff16421115610575576040517f827aed8000000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b610581828860006111f6565b6105f982826105f46105ef8d8d8c78ffffffffffffffffffffffffffffffffffffffffffffffffff168e8d8d65ffffffffffff168d65ffffffffffff166105ea8e73ffffffffffffffffffffffffffffffffffffffff1660009081526005602052604090205490565b6112c9565b611372565b6113c0565b61060789898887868a611471565b505050505050505050565b60006106248a8a898b8a8a8989611569565b6106318a86868c87610bba565b9a9950505050505050505050565b60008061064f8787878787611645565b915091509550959350505050565b3360008181526005602052604080822080546001019055517f8e8cebe67607ce50a14a2e3261437f641a7b33ecc053e3d9c90b25ae5e66c6569190a2565b60006106a5611705565b905090565b6000806106ba8686868685611645565b9150915094509492505050565b60006106d785848460018061109b565b6106e38585858561183d565b95945050505050565b60006106ff896000898b8a8a8989611569565b61070d8986866000876118e3565b9998505050505050505050565b60006060808280808361074d7f000000000000000000000000000000000000000000000000000000000000000083611a0d565b6107787f00000000000000000000000000000000000000000000000000000000000000006001611a0d565b604080516000808252602082019092527f0f000000000000000000000000000000000000000000000000000000000000009b939a50919850469750309650945092509050565b6000816107ca81610b32565b6107dd8c60008c8e8d8d8c8c8c8c611ab9565b6107eb8c898960008a6118e3565b9c9b505050505050505050505050565b610809858584843388611471565b5050505050565b60008161081c81610b32565b61082e8d8d8c8e8d8d8c8c8c8c611ab9565b61083b8d89898f8a610bba565b9d9c50505050505050505050505050565b6000808261085981610b32565b60006108738c8c8f60000160208101906104b49190612a7e565b90506104f78e8e8e8e8e8e8d8d896118e3610c6d565b600061089d88886001898989600189611569565b6108a984848a8a61183d565b98975050505050505050565b600061082e8d8d8c8e8d8d8c8c8c6040518060c0016040528060868152602001612bcb608691398d8d6040516020016108f093929190612a99565b60405160208183030381529060405280519060200120611ab9565b60006107dd8c60008c8e8d8d8c8c8c6040518060c0016040528060868152602001612bcb608691398d8d6040516020016108f093929190612a99565b610953338260016111f6565b50565b60008161096281610b32565b6109768b8b60018c8c8c60018c8c8c611ab9565b61098287878d8d61183d565b9b9a5050505050505050505050565b60006109a08585858533611ae9565b805490915060ff16610a05576002815560405160018152339073ffffffffffffffffffffffffffffffffffffffff87169084907f053489551d3cd7a95d914a0412d5404dcc4728be5d218e6eb5fee54c58da752d9060200160405180910390a4610809565b6040517f2c8d80bd00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60006109768b8b60018c8c8c60018c8c6040518060c0016040528060868152602001612bcb608691398d8d6040516020016108f093929190612a99565b60006040518060c0016040528060868152602001612bcb608691398383604051602001610aa393929190612a99565b604080517fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0818403018152918152815160209283012060009081526003909252902080547fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00166001179055505050565b6000610b248584600085600061109b565b6106e38386866000866118e3565b60008181526003602052604090205460ff16610953576040517f4722506e00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b600061070d6105ef8a8a8a89898989610bb58f73ffffffffffffffffffffffffffffffffffffffff1660009081526005602052604090205490565b611b51565b60006040517ff242432a00000000000000000000000000000000000000000000000000000000815273ffffffffffffffffffffffffffffffffffffffff86811660048301528581166024830152604482018590526064820184905260a06084830152600060a483015287169063f242432a9060c401600060405180830381600087803b158015610c4957600080fd5b505af1925050508015610c5a575060015b610c66575060016106e3565b6000610529565b600080610c8060408c0160208d01612a7e565b91506000610c91898c8c8933611ae9565b805490915060ff16610a05578054610100900478ffffffffffffffffffffffffffffffffffffffffffffffffff16600003610de257610cd1898e876113c0565b610cde60208d018d612a7e565b8160000160016101000a81548178ffffffffffffffffffffffffffffffffffffffffffffffffff021916908378ffffffffffffffffffffffffffffffffffffffffffffffffff1602179055508681600001601a6101000a81548165ffffffffffff021916908365ffffffffffff1602179055503373ffffffffffffffffffffffffffffffffffffffff168973ffffffffffffffffffffffffffffffffffffffff16877f8979374cf098c34f366e31bfa620bec75a8f0341890f86f22348b81a46ec2cd08f6000016020810190610db49190612a7e565b60405178ffffffffffffffffffffffffffffffffffffffffffffffffff909116815260200160405180910390a45b80547a010000000000000000000000000000000000000000000000000000900465ffffffffffff16421115610e43576040517fe3fd7ac300000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b805478ffffffffffffffffffffffffffffffffffffffffffffffffff61010090910481169084161115610e95578054610100900478ffffffffffffffffffffffffffffffffffffffffffffffffff1692505b610ea560608d0160408e01612a7e565b78ffffffffffffffffffffffffffffffffffffffffffffffffff168378ffffffffffffffffffffffffffffffffffffffffffffffffff161015610f14576040517fb9ff981500000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b610f408b8a8a8d8778ffffffffffffffffffffffffffffffffffffffffffffffffff168963ffffffff16565b81547fffffffffffff00000000000000000000000000000000000000000000000000ff81166101009182900478ffffffffffffffffffffffffffffffffffffffffffffffffff90811687900381169092021783556040519085168152909250339073ffffffffffffffffffffffffffffffffffffffff8b169088907f9ef48344c14717ce0bc54579a384a2d2a5e10ffac024692def62083786fe33e59060200160405180910390a48054610100900478ffffffffffffffffffffffffffffffffffffffffffffffffff1660000361108b5780547fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0016600117815560405160008152339073ffffffffffffffffffffffffffffffffffffffff8b169088907f053489551d3cd7a95d914a0412d5404dcc4728be5d218e6eb5fee54c58da752d9060200160405180910390a45b509a509a98505050505050505050565b60006110aa8686868433611ae9565b8054909150427a01000000000000000000000000000000000000000000000000000090910465ffffffffffff16101561110f576040517f827aed8000000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b8054610100900478ffffffffffffffffffffffffffffffffffffffffffffffffff1683111561116a576040517ffee142c500000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b811561119b5780547fffffffffffff00000000000000000000000000000000000000000000000000ff1681556111ee565b805478ffffffffffffffffffffffffffffffffffffffffffffffffff6101008083048216869003909116027fffffffffffff00000000000000000000000000000000000000000000000000ff9091161781555b505050505050565b73ffffffffffffffffffffffffffffffffffffffff83166000908152600460209081526040808320600886901c845290915290208054600160ff85161b9081189182905516611271576040517fd979627300000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b8273ffffffffffffffffffffffffffffffffffffffff16827ff3003920635c7d35c4f314eaeeed4b4c653ccb36608a86d57df761d460eab09d836040516112bc911515815260200190565b60405180910390a3505050565b604080517f81b133f56c472bf5da2040f8c656a8878b79c9f03dc577987254677a15aa1c8d602082015273ffffffffffffffffffffffffffffffffffffffff808b1692820192909252606081018990526080810188905260a0810187905290851660c082015260e0810184905261010081018390526101208101829052600090610140015b60405160208183030381529060405280519060200120905098975050505050505050565b60006113ba61137f611705565b836040517f19010000000000000000000000000000000000000000000000000000000000008152600281019290925260228201526042902090565b92915050565b6113e0816113d16020850185612ac1565b84602001358560400135611bb8565b73ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff161461143a5773ffffffffffffffffffffffffffffffffffffffff83163b1561143f5761143a838284611cdf565b505050565b6040517f73c919b500000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60006114808388888486611ae9565b805460ff167a01000000000000000000000000000000000000000000000000000065ffffffffffff87169081027fffffffffffff00000000000000000000000000000000000000000000000000ff169190911761010078ffffffffffffffffffffffffffffffffffffffffffffffffff8916908102919091178355604080518a8152602081019290925281019190915290915073ffffffffffffffffffffffffffffffffffffffff83811691898216918616907f0ec867d4f1b037422566cd0248bae620e6c142dcf5631948271916e8ca8dd2639060600160405180910390a450505050505050565b60006116346105ef8a8a8a8a8a6115a28b73ffffffffffffffffffffffffffffffffffffffff1660009081526005602052604090205490565b604080517ff160315df13e27581afef864174cfcb89432db5cf7a399a29f606b80f7f64fd960208083019190915273ffffffffffffffffffffffffffffffffffffffff98909816818301526060810196909652608086019490945260a08501929092523360c085015260e084015261010080840191909152815180840390910181526101209092019052805191012090565b90506106078584898786868c611e69565b6000806000611657888787878b611ae9565b8054909150427a01000000000000000000000000000000000000000000000000000090910465ffffffffffff16106116b0578054610100900478ffffffffffffffffffffffffffffffffffffffffffffffffff166116b3565b60005b905478ffffffffffffffffffffffffffffffffffffffffffffffffff909116987a01000000000000000000000000000000000000000000000000000090910465ffffffffffff16975095505050505050565b60003073ffffffffffffffffffffffffffffffffffffffff7f00000000000000000000000000000000000000000000000000000000000000001614801561176b57507f000000000000000000000000000000000000000000000000000000000000000046145b1561179557507f000000000000000000000000000000000000000000000000000000000000000090565b6106a5604080517f8b73c3c69bb8fe3d512ecc4cf759cc79239f7b179b0ffacaa9a75d522b39400f60208201527f0000000000000000000000000000000000000000000000000000000000000000918101919091527f000000000000000000000000000000000000000000000000000000000000000060608201524660808201523060a082015260009060c00160405160208183030381529060405280519060200120905090565b60006040517f23b872dd00000000000000000000000000000000000000000000000000000000815273ffffffffffffffffffffffffffffffffffffffff86811660048301528581166024830152604482018490528416906323b872dd90606401600060405180830381600087803b1580156118b757600080fd5b505af19250505080156118c8575060015b6118d4575060016118db565b60006106e3565b949350505050565b60006040805173ffffffffffffffffffffffffffffffffffffffff87811660248301528681166044830152606480830186905283518084039091018152608490920183526020820180517bffffffffffffffffffffffffffffffffffffffffffffffffffffffff167f23b872dd0000000000000000000000000000000000000000000000000000000017905291516000928392908a16916119849190612ae4565b6000604051808303816000865af19150503d80600081146119c1576040519150601f19603f3d011682016040523d82523d6000602084013e6119c6565b606091505b5091509150816119d957600192506119f8565b8051156119f857808060200190518101906119f49190612b00565b1592505b82611a0257600092505b505095945050505050565b606060ff8314611a2757611a2083611efd565b90506113ba565b818054611a3390612b22565b80601f0160208091040260200160405190810160405280929190818152602001828054611a5f90612b22565b8015611aac5780601f10611a8157610100808354040283529160200191611aac565b820191906000526020600020905b815481529060010190602001808311611a8f57829003601f168201915b5050505050905092915050565b6000611acb8b8b8b898c8c8989610b7a565b9050611adc87868b8988868e611e69565b5050505050505050505050565b600060026000611afb88888888611f3c565b815260200190815260200160002060008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020905095945050505050565b604080516020810184905273ffffffffffffffffffffffffffffffffffffffff8a1691810191909152606081018890526080810187905260a081018690523360c082015260e08101859052610100810182905261012081018490526000906101400161134e565b60007f7fffffffffffffffffffffffffffffff5d576e7357a4501ddfe92f46681b20a0821115611c14576040517f73c919b500000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60408051600081526020810180835287905260ff861691810191909152606081018490526080810183905260019060a0016020604051602081039080840390855afa158015611c67573d6000803e3d6000fd5b50506040517fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0015191505073ffffffffffffffffffffffffffffffffffffffff81166118db576040517f73c919b500000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b600073ffffffffffffffffffffffffffffffffffffffff8416631626ba7e8460208501803590604087013590611d159088612ac1565b604051602001611d5d93929190928352602083019190915260f81b7fff0000000000000000000000000000000000000000000000000000000000000016604082015260410190565b6040516020818303038152906040526040518363ffffffff1660e01b8152600401611d89929190612b6f565b602060405180830381865afa925050508015611de0575060408051601f3d9081017fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0168201909252611ddd91810190612b88565b60015b15611e2c577fffffffff00000000000000000000000000000000000000000000000000000000167f1626ba7e000000000000000000000000000000000000000000000000000000001490505b80611e63576040517f73c919b500000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b50505050565b86421115611ea3576040517fe3fd7ac300000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b84861115611edd576040517fde7fafeb00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b611ee88484846113c0565b611ef4848260006111f6565b50505050505050565b60606000611f0a83611fcf565b604080516020808252818301909252919250600091906020820181803683375050509182525060208101929092525090565b600084848484611f6e8973ffffffffffffffffffffffffffffffffffffffff1660009081526005602052604090205490565b6040805173ffffffffffffffffffffffffffffffffffffffff968716602082015295909416938501939093526060840191909152608083015260a082015260c001604051602081830303815290604052805190602001209050949350505050565b600060ff8216601f8111156113ba576040517fb3512b0c00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60006060828403121561202257600080fd5b50919050565b803573ffffffffffffffffffffffffffffffffffffffff8116811461204c57600080fd5b919050565b803565ffffffffffff8116811461204c57600080fd5b6000806000806000806000806000806101c08b8d03121561208757600080fd5b6120918c8c612010565b99506120a08c60608d01612010565b98506120ae60c08c01612028565b975060e08b013596506120c46101008c01612028565b95506120d36101208c01612028565b94506101408b013593506120ea6101608c01612051565b92506101808b013591506101a08b013590509295989b9194979a5092959850565b600080600080600060a0868803121561212357600080fd5b61212c86612028565b945061213a60208701612028565b935061214860408701612028565b94979396509394606081013594506080013592915050565b803578ffffffffffffffffffffffffffffffffffffffffffffffffff8116811461204c57600080fd5b60008060008060008060008060006101608a8c0312156121a857600080fd5b6121b18a612028565b985060208a0135975060408a013596506121cd60608b01612160565b95506121db60808b01612028565b94506121e960a08b01612051565b93506121f760c08b01612051565b925061220560e08b01612028565b91506122158b6101008c01612010565b90509295985092959850929598565b6000806040838503121561223757600080fd5b61224083612028565b946020939093013593505050565b60008060008060008060008060006101608a8c03121561226d57600080fd5b6122768a612028565b985060208a0135975060408a0135965060608a0135955060808a013594506122a060a08b01612028565b93506122ae60c08b01612028565b925060e08a013591506122158b6101008c01612010565b6000602082840312156122d757600080fd5b5035919050565b600080600080608085870312156122f457600080fd5b6122fd85612028565b935061230b60208601612028565b925061231960408601612028565b9396929550929360600135925050565b600080600080600080600080610140898b03121561234657600080fd5b61234f89612028565b975060208901359650604089013595506060890135945061237260808a01612028565b935061238060a08a01612028565b925060c089013591506123968a60e08b01612010565b90509295985092959890939650565b60005b838110156123c05781810151838201526020016123a8565b50506000910152565b600081518084526123e18160208601602086016123a5565b601f017fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0169290920160200192915050565b7fff00000000000000000000000000000000000000000000000000000000000000881681526000602060e08184015261244f60e084018a6123c9565b8381036040850152612461818a6123c9565b6060850189905273ffffffffffffffffffffffffffffffffffffffff8816608086015260a0850187905284810360c0860152855180825283870192509083019060005b818110156124c0578351835292840192918401916001016124a4565b50909c9b505050505050505050505050565b6000806000806000806000806000806101808b8d0312156124f257600080fd5b6124fb8b612028565b995060208b0135985060408b0135975060608b0135965061251e60808c01612028565b955061252c60a08c01612028565b945060c08b013593506125428c60e08d01612010565b92506101408b013591506101608b013590509295989b9194979a5092959850565b600080600080600060a0868803121561257b57600080fd5b61258486612028565b94506020860135935061259960408701612028565b92506125a760608701612160565b91506125b560808701612051565b90509295509295909350565b60008060008060008060008060008060006101a08c8e0312156125e357600080fd5b6125ec8c612028565b9a5060208c0135995060408c0135985060608c0135975060808c0135965061261660a08d01612028565b955061262460c08d01612028565b945060e08c0135935061263b8d6101008e01612010565b92506101608c013591506101808c013590509295989b509295989b9093969950565b6000806000806000806000610120888a03121561267957600080fd5b61268288612028565b96506020880135955060408801359450606088013593506126a560808901612028565b92506126b360a08901612028565b91506126c28960c08a01612010565b905092959891949750929550565b60008083601f8401126126e257600080fd5b50813567ffffffffffffffff8111156126fa57600080fd5b60208301915083602082850101111561271257600080fd5b9250929050565b6000806000806000806000806000806000806101a08d8f03121561273c57600080fd5b6127458d612028565b9b5060208d01359a5060408d0135995060608d0135985060808d0135975061276f60a08e01612028565b965061277d60c08e01612028565b955060e08d013594506127948e6101008f01612010565b93506101608d0135925067ffffffffffffffff6101808e013511156127b857600080fd5b6127c98e6101808f01358f016126d0565b81935080925050509295989b509295989b509295989b565b60008060008060008060008060008060006101808c8e03121561280357600080fd5b61280c8c612028565b9a5060208c0135995060408c0135985060608c0135975061282f60808d01612028565b965061283d60a08d01612028565b955060c08c013594506128538d60e08e01612010565b93506101408c013592506101608c013567ffffffffffffffff81111561287857600080fd5b6128848e828f016126d0565b915080935050809150509295989b509295989b9093969950565b60008060008060008060008060006101608a8c0312156128bd57600080fd5b6128c68a612028565b985060208a0135975060408a0135965060608a013595506128e960808b01612028565b94506128f760a08b01612028565b93506129068b60c08c01612010565b92506101208a013591506101408a013590509295985092959850929598565b6000806000806080858703121561293b57600080fd5b61294485612028565b935061295260208601612028565b93969395505050506040820135916060013590565b6000806000806000806000806000806101608b8d03121561298757600080fd5b6129908b612028565b995060208b0135985060408b0135975060608b013596506129b360808c01612028565b95506129c160a08c01612028565b94506129d08c60c08d01612010565b93506101208b013592506101408b013567ffffffffffffffff8111156129f557600080fd5b612a018d828e016126d0565b915080935050809150509295989b9194979a5092959850565b60008060208385031215612a2d57600080fd5b823567ffffffffffffffff811115612a4457600080fd5b612a50858286016126d0565b90969095509350505050565b600060208284031215612a6e57600080fd5b612a7782612028565b9392505050565b600060208284031215612a9057600080fd5b612a7782612160565b60008451612aab8184602089016123a5565b8201838582376000930192835250909392505050565b600060208284031215612ad357600080fd5b813560ff81168114612a7757600080fd5b60008251612af68184602087016123a5565b9190910192915050565b600060208284031215612b1257600080fd5b81518015158114612a7757600080fd5b600181811c90821680612b3657607f821691505b602082108103612022577f4e487b7100000000000000000000000000000000000000000000000000000000600052602260045260246000fd5b8281526040602082015260006118db60408301846123c9565b600060208284031215612b9a57600080fd5b81517fffffffff0000000000000000000000000000000000000000000000000000000081168114612a7757600080fdfe53696e676c655573655065726d6974416476616e636564286164647265737320746f6b656e2c75696e743235362069642c75696e7432353620616d6f756e742c75696e74323536206e6f6e63652c61646472657373206f70657261746f722c75696e743235362065787069726174696f6e2c75696e74323536206d61737465724e6f6e63652ca2646970667358221220bb3fd5e6af916485ca15800e68d3bd3b4ef3e0321d4874a8f9097ca65decdfed64736f6c634300081300330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000075065726d6974430000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000013100000000000000000000000000000000000000000000000000000000000000";

    IImmutableCreate2Factory factory = IImmutableCreate2Factory(0x0000000000FFe8B47B3e2130213B802212439497);
    address expectedPermitCAddress = 0x000000fCE53B6fC312838A002362a9336F7ce39B;

    function run() public {
        if (expectedPermitCAddress.code.length > 0) {
            revert("PermitC already deployed");
        }

        bytes32 salt = 0x0000000000000000000000000000000000000000771737a46d75ad995610000c;

        address expectedAddressFromRead = factory.findCreate2Address(salt, permitCBytecode);

        if (expectedAddressFromRead != expectedPermitCAddress) {
            revert("Expected address from read does not match expected address");
        }

        address permitC = factory.safeCreate2(salt, permitCBytecode);

        console.log("DeterministicPermitC deployed at address: %s", address(permitC));
    }
}
