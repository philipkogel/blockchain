(async () => {
    const address = "0x3328358128832A260C76A4141e19E2A943CD4B6D";
    const abiArray = [
	{
		"inputs": [],
		"name": "myUint",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_newUint",
				"type": "uint256"
			}
		],
		"name": "setMyUint",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
];

    const contractInstance = new web3.eth.Contract(abiArray, address);
    console.log(await contractInstance.methods.myUint().call());

	let accounts = await web3.eth.getAccounts();
	await contractInstance.methods.setMyUint(345).send({from: accounts[0]});

	console.log(await contractInstance.methods.myUint().call());
})();