'use strict'

describe('Filters: embaralhar', function() {

  var original, embaralhado, embaralhar, segundoEmbaralhado;

  beforeEach(module('poaComoVamos'));

  beforeEach(inject(function($filter) {
    embaralhar = $filter('embaralhar');
    original = ['Jose Sarney', 'Fernando Collor', 'Itamar Franco', 'Fernando Henrique Cardoso', 'Luis Inacio Lula', 'Dilma Rousseff'];
  }));

  describe("recebe um array de vereadores", function(){

    beforeEach(inject(function($filter) {
      embaralhado = embaralhar(original);
      segundoEmbaralhado = embaralhar(original);
    }));

    it('deve retornar um array com o mesmo tamanho', function(){
      expect(original.length).toEqual(embaralhado.length);
    });

    it('deve embaralhar o array', function() {
      expect(original).not.toEqual(embaralhado);
    });

    it('apos primeiro embaralhar, proximos embaralhars devem retornar o mesmo array',function(){
      expect(embaralhado).toEqual(segundoEmbaralhado);
    });
  });

  describe('quando recebe um $resouce', function(){
    var resourceArray, $httpBackend, $resource;
    beforeEach(inject(function($injector){
      //mock
      $httpBackend = $injector.get('$httpBackend');
      $resource = $injector.get('$resource');

      $httpBackend.expectGET('/foo_bar').respond(original);
      resourceArray = $resource('/foo_bar').query();
    }));

    afterEach(function() {
       $httpBackend.verifyNoOutstandingExpectation();
       $httpBackend.verifyNoOutstandingRequest();
     });

    describe('pendente',function(){
      beforeEach(function(){
        //tenta embaralhar o resource ainda nao resolvido
        embaralhado = embaralhar(resourceArray);
        $httpBackend.flush();
      });

      it('deve retornar um array vazio', function(){
        expect(embaralhado.length).toEqual(0);
      });
    });

    describe('resolvido', function(){
      beforeEach(function(){
        //resolve o array e depois embaralha
        $httpBackend.flush();
        embaralhado = embaralhar(resourceArray);
      });

      it('deve retornar o array embaralhado', function(){
        expect(original).not.toEqual(embaralhado)
      });
    });

  });

});
