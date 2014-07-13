# a simple pretend little calculator just to test out cucumber
# takes two numbers, adds them later
module.exports.World = World = (callback) ->
  @clearCalculator = (callback) ->
    callback()
    return

  @setArguments = (arg1, arg2, callback) ->
    @arg1 = Number arg1
    @arg2 = Number arg2
    callback()
    return

  @add = ->
    @arg1 + @arg2

  @doBeforeScenario = ->
    console.log 'Before scenario prep code'
    return

  @doAfterScenario = ->
    console.log 'After scenario cleanup code'
    return

  @doAfterFeature = ->
    console.log 'After feature cleanup code'
    return

  callback()
  return
