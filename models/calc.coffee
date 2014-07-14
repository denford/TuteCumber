class Calc
  _arg1: 0
  _arg2: 0
  _currentSum: 0

  constructor: ->
    # nothing to do in this constructor
    return

  clearCalculator: ->
    @_currentSum = 0
    return

  setArguments: (arg1, arg2) ->
    @_arg1 = Number arg1
    @_arg2 = Number arg2
    return

  add: ->
    @_currentSum = @_arg1 + @_arg2
    return

  substract: ->
    @_currentSum = @_arg1 - @_arg2
    return

  result: ->
    @_currentSum

module.exports = Calc