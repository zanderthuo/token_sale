var UbnToken = artifacts.require("./UbnToken.sol");
var UbnTokenSale = artifacts.require("./UbnTokenSale.sol");

module.exports = function(deployer) {
  deployer.deploy(UbnToken, 1000000).then(function(){

  	// Token price is 0.001 Ether
  	var tokenPrice = 1000000000000000;
  	return deployer.deploy(UbnTokenSale, UbnToken.address, tokenPrice);
  });
  //deployer.deploy(UbnTokenSale);
};
