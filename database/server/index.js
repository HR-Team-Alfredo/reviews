const express = require('express');
const db = require('../database.js');

const port = process.env.PORT || 3030;
const app = express();

app.use(express.json());

app.listen(port, () => {
  console.log(`listening on port: ${port}`);
});

app.get('/reviews', (req, res) => {
  let product = req.query;
  db.getReviews(product, (err, result) => {
    if (err) {
      console.log(err);
      res.sendStatus(400);
    } else {
      res.status(200).send(result);
    }
  });
});

app.get('/reviews/meta', (req, res) => {
  let product = req.query;
  db.getMeta(product, (err, result) => {
    if (err) {
      console.log(err);
      res.sendStatus(400);
    } else {
      res.status(200).send(result);
    }
  });
});

app.post('/reviews', (req, res) => {
  db.postReview(req.body, (err, result) => {
    if (err) {
      console.log(err);
      res.sendStatus(418);
    } else {
      res.status(201).send(result);
    }
  });
});
