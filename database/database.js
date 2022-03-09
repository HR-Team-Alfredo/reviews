const { Pool } = require('pg');
const { pgPassword } = require('../config.js');

const pool = new Pool({
  user: 'pgmsvyk',
  host: 'localhost',
  database: 'reviewsdb',
  password: pgPassword,
  port: 5432,
});

pool.connect((err) => {
  if (err) {
    console.log('ERROR >>>> ', err, '<<<<');
  } else {
    console.log('database has been connected!');
  }
});


const getReviews = (query, callback) => {
  // get reviews
  // convert data using json-agg()

};

const getMeta = (query, callback) => {
  // get meta data
  // convert data using json_agg()
};
const postReview = (body, callback) => {
  // add a review
}

module.exports = {
  getReviews, getMeta, postReview
};