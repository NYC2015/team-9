'use strict';
Parse.initialize("8Zmxhf0z8gYpTzVPOIThIULbEo04hX3NT7bFvRx1", "l0ctJ43ZGTh9GqErJqAweKSF29zNzOBMUK6LfdRJ");

/* Controllers */

var rockEarthApp = angular.module('rockEarthApp', []);

rockEarthApp.controller('MainController', ['$scope', function($scope) {
	$scope.name = "Close Indian Point Nuclear Plant Now";
	$scope.number = 2;
	$scope.count = 1234;
	var data = [];
	var myResults;

	var TestObject = Parse.Object.extend("signees");
	var query = new Parse.Query(TestObject);

	query.equalTo("campaignID", "eAtTvEfnEK");
	query.find({
	  success: function(results) {	  	
	    
	    for (var i = 0; i < 10; i++) {
	      var object = results[results.length - i - 1];	      
	      var imageFile = object.get('picture');

	      var imgId = 'img' + i.toString();	      
	      document.getElementById(imgId).src = imageFile.url();	      	      
	    }

	    for (var i = 0; i < 4; i++) {
	      var object = results[results.length - i - 1];	     

	      var imageFile = object.get('picture');

	      document.getElementById('prof' + i.toString()).src = imageFile.url();	      
	      document.getElementById('name' + i.toString()).innerHTML = object.get('name');	      
	      document.getElementById('city' + i.toString()).innerHTML = object.get('locationName');	      
	    }
	  },
	  error: function(error) {
	    alert("Error: " + error.code + " " + error.message);
	  }
	});	
}]);








