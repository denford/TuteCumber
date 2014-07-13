# a simple pretend little calculator just to test out cucumber
# takes two numbers, adds them later
module.exports.World = World = (callback) ->
  @clearCalculator = ->
    return

  # if there was some asynchronous processing in our world...
  @clearCalculatorAsync = (callback) ->
    # do some async stuff
    callback()
    return

  @setArguments = (arg1, arg2) ->
    @arg1 = Number arg1
    @arg2 = Number arg2
    return

  @add = ->
    @arg1 + @arg2

  @doBeforeScenario = ->
    console.log 'Before scenario prep code'
    return

  @doAfterScenario = ->
    console.log 'After scenario cleanup code'
    return

  callback()
  return