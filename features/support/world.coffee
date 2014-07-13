module.exports.World = (callback) ->
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

  callback()
  return
