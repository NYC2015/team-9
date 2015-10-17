Parse.initialize("8Zmxhf0z8gYpTzVPOIThIULbEo04hX3NT7bFvRx1", "l0ctJ43ZGTh9GqErJqAweKSF29zNzOBMUK6LfdRJ");

//*** SEND OBJECTS TO DATABASE
// var TestObject = Parse.Object.extend("TestObject");
// var testObject = new TestObject();
// testObject.save({foo: "bar"}).then(function(object) {
// alert("yay! it worked");
// });



// RETREIVE OBJECT FROM DATABASE

var TestObject = Parse.Object.extend("signees");
var query = new Parse.Query(TestObject);
query.equalTo("name", "Basil Vetas");
query.find({
  success: function(results) {
    // alert("Successfully retrieved " + results.length + " scores.");
    // Do something with the returned Parse.Object values
      var object = results[0];
      // alert(object.id + ' - ' + object.get('objectId'));

      var imageFile = object.get('picture');
      document.getElementById("profilePic").src = imageFile.url();
    }
  },
  error: function(error) {
    alert("Error: " + error.code + " " + error.message);
  }
});