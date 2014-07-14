class Calc
  _arg1: 0
  _arg2: 0

  constructor: ->
    # nothing to do in this constructor
    return

  clearCalculator: ->
    return

  setArguments: (arg1, arg2) ->
    @_arg1 = Number arg1
    @_arg2 = Number arg2
    return

  add: ->
    @_arg1 + @_arg2

module.exports = Calc