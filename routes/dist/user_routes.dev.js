"use strict";

var express = require('express');

var userController = require('../controllers/user_controller');

var validations = require('../validations/user_validations');

var authenticateJWT = require('../middleware/authmiddleware');

var router = express.Router();

var upload = require('../config/multer_config');

var Razorpay = require('razorpay');

var razorpay = new Razorpay({
  key_id: 'rzp_live_lqs33u56ZnIKV1',
  key_secret: 'rPTGdf5UWXdfuwT3g84W34Zy'
});
router.post('/create-order', function _callee(req, res) {
  var amount, order;
  return regeneratorRuntime.async(function _callee$(_context) {
    while (1) {
      switch (_context.prev = _context.next) {
        case 0:
          amount = req.body.amount; // Input validation

          if (amount) {
            _context.next = 3;
            break;
          }

          return _context.abrupt("return", res.status(400).json({
            status: 0,
            message: "Amount  are required."
          }));

        case 3:
          if (!(isNaN(amount) || amount <= 0)) {
            _context.next = 5;
            break;
          }

          return _context.abrupt("return", res.status(400).json({
            status: 0,
            message: "Invalid amount."
          }));

        case 5:
          _context.prev = 5;
          _context.next = 8;
          return regeneratorRuntime.awrap(razorpay.orders.create({
            amount: amount * 100,
            currency: "INR",
            receipt: "receipt_".concat(Math.random())
          }));

        case 8:
          order = _context.sent;
          res.status(200).json({
            status: 1,
            order: order
          });
          _context.next = 16;
          break;

        case 12:
          _context.prev = 12;
          _context.t0 = _context["catch"](5);
          console.error("Error creating Razorpay order:", _context.t0); // Log the error for debugging

          res.status(500).json({
            message: _context.t0.message
          });

        case 16:
        case "end":
          return _context.stop();
      }
    }
  }, null, null, [[5, 12]]);
});
router.put('/uploadProfileImage', authenticateJWT, upload.single('profile_pic'), validations.trail, userController.uploadProfileImage);
router.post('/register', userController.createUser);
router.post('/login', validations.loginUserValidation, userController.loginUser);
router.get('/details', authenticateJWT, userController.getUserInfo);
router.put('/update', authenticateJWT, userController.updateUser);
router.patch('/resetPassword', validations.updatePassword, userController.updatePassword);
router.post('/login/facebook', function _callee2(req, res) {
  var facebookToken, response;
  return regeneratorRuntime.async(function _callee2$(_context2) {
    while (1) {
      switch (_context2.prev = _context2.next) {
        case 0:
          facebookToken = req.body.facebookToken;

          if (facebookToken) {
            _context2.next = 3;
            break;
          }

          return _context2.abrupt("return", res.status(400).json({
            status: 0,
            message: 'Facebook token is required.'
          }));

        case 3:
          _context2.next = 5;
          return regeneratorRuntime.awrap(userController.loginWithFacebook(facebookToken));

        case 5:
          response = _context2.sent;
          return _context2.abrupt("return", res.status(response.status === 1 ? 200 : 400).json(response));

        case 7:
        case "end":
          return _context2.stop();
      }
    }
  });
});
module.exports = router;