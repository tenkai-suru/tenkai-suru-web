require 'tiramisu/deploy/client'

module.exports =
  Tiramisu.Deploy.SignupService =
    signup: (params) ->
      Tiramisu.Deploy.Client.signup(params, @success, @fail)

    success: (response) ->
      alert('success')

    fail: (response) ->
      alert('failboat')
