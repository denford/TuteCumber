module.exports = ->
  @World = require('../support/world').World
  @Given /^the calculator is cleared$/, (callback) ->
    @clearCalculator()
    callback()
    return

  @When /^I add (-?\d+) and (-?\d+)$/, (arg1, arg2, callback) ->
    @add(arg1)
    @add(arg2)
    callback()
    return

  @When /^then add (-?\d+)$/, (arg1, callback) ->
    @add(arg1)
    callback()
    return

  @When /^I subtract (-?\d+) from (-?\d+)$/, (arg1, arg2, callback) ->
    # we deliberately switch arg2 and arg1 here because of the order of operation
    # arg1 subtracted from arg2, so "arg2 minus arg1"
    @add(arg2)
    @substract(arg1)
    callback()
    return

  @When /^then subtract (-?\d+)$/, (arg1, callback) ->
    @substract(arg1)
    callback()
    return

  @Then /^the result should be (-?\d+)$/, (arg1, callback) ->

    # Write code here that turns the phrase above into concrete actions
    result = @result()
    if result is Number arg1
      callback()
    else
      callback.fail new Error('Expected sum to be ' + arg1)
    return

  return
