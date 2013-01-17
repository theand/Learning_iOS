var friends;
var fs = require('fs');
fs.readFile('friend_list.json', 'utf8', function(err, data) {
	var json_obj = JSON.parse(data);
	friends = json_obj.friends;
//  	console.log(friends);
});

var server = require('http');
var url = require('url');
server.createServer(function(req, res) {
	var url_parts = url.parse(req.url, true);
	var query = url_parts.query;
	
	var name = query.name;
	var msg = query.msg;
	
 	//console.log('name : ' + name + ' msg : ' + msg);
	
	var success = false;
	
	friends.forEach(function(item) {
		console.log('name : ' + name + ' item name ' + item.name);
		if ( item.name == name ) {
// 		console.log('found!');
			var NotiSender = require('./notiSender');
			var sender = new NotiSender();
			sender.send(item.deviceToken, msg);
			console.log('send noti to ' + item.name);
			success = true;
		}
	});

	res.writeHead(200, {'Content-Type':'text/plain'});
	if ( success )
		res.end('Success!');
	else
		res.end('Fail!');
}).listen(3000);
