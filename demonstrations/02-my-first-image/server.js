var express = require('express');
var serveIndex = require('serve-index');
var app = express();

app.get('/', function (req, res) {
  console.log('got a request');
  res.send('Hello World!');
});

app.use('/static', express.static('public'));
app.use('/static', serveIndex('public'));

var server = app.listen(3000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});

