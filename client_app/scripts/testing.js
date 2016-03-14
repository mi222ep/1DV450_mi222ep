var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {
    var config = {headers:  {
        'apikey' : "123",
    }
    };
    $http.get('http://localhost:3000/events/', config).success(function($data){
        console.log($data);
        $scope.info = $data;
    })
});