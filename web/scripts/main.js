'use strict';
Parse.initialize("h840VqB3Hj6oaiccjPXFrlj86jwu1ecCmv0N8pc4", "mupd3jOW4P0UdkQScPhn11Lhhg7uknxURWkbtV9Y");

// var TestObject = Parse.Object.extend("TestObject");
// var testObject = new TestObject();
// testObject.save({foo: "bar"}).then(function(object) {
// alert("yay! it worked");
// });

/* Controllers */

var rockEarthApp = angular.module('rockEarthApp', []);

rockEarthApp.controller('MainController', ['$scope', function($scope) {
	$scope.name = "Close Indian Point Nuclear Plant Now";
	$scope.count = 8;

	// $scope.objects = {}; // make http request for objects
}]);

$(window).resize(function() {
  var docWidth = $(document).width();
  console.log(docWidth);	
	var titleWidth = $('#title').width();
	console.log(titleWidth);	
	var newWidth = (docWidth / 2) - (titleWidth/2);
	$('#title').css("left",newWidth);	
});






