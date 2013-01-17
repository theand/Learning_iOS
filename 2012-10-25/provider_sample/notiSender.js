function NotiSender() {
}

NotiSender.prototype.send = function(token, alert) {
console.log('sending ' + alert);
    var apns = require('apn');
    var options = {
        cert: 'APN_Test_Cert.pem', 
        key:  'APN_Test_Key.pem',              
        passphrase: 'apntest',      
        gateway: 'gateway.sandbox.push.apple.com',
        port: 2195, 
        enhanced: true,
        errorCallback: false,
        cacheLength: 100
    };

    var apnsConnection = new apns.Connection(options);   

    var myDevice = new apns.Device(token);
    var note = new apns.Notification();

    note.expire = Math.floor(Date.now() / 1000) + 3600;
    note.sound = "ping.aiff";
    note.alert = alert;
    note.payload = {'messageFrom': 'me'};
    note.device = myDevice;

    apnsConnection.sendNotification(note);    
}

module.exports = NotiSender;

