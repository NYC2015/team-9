'use strict';
Parse.initialize("h840VqB3Hj6oaiccjPXFrlj86jwu1ecCmv0N8pc4", "mupd3jOW4P0UdkQScPhn11Lhhg7uknxURWkbtV9Y");

// var TestObject = Parse.Object.extend("TestObject");
// var testObject = new TestObject();
// testObject.save({foo: "bar"}).then(function(object) {
// alert("yay! it worked");
// });

/* Controllers */

var rockEarthApp = angular.module('rockEarthApp', []);

rockEarthApp.controller('MainController', function($scope) {
	// $scope.objects = {}; // make http request for objects
});

function getRandomSize(min, max) {
  return Math.round(Math.random() * (max - min) + min);
}

for (var i = 0; i < 8; i++) {
	console.log("GOt here");
  var width = getRandomSize(200, 400);
  var height =  getRandomSize(200, 400);
  $('#photo-grid').append('<img src="http://www.lorempixel.com/'+width+'/'+height+'/cats" alt="pretty kitty">');
}

