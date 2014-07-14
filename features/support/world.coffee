# a simple pretend little calculator just to test out cucumber
# takes two numbers, adds them later
module.exports.World = World = (callback) ->

  Calc = require('../../models/calc')
  @calc = new Calc

  # # if there was some asynchronous processing in our world...
  # @clearCalculatorAsync = (callback) ->
  #   # do some async stuff
  #   callback()
  #   return

  @clearCalculator = ->
    @calc.clearCalculator()
    return

  @add = (arg) ->
    @calc.add(Number arg)
    return

  @substract = (arg) ->
    @calc.substract(Number arg)
    return

  @result = ->
    @calc.result()

  @doBeforeScenario = ->
    console.log 'Before scenario prep code'
    return

  @doAfterScenario = ->
    console.log 'After scenario cleanup code'
    return

  callback()
  return