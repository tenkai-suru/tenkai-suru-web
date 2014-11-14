DescribedClass = require 'tiramisu/service/deployer'

describe "Tiramisu.Service.Deployer", ->
  describe "app deployment", ->
    it "delegates the deploy post to the APIClient", ->
      applicationData = {
          id: "id"
          health: 'up'
      }
      application = new Backbone.Model(applicationData)
      deployer = new DescribedClass(application)
      spyOn(deployer.apiClient, 'deploy')
      deployer.deploy()
      expect(deployer.apiClient.deploy).toHaveBeenCalledWith("id")
  describe "app healthCheck", ->
    it "delegates the healthCheck get to the APIClient", ->
      applicationData = {
          id: "id"
          health: 'up'
      }
      application = new Backbone.Model(applicationData)
      deployer = new DescribedClass(application)
      spyOn(deployer.apiClient, 'healthCheck')
      deployer.healthCheck()
      expect(deployer.apiClient.healthCheck).toHaveBeenCalledWith("id")
