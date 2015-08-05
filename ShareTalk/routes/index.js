var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res) {
  var mongoose = require('mongoose');
  mongoose.connect('mongodb://localhost/local');
  var t1 = mongoose.model('t1', { title: String });
  t1.find(function(err, doc) {

    res.render('index', doc[0]);

  });
});

module.exports = router;
