// Generated by CoffeeScript 1.9.0
var app, bodyParser, cookieParser, debug, express, favicon, logger, path, routes, server;

express = require('express');

path = require('path');

favicon = require('serve-favicon');

logger = require('morgan');

cookieParser = require('cookie-parser');

bodyParser = require('body-parser');

routes = require('./routes/index');

app = express();

app.set('views', path.join(__dirname, 'views'));

app.set('view engine', 'ejs');

app.use(logger('dev'));

app.use(bodyParser.json());

app.use(bodyParser.urlencoded({
  extended: false
}));

app.use(cookieParser());

app.use(express["static"](path.join(__dirname, 'public')));

app.use(express["static"](path.join(__dirname, 'js')));

app.use(express["static"](path.join(__dirname, 'themes')));

app.use(express["static"](path.join(__dirname, 'uploadify')));

app.use(express["static"](path.join(__dirname, 'xheditor')));

app.use(express["static"](path.join(__dirname, 'chart')));

app.use(express["static"]('dwz.frag.xml'));

app.use('/', routes);

app.use(function(req, res, next) {
  var err;
  err = new Error('Not Found');
  err.status = 404;
  return next(err);
});

if (app.get('env') === 'development') {
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    return res.render('error', {
      message: err.message,
      error: err
    });
  });
}

debug = require('debug')('dwz');

app.set('port', process.env.PORT || 3000);

server = app.listen(app.get('port'), function() {
  return console.log('Express server listening on port ' + server.address().port);
});

//# sourceMappingURL=app.js.map