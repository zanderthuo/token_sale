var UbnToken = artifacts.require("./UbnToken.sol");

module.exports = function(deployer) {
  deployer.deploy(UbnToken);
};
