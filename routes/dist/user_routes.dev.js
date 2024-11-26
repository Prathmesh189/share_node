"use strict";

function _toConsumableArray(arr) { return _arrayWithoutHoles(arr) || _iterableToArray(arr) || _nonIterableSpread(); }

function _nonIterableSpread() { throw new TypeError("Invalid attempt to spread non-iterable instance"); }

function _iterableToArray(iter) { if (Symbol.iterator in Object(iter) || Object.prototype.toString.call(iter) === "[object Arguments]") return Array.from(iter); }

function _arrayWithoutHoles(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = new Array(arr.length); i < arr.length; i++) { arr2[i] = arr[i]; } return arr2; } }

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
router.get("/fetch-orders", function _callee(req, res) {
  var allOrders, skip, limit, orders;
  return regeneratorRuntime.async(function _callee$(_context) {
    while (1) {
      switch (_context.prev = _context.next) {
        case 0:
          allOrders = [];
          skip = 0;
          limit = 100;
          _context.prev = 3;

        case 4:
          if (!true) {
            _context.next = 14;
            break;
          }

          _context.next = 7;
          return regeneratorRuntime.awrap(razorpay.orders.all({
            expand: ["payments"],
            count: limit,
            skip: skip
          }));

        case 7:
          orders = _context.sent;

          if (!(orders.items.length === 0)) {
            _context.next = 10;
            break;
          }

          return _context.abrupt("break", 14);

        case 10:
          allOrders = [].concat(_toConsumableArray(allOrders), _toConsumableArray(orders.items)); // Append fetched orders

          skip += limit; // Increment skip by the limit to fetch the next set of orders

          _context.next = 4;
          break;

        case 14:
          res.status(200).json({
            status: 1,
            orders: allOrders
          });
          _context.next = 21;
          break;

        case 17:
          _context.prev = 17;
          _context.t0 = _context["catch"](3);
          console.error("Error fetching Razorpay orders:", _context.t0);
          res.status(500).json({
            status: 0,
            message: _context.t0.message
          });

        case 21:
        case "end":
          return _context.stop();
      }
    }
  }, null, null, [[3, 17]]);
});
router.post('/create-order', function _callee2(req, res) {
  var _req$body, amount, name, phone, notes, order;

  return regeneratorRuntime.async(function _callee2$(_context2) {
    while (1) {
      switch (_context2.prev = _context2.next) {
        case 0:
          _req$body = req.body, amount = _req$body.amount, name = _req$body.name, phone = _req$body.phone; // Input validation for amount

          if (amount) {
            _context2.next = 3;
            break;
          }

          return _context2.abrupt("return", res.status(400).json({
            status: 0,
            message: "Amount is required."
          }));

        case 3:
          if (!(isNaN(amount) || amount <= 0)) {
            _context2.next = 5;
            break;
          }

          return _context2.abrupt("return", res.status(400).json({
            status: 0,
            message: "Invalid amount."
          }));

        case 5:
          _context2.prev = 5;
          // Prepare notes object only if name or phone is provided
          notes = {};
          if (name) notes.name = name;
          if (phone) notes.phone = phone; // Create Razorpay order

          _context2.next = 11;
          return regeneratorRuntime.awrap(razorpay.orders.create({
            amount: amount * 100,
            // Convert to the smallest currency unit
            currency: "INR",
            receipt: "receipt_".concat(Math.random()),
            notes: Object.keys(notes).length ? notes : undefined
          }));

        case 11:
          order = _context2.sent;
          res.status(200).json({
            status: 1,
            order: order
          });
          _context2.next = 19;
          break;

        case 15:
          _context2.prev = 15;
          _context2.t0 = _context2["catch"](5);
          console.error("Error creating Razorpay order:", _context2.t0);
          res.status(500).json({
            status: 0,
            message: _context2.t0.message
          });

        case 19:
        case "end":
          return _context2.stop();
      }
    }
  }, null, null, [[5, 15]]);
});
router.put('/uploadProfileImage', authenticateJWT, upload.single('profile_pic'), validations.trail, userController.uploadProfileImage);
router.post('/register', userController.createUser);
router.post('/login', validations.loginUserValidation, userController.loginUser);
router.get('/details', authenticateJWT, userController.getUserInfo);
router.put('/update', authenticateJWT, userController.updateUser);
router.put('/resetPassword', validations.updatePassword, userController.editUserPassword);
router.post('/login/facebook', function _callee3(req, res) {
  var facebookToken, response;
  return regeneratorRuntime.async(function _callee3$(_context3) {
    while (1) {
      switch (_context3.prev = _context3.next) {
        case 0:
          facebookToken = req.body.facebookToken;

          if (facebookToken) {
            _context3.next = 3;
            break;
          }

          return _context3.abrupt("return", res.status(400).json({
            status: 0,
            message: 'Facebook token is required.'
          }));

        case 3:
          _context3.next = 5;
          return regeneratorRuntime.awrap(userController.loginWithFacebook(facebookToken));

        case 5:
          response = _context3.sent;
          return _context3.abrupt("return", res.status(response.status === 1 ? 200 : 400).json(response));

        case 7:
        case "end":
          return _context3.stop();
      }
    }
  });
});
module.exports = router;