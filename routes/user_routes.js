const express = require('express');
const userController = require('../controllers/user_controller');
const validations = require('../validations/user_validations')
const authenticateJWT = require('../middleware/authmiddleware');
const router = express.Router();
const upload = require('../config/multer_config');
const Razorpay = require('razorpay');



const razorpay = new Razorpay({
    key_id: 'rzp_live_lqs33u56ZnIKV1',
    key_secret: 'rPTGdf5UWXdfuwT3g84W34Zy', 
  });
  

  router.post('/create-order',  async (req, res) => {
    const { amount, currency } = req.body;
  
    // Input validation
    if (!amount || !currency) {
      return res.status(400).json({ message: "Amount and currency are required." });
    }
  
    if (isNaN(amount) || amount <= 0) {
      return res.status(400).json({ message: "Invalid amount." });
    }
  
    // Try to create a Razorpay order
    try {
      const order = await razorpay.orders.create({
        amount: amount * 100, // Amount in the smallest currency unit (e.g., paisa for INR)
        currency: currency,
        receipt: `receipt_${Math.random()}`,
      });
  
      res.status(200).json(order);
    } catch (error) {
      console.error("Error creating Razorpay order:", error); // Log the error for debugging
      res.status(500).json({ message: error.message });
    }
  });

  
router.put('/uploadProfileImage',authenticateJWT, upload.single('profile_pic'),validations.trail,userController.uploadProfileImage);






router.post('/register', userController.createUser);

router.post('/login', validations.loginUserValidation, userController.loginUser);

router.get('/details',authenticateJWT,userController.getUserInfo); 

router.put('/update',  authenticateJWT, userController.updateUser); 

router.patch('/resetPassword',validations.updatePassword,   userController.updatePassword); 

router.post('/login/facebook', async (req, res) => {
    const { facebookToken } = req.body;

    if (!facebookToken) {
        return res.status(400).json({ status: 0, message: 'Facebook token is required.' });
    }

    const response = await userController.loginWithFacebook(facebookToken);
    return res.status(response.status === 1 ? 200 : 400).json(response);
});



module.exports = router;