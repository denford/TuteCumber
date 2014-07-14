module.exports = ->
  @World = require('../support/world').World
  @Given /^the calculator is clear$/, (callback) ->

    # Write code here that turns the phrase above into concrete actions
    @clearCalculator()
    callback()
    return

  @When /^I add (\d+) and (\d+)$/, (arg1, arg2, callback) ->

    # Write code here that turns the phrase above into concrete actions
    @setArguments arg1, arg2
    @add()
    callback()
    return

  @When /^I subtract (\d+) from (\d+)$/, (arg1, arg2, callback) ->
    # we deliberately switch arg2 and arg1 here because of the order of operation
    # arg1 subtracted from arg2, so "arg2 minus arg1"
    @setArguments arg2, arg1
    @substract()
    callback()
    return

  @Then /^the result should be (\d+)$/, (arg1, callback) ->

    # Write code here that turns the phrase above into concrete actions
    result = @result()
    if result is Number arg1
      callback()
    else
      callback.fail new Error('Expected sum to be ' + arg1)
    return

  return
