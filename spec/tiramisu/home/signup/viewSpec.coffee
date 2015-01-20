DescribedClass = require 'tiramisu/home/signup/view'

describe 'Tiramisu.Home.Signup.View', ->
  jet 'view' , -> new DescribedClass() 

  beforeEach ->
    spyOn(view.deployer, 'signup')

  describe '#supply', ->
    it 'renders and returns the template', ->
      expected = (require 'tiramisu/home/signup/template')()
      el = view.supply()
      expect(expected).toEqual(el.html())

  describe '#events', ->
    describe 'click [data-id="signupButton"]', ->
      it 'passes params from form to deployer#signup', ->
        $el = setFixtures('<div id="index"><input type="text" data-id="usernameField" value="username"><input type="password" value="password" data-id="passwordField"><button class="signupButton" data-id="signupButton">Signup</button></div>')
        view = new DescribedClass(el: $el)
        view.$el.find('.signupButton').click()
        expect(view.deployer.signup).toHaveBeenCalledWith(view.getSignupCredentials())
