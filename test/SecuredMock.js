var Secured = artifacts.require("SecuredMock.sol")
var tests = require('@daonomic/tests-common');
var expectThrow = tests.expectThrow;
var randomAddress = tests.randomAddress;

contract('SecuredImpl', function(accounts) {
  let secured;

  beforeEach(async function() {
    secured = await Secured.new();
  });

  it('should let owner change roles', async function() {
    await secured.transferRole("user", accounts[1]);
    await secured.transferRole("operator", accounts[2]);
    assert.equal(await secured.getRole("user"), accounts[1]);
    await secured.action2({from: accounts[1]});
    await expectThrow(
        secured.action2({from: accounts[2]})
    );
    await secured.action1({from: accounts[2]});
    await expectThrow(
        secured.action1({from: accounts[1]})
    );
  });

  it('should not let others change roles', async function() {
    var address = randomAddress();

    await expectThrow(
        secured.transferRole("user", address, {from: accounts[1]})
    );
  });
});