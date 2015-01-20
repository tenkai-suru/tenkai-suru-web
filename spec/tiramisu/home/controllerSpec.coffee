DescribedClass = require 'tiramisu/home/controller'
require 'tiramisu/home/dashboard/view'

describe "Tiramisu.Home.Controller", ->
  describe ".dashboard", ->
    it "appends view#_dashboard template to provided element", ->
      mockView =
        supply: -> 'renderedElement'
      mockEl =
        append: (el) -> @appendedEl = el
      spyOn(DescribedClass, '_dashboard').and.returnValue(mockView)
      DescribedClass.dashboard(mockEl)
      expect(mockEl.appendedEl).toBe("renderedElement")

  describe ".landing", ->
    it "appends view#_landing template to provided element", ->
      mockView =
        supply: -> 'renderedElement'
      mockEl =
        append: (el) -> @appendedEl = el
      spyOn(DescribedClass, '_signup').and.returnValue(mockView)
      DescribedClass.landing(mockEl)
      expect(mockEl.appendedEl).toBe("renderedElement")
