module.exports =
  class Tiramisu.Home.Signup.View extends Backbone.View
    template: require 'tiramisu/home/signup/template'
    deployer: require 'tiramisu/deploy/signupService'

    events:
      'click [data-id="signupButton"]' : -> @deployer.signup(@getSignupCredentials())

    render: ->
      @$el.html @template()

    supply: -> 
      @render()
      @$el

    getSignupCredentials: ->
      username: @$username().val()
      password: @$password().val()

    $username: -> $('[data-id=usernameField]')
    $password: -> $('[data-id=passwordField]')
