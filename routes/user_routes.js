const express = require('express');
const userController = require('../controllers/user_controller');
const validations = require('../validations/user_validations')
const authenticateJWT = require('../middleware/authmiddleware');
const router = express.Router();
const upload = require('../config/multer_config');
const Razorpay = require('razorpay');



const razorpay = new Razorpay({
    key_id: 'rzp_live_uCJa7uLdh77Q0D',
    key_secret: 'dIXXp5oxJVo70K0LpyF8BHCN', 
  });
  

  router.get("/fetch-orders", async (req, res) => {
    let allOrders = [];
    let skip = 0;
    const limit = 100; 
    try {
      while (true) {
        const orders = await razorpay.orders.all({
          expand: ["payments"],
          count: limit,
          skip: skip,
        });
  
       
        if (orders.items.length === 0) {
          break;
        }
  
        allOrders = [...allOrders, ...orders.items]; 
        skip += limit; 
      }
  
      res.status(200).json({ status: 1, orders: allOrders });
    } catch (error) {
      console.error("Error fetching Razorpay orders:", error ,`\n \n`);
      res.status(500).json({ status: 0, message: error.message });
    }
  });
  
   
  router.post('/capture-payment', async (req, res) => {
    const { payment_id, amount } = req.body;
    if (!payment_id || !amount) {
      return res.status(200).json({ status: 0, message: "Payment ID and amount are required." });
    }
  
    try {
      const response = await razorpay.payments.capture(payment_id, amount);
      res.status(200).json({ status: 1, message: "Payment captured successfully" });
    } catch (error) {
      console.error("Error capturing payment:");
      res.status(500).json({ status: 0, message: error.message });
    }
  });
  



  router.post('/create-order', async (req, res) => {
    const { amount, name, phone } = req.body; 
  
    // Input validation for amount
    if (!amount) {
      return res.status(400).json({ status: 0, message: "Amount is required." });
    }
  
    if (isNaN(amount) || amount <= 0) {
      return res.status(400).json({ status: 0, message: "Invalid amount." });
    }
  
    try {
      // Prepare notes object only if name or phone is provided
      const notes = {};
      if (name) notes.name = name;
      if (phone) notes.phone = phone;
  
      // Create Razorpay order
      const order = await razorpay.orders.create({
        amount: amount * 100, // Convert to the smallest currency unit
        currency: "INR",
        receipt: `receipt_${Math.random()}`,
        notes: Object.keys(notes).length ? notes : undefined, 
      });
  
      res.status(200).json({ status: 1, order });
    } catch (error) {
      console.error("Error creating Razorpay order:", error);
      res.status(500).json({ status: 0, message: error.message });
    }
  });
  

  
router.put('/uploadProfileImage',authenticateJWT, upload.single('profile_pic'),validations.trail,userController.uploadProfileImage);






router.post('/register', userController.createUser);

router.post('/login', validations.loginUserValidation, userController.loginUser);

router.get('/details',authenticateJWT,userController.getUserInfo); 

router.put('/update',  authenticateJWT, userController.updateUser); 

router.put('/resetPassword',validations.updatePassword,   userController.editUserPassword); 

router.post('/login/facebook', async (req, res) => {
    const { facebookToken } = req.body;

    if (!facebookToken) {
        return res.status(400).json({ status: 0, message: 'Facebook token is required.' });
    }

    const response = await userController.loginWithFacebook(facebookToken);
    return res.status(response.status === 1 ? 200 : 400).json(response);
});



module.exports = router;