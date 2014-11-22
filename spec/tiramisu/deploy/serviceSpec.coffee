DescribedClass = require 'tiramisu/deploy/service'

describe "Tiramisu.Service.Deployer", ->
  describe "application Deployment", ->
    describe "#deploy", ->
      it "delegates the deploy post to the APIClient", ->
        applicationData =
            id: "id"
            health: 'up'
        application = new Backbone.Model(applicationData)
        deployer = new DescribedClass(application)
        spyOn(deployer.apiClient, 'deploy')
        deployer.deploy()
        expect(deployer.apiClient.deploy).toHaveBeenCalledWith("id", deployer.pollHealthCheck)

  describe "application Health Check", ->
    describe "#healthCheck", ->
      it "delegates the healthCheck get to the APIClient", ->
        applicationData =
            id: "id"
            health: 'up'
        application = new Backbone.Model(applicationData)
        deployer = new DescribedClass(application)
        spyOn(deployer.apiClient, 'healthCheck')
        deployer.healthCheck("callback")
        expect(deployer.apiClient.healthCheck).toHaveBeenCalledWith("id", "callback")

    describe "#pollHealthCheck", ->
      it "change the model status to 'up' if response is healthy", ->
        applicationData =
          id: "id"
          health: "down"
        application = new Backbone.Model(applicationData)
        deployer = new DescribedClass(application)
        deployer.pollHealthCheck({healthy: true})
        expect(application.get("health")).toEqual("up")

      it "calls healthcheck if response is not healthy in 5 seconds", ->
        timeout = spyOn(window, 'setTimeout')
        applicationData =
          id: "id"
          health: "up"
        application = new Backbone.Model(applicationData)
        deployer = new DescribedClass(application)
        deployer.pollHealthCheck({healthy: false})
        expect(application.get("health")).toEqual("down")
        expect(timeout).toHaveBeenCalledWith(deployer.repollHealthCheck, 5000)
