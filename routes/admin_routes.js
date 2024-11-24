const express = require('express');
const router = express.Router();
const adminDetailsController = require('../controllers/adminControllers');

router.post('/adminDetails', adminDetailsController.createAdminDetail);

router.put('/ /:id', adminDetailsController.updateAdminDetail);

router.get('/fetch/:id', adminDetailsController.getAdminDetailById);

module.exports = router;    