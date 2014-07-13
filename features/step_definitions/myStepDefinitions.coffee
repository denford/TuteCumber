module.exports = ->
  @World = require('../support/world').World
  @Given /^the calculator is clear$/, (callback) ->

    # Write code here that turns the phrase above into concrete actions
    @clearCalculator callback
    # callback.pending()
    return

  @When /^I add (\d+) and (\d+)$/, (arg1, arg2, callback) ->

    # Write code here that turns the phrase above into concrete actions
    @setArguments arg1, arg2, callback
    return

  @Then /^the result should be (\d+)$/, (arg1, callback) ->

    # Write code here that turns the phrase above into concrete actions
    result = @add()
    if result is Number arg1
      callback()
    else
      callback.fail new Error('Expected sum to be ' + arg1)
    return

  return
