var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {
    var config = {headers:  {
        'api_key' : "123",
        'crossDomain' : 'true',
        'Access-Control-Allow-Origin' :"*",
        'Access-Control-Allow-Methods' : 'POST, GET',
        'Access-Control-Allow-Headers': '*'
    }
    };
    $http.get('http://localhost:3000/events/3', config).sucess = function($data){
        console.debug($data);
    }
});