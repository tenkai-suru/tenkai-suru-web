(function() {
  window._let = function(name, fn) {
    return {
      configurable: true,
      get: function() {
        var _name;
        return window[_name = "__" + name + "Cache__"] || (window[_name] = fn());
      },
      set: void 0
    };
  };
 
  window._assign = function(name, fn) {
    return window[name] = fn();
  };
 
  window._defer = function(name, fn) {
    window["__" + name + "Cache__"] = null;
    return Object.defineProperty(window, name, _let(name, fn));
  };
 
  window._remove = function(name) {
    delete window["__" + name + "Cache__"];
    return delete window[name];
  };
 
  window.jet = function(name, fn) {
    beforeEach(function() {
      return _defer(name, fn);
    });
    return afterEach(function() {
      return _remove(name);
    });
  };
 
  window._jet = function(name, fn) {
    beforeEach(function() {
      return _assign(name, fn);
    });
    return afterEach(function() {
      return _remove(name);
    });
  };
 
}).call(this);
