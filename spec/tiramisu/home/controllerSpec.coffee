require 'config/namespace'
require 'tiramisu/home/controller'
require 'tiramisu/home/index/view'

describe "Tiramisu.Home.Controller", ->
  describe ".index", ->
    it "appends view#_index template to provided element", ->
      mockView =
        supply: -> 'renderedElement'
      mockEl =
        append: (el) -> @appendedEl = el
      spyOn(Tiramisu.Home.Controller, '_index').and.returnValue(mockView)
      Tiramisu.Home.Controller.index(mockEl)
      expect(mockEl.appendedEl).toBe("renderedElement")
