'use strict';

poaCvApp.controller('VereadoresCtrl', function ($scope) {

    $scope.percentualPresenca = function (presencasDuranteMandato) {
      var numeroSecoesDuranteMandato = 10;
      return (presencasDuranteMandato / numeroSecoesDuranteMandato) * 100;
    };

    $scope.vereadores = [
        { nome: 'Airto Ferronato', email: 'ferronato@camarapoa.rs.gov.br', partido: 'PAB', foto: 'http://www.camarapoa.rs.gov.br/frames/veread/fotos/airtoferronato2.jpg', presencaUltimaSessao: true,  presencasDuranteMandato: 5 },
        { nome: 'Alceu Brasinha', email: 'brasinha@camarapoa.rs.gov.br',  partido: 'PTB', foto: 'http://www.camarapoa.rs.gov.br/frames/veread/fotos/brasinha.jpg',        presencaUltimaSessao: false, presencasDuranteMandato: 2 },
        { nome: 'Bernardino Vendruscolo', email: '', partido: 'PSD', foto: 'http://www.camarapoa.rs.gov.br/frames/veread/fotos/bernardino.jpg', presencaUltimaSessao: true, presencasDuranteMandato: 8 }
      ];
});
