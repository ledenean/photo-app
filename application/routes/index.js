var express = require('express');
var router = express.Router();
var isLoggedIn = require('../middleware/routeprotectors').userIsLoggedIn;
const {getRecentPosts, getPostById, getCommentsByPostId} = require('../middleware/postsmiddleware');
var db = require('../conf/database');

/* GET home page. */
router.get('/', getRecentPosts, (req, res, next) => {
  res.render('index', { title: 'CSC 317 App', name: "Denean Le" });
});
router.get('/login', (req, res, next) => {
  res.render('login');
});
router.get('/registration', (req, res, next) => {
  res.render('registration');
});
router.use('/postimage', isLoggedIn);
router.get('/postimage', (req, res, next) => {
  res.render('postimage');
});

router.get('/posts/:id(\\d+)', getPostById, getCommentsByPostId, (req, res, next) => {
  res.render('viewpost', { title: `Post ${req.params.id}` });
});

module.exports = router;
