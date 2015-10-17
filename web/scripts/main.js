'use strict';
Parse.initialize("8Zmxhf0z8gYpTzVPOIThIULbEo04hX3NT7bFvRx1", "l0ctJ43ZGTh9GqErJqAweKSF29zNzOBMUK6LfdRJ");

// var TestObject = Parse.Object.extend("TestObject");
// var testObject = new TestObject();
// testObject.save({foo: "bar"}).then(function(object) {
// alert("yay! it worked");
// });

/* Controllers */

var rockEarthApp = angular.module('rockEarthApp', []);

rockEarthApp.controller('MainController', ['$scope', function($scope) {
	$scope.name = "Close Indian Point Nuclear Plant Now";
	$scope.number = 2;
	$scope.count = 1234;
	var data = [];
	var myResults;

	var TestObject = Parse.Object.extend("pictureTest");
	var query = new Parse.Query(TestObject);

	query.equalTo("campaign", "water");
	query.find({
	  success: function(results) {	  	

	  	// console.log(results);
	    // alert("Successfully retrieved " + results.length + " scores.");
	    // Do something with the returned Parse.Object values
	    for (var i = 0; i < $scope.number; i++) {
	      var object = results[i];
	      // alert(object.id + ' - ' + object.get('objectId'));

	      var imageFile = object.get('testPictures');

	      var imgId = 'img' + i.toString();
	      // console.log(imgId);
	      // document.getElementById(imgId).src 
	      document.getElementById(imgId).src = imageFile.url();	      
	      // console.log(data);		      
	    }

	    // $scope.$apply(function(results)
	    // {
	    // 	$scope.objects = results.map(function(obj)
	    // 	{
	    // 		return {url: obj.get('testPictures'),
	    // 		parseObject: obj};
	    // 	});

	    // });

	    // $scope.objects = data;	    
	    // console.log($scope.objects);


	  },
	  error: function(error) {
	    alert("Error: " + error.code + " " + error.message);
	  }
	});

	// $scope.objects = {}; // make http request for objects
}]);

// $(window).resize(function() {
//   var docWidth = $(document).width();
//   console.log(docWidth);	
// 	var titleWidth = $('#title').width();
// 	console.log(titleWidth);	
// 	var newWidth = (docWidth / 2) - (titleWidth/2);
// 	$('#title').css("left",newWidth);	
// });

// $(window).load(function() {

// });








