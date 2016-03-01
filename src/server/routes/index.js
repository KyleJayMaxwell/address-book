var express = require('express');
var router = express.Router();

var options = {};

var pgp = require('pg-promise')(options);
var connectionString = process.env.DATABASE_URL || 'postgres://localhost:5432/address_book';

var db = pgp(connectionString);

router.get('/', function(req, res, next) {
  db.any('SELECT * FROM homes JOIN contacts ON homes.contact_id = contacts.id JOIN addresses ON addresses.id = homes.address_id ORDER BY contacts.id ASC;')
  .then(function (data) {
    res.render('index', { 
      title: 'Address Book',
      homes: data
    });
  })
  .catch(function (err){
    return next(err);
  });
});

// new template
router.get('/address/new', function(req, res, next) {
  res.render('new', {
    title: 'Address Book: New Contact'
  });
});

// individual contact
router.get('/addresses/:id', function(req, res, next) {
  var contactID = req.params.id;
  db.one('SELECT * FROM homes JOIN contacts ON homes.contact_id = contacts.id JOIN addresses ON addresses.id = homes.address_id WHERE contacts.id ='+contactID)
  .then(function (data) {
    res.render('edit', { 
      title: 'Edit: '+data.first_name+' '+data.last_name,
      restaurants: data
    });
  })
  .catch(function (err){
    return next(err);
  });
});

module.exports = router;
