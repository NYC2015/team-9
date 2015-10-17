Parse.initialize("h840VqB3Hj6oaiccjPXFrlj86jwu1ecCmv0N8pc4", "mupd3jOW4P0UdkQScPhn11Lhhg7uknxURWkbtV9Y");



var TestObject = Parse.Object.extend("TestObject");
var testObject = new TestObject();
testObject.save({foo: "bar"}).then(function(object) {
alert("yay! it worked");
});


