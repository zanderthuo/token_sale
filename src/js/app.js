App = {
	web3Provider:null,
	contracts: {},
	account: '0x0',

	init: function() {
		console.log("App initialized...")
		return App.initWeb3();
	},

	initWeb3: function() {
		if (typeof web3 !== 'undefined') {
			//If a web3 instance is already provided by Meta Mask
			App.web3Provider = web3.currentProvider;
		  web3 = new Web3(web3.currentProvider);
		} else {
		  // Set the provider you want from Web3.providers
		  App.web3Provider = new Web3.providers.HttpProvider('http://localhost:8545');
		  web3 = new Web3(new Web3.providers);
		}

		return App.initContracts();
	},
	initContracts: function() {
		$.getJSON("UbnTokenSale", function(ubnTokenSale) {
		  App.contracts.UbnTokenSale = TruffleContract(ubnTokenSale);
		  App.contracts.UbnTokenSale.setProvider(App.web3Provider);
		  App.contracts.UbnTokenSale.deployed().then(function(ubnTokenSale){
		  	console.log("Ubn Token Sale Address:", ubnTokenSale.address);
		  })
		   }).done(function(){
		  	$.getJSON("UbnToken.json", function(UbnToken){ 
				App.contracts.UbnToken = TruffleContract(UbnTokenSale);
				App.contracts.UbnToken.setProvider(App.web3Provider);
				App.contracts.UbnToken.deployed().then(function(UbnTokenSale){
				  console.log("Ubn Token Sale Address:", UbnTokenSale.address);	
		  	});
			return App.render()	
		  });	
		})
	  },

render: function() {
	//Load account data
	web3.eth.getCoinbase(function(err, account){
		if(err === null){
			console.log("account", account);
			App.account = account;
			$('#accountAddress').html("Your Account:" + account);
		}
	});
   }
}

$(function() {
  $(window).load(function() {
    App.init();
  })
});