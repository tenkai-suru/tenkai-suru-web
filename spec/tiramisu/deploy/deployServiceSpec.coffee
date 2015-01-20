DescribedClass = require 'tiramisu/deploy/deployService'

describe "Tiramisu.Deploy.DeployService", ->
  jet 'application', -> new Backbone.Model({id: "id", health: "up"})
  jet 'deployer', -> new DescribedClass(application)

  describe "application Deployment", ->
    describe "#deploy", ->
      it "delegates the deploy post to the APIClient", ->
        spyOn(deployer.apiClient, 'deploy')
        deployer.deploy()
        expect(deployer.apiClient.deploy).toHaveBeenCalledWith("id", deployer.pollHealthCheck)

  describe "application Health Check", ->
    describe "#healthCheck", ->
      it "delegates the healthCheck get to the APIClient", ->
        spyOn(deployer.apiClient, 'healthCheck')
        deployer.healthCheck("callback")
        expect(deployer.apiClient.healthCheck).toHaveBeenCalledWith("id", "callback")

    describe "#pollHealthCheck", ->
      it "change the model status to 'up' if response is healthy", ->
        application.set({health: "down"})
        deployer.pollHealthCheck({healthy: true})
        expect(application.get("health")).toEqual("up")

      it "calls healthcheck if response is not healthy in 5 seconds", ->
        timeout = spyOn(window, 'setTimeout')
        deployer.pollHealthCheck({healthy: false})
        expect(application.get("health")).toEqual("down")
        expect(timeout).toHaveBeenCalledWith(deployer.repollHealthCheck, 5000)
