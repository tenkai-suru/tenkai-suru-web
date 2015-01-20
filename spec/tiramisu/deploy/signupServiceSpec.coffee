DescribedClass = require 'tiramisu/deploy/signupService'
require 'tiramisu/auth/loginService'

describe "Tiramisu.Deploy.SignupService", ->
  describe 'application Signup', ->
    describe "#deploy", ->
      jet 'params', -> { 'key':'value'}
      it "delegates the signup post to the APIClient", ->
        spyOn(Tiramisu.Deploy.Client, 'signup')
        Tiramisu.Deploy.SignupService.signup(params)
        expect(Tiramisu.Deploy.Client.signup).toHaveBeenCalledWith(params, Tiramisu.Deploy.SignupService.success, Tiramisu.Deploy.SignupService.fail)
