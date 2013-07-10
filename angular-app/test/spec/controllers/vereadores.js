'use strict';

describe('Controller: OntemCtrl', function () {

  // load the controller's module
  beforeEach(module('PoaComoVamosApp'));

  var OntemCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    OntemCtrl = $controller('OntemCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
