const { adminDetails } = require('../models');

exports.createAdminDetail = async (req, res) => {
  try {
    const { name, advancePrice, shareLink, ratingLink, password } = req.body;
    const newAdminDetail = await adminDetails.create({ name, advancePrice, shareLink, ratingLink, password });
    res.status(201).json(newAdminDetail);
  } catch (error) {
    res.status(500).json({ error: 'Failed to create admin detail', details: error.message });
  }
};

// PUT: Update an existing admin detail by ID
exports.updateAdminDetail = async (req, res) => {
  try {
    const { id } = req.params;
    const { name, advancePrice, shareLink, ratingLink, password } = req.body;
    const adminDetail = await adminDetails.findByPk(id);

    if (!adminDetail) {
      return res.status(404).json({ error: 'Admin detail not found' });
    }

    adminDetail.name = name;
    adminDetail.advancePrice = advancePrice;
    adminDetail.shareLink = shareLink;
    adminDetail.ratingLink = ratingLink;
    adminDetail.password = password;

    await adminDetail.save();
    res.status(200).json(adminDetail);
  } catch (error) {
    res.status(500).json({ error: 'Failed to update admin detail', details: error.message });
  }
};

// GET: Fetch all admin details
exports.getAllAdminDetails = async (req, res) => {
  try {
    const adminDetailsList = await adminDetails.findAll();
    res.status(200).json(adminDetailsList);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch admin details', details: error.message });
  }
};

// GET: Fetch a single admin detail by ID
exports.getAdminDetailById = async (req, res) => {
  try {
    const { id } = req.params;
    const adminDetail = await adminDetails.findByPk(id);

    if (!adminDetail) {
      return res.status(404).json({  status:0, error: 'Admin detail not found' });
    }

    res.status(200).json({  status:1, adminDetail});
  } catch (error) {
    res.status(500).json({ status:0,error: 'Failed to fetch admin detail', details: error.message });
  }
};
