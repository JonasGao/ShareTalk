express = require('express');
path = require('path');
logger = require('morgan');
cookieParser = require('cookie-parser');
bodyParser = require('body-parser');
session = require('express-session');

app = express();

app.use(logger('dev'));

app.use(express.static(path.join(__dirname, 'public')));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(cookieParser());
app.use(session({secret: "share-talk"}));

app.use(require('./routes'));

# catch 404 and forward to error handler
app.use((req, res, next) ->
  err = new Error('Not Found');
  err.status = 404;
  next(err);
);

# error handlers

# development error handler
# will print stacktrace
if (app.get('env') is 'development')
  app.use((err, req, res) ->
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: err
    });
  );

# production error handler
# no stacktraces leaked to user
app.use((err, req, res) ->
  res.status(err.status || 500);
  res.render('error', {
    message: err.message,
    error: {}
  });
);

module.exports = app;
