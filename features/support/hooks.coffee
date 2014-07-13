# # S T Y L E   1
# # before and after
# module.exports = ->
#   @Before (callback) ->
#     @doBeforeScenario()
#     callback()
#     return

#   @After (callback) ->
#     @doAfterScenario()
#     callback()
#     return

#   return



# # S T Y L E   2
# # before and after with scenario object
# module.exports = ->
#   @Before (scenario, callback) ->
#     @doBeforeScenario()
#     console.log scenario.getName(), '(' + scenario.getUri() + ':' + scenario.getLine() + ')'
#     callback()
#     return

#   @After (scenario, callback) ->
#     @doAfterScenario()
#     console.log scenario.getName(), '(' + scenario.getUri() + ':' + scenario.getLine() + ')'
#     callback()
#     return

#   return



# # S T Y L E   3
# # before and after with tags in .feature file
# module.exports = ->
#   @Before '@tag2', (callback) ->
#     @doBeforeScenario()
#     callback()
#     return

#   @After '@tag3', (callback) ->
#     @doAfterScenario()
#     callback()
#     return

#   return



# # S T Y L E   4
# # registering handlers
# # can be Before/After with Features/Feature/Scenario/Step
# module.exports = ->
#   @registerHandler 'AfterFeature', (event, callback) ->
#     # not sure if you're meant to be able to access the World object here
#     # perhaps this is more the place for more "global" wrap-up like closing
#     # browsers etc.
#     console.log 'After feature cleanup code'
#     callback()
#     return

#   return



# # S T Y L E   5
# # using Around function for before and after
# module.exports = ->
#   @Around (runScenario) ->
#     @doBeforeScenario()

#     runScenario (callback) ->
#       @doAfterScenario()
#       callback()
#       return

#     return

#   return