const { users } = require('../models');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { body, validationResult } = require('express-validator');
const { jwtSecret } = require('../config/auth');


const uploadProfileImage = async (req, res) => {
    try {
        const userId = req.user.id;

        // Check if file is uploaded
        if (!req.file) {
            return res.status(400).json({ status: 0, message: 'Profile image is required.' });
        }

        const user = await users.findByPk(userId);
        if (!user) {
            return res.status(404).json({ status: 0, message: 'User not found.' });
        }

        // Update user's profile image path in the database
        const profileImagePath = req.file.path; // Get the file path
        await user.update({ profile_pic: profileImagePath });

        res.status(200).json({
            status: 1,
            message: 'Profile image uploaded successfully.',
            user_info: {
                id: user.id,
                name: user.name,
                phone: user.phone,
                profile_pic: profileImagePath, // Return updated profile picture URL
            },
        });
    } catch (error) {
        console.error('Error uploading profile image:', error);
        res.status(500).json({
            status: 0,
            message: 'Something went wrong',
            error: error.message,
        });
    }
};


const loginUser = async (req, res) => {

    try {
        const { phone, Email, password } = req.body;

        console.log("Login attempt with phone/email:", phone, Email);

        if (!phone && !Email) {
            return res.status(404).json({ status: 0, message: 'Phone number or email is required.' });
        }

        if (!password) {
            return res.status(404).json({ status: 0, message: 'Password is required.' });
        }

        let user;
        if (Email) {
            user = await users.findOne({ where: { Email } });
        } else if (phone) {
            user = await users.findOne({ where: { phone } });
        }

        if (!user) {
            return res.status(404).json({ status: 0, message: 'User not found with this email or phone number.' });
        }

        const isPasswordValid = await bcrypt.compare(password, user.password);

        if (!isPasswordValid) {
            return res.status(404).json({ status: 0, message: 'Incorrect password. Please try again.' });
        }

        const token = jwt.sign(
            { id: user.id, phone: user.phone, email: user.email },
            jwtSecret,
            { expiresIn: 31536000 } 
        );

        res.status(200).json({
            status: 1,
            message: 'Login successful',
            token,
            user_info: {
                id: user.id,
                name: user.name,
                phone: user.phone,
                Email: user.Email,
            },
        });
    } catch (error) {
        console.error('Error during login:', error);
        res.status(500).json({
            status: 0,
            message: 'Something went wrong',
            error: error.message,
        });
    }
};


const createUser = async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(400).json({ status: 0, message: 'Validation failed.', errors: errors.array() });
    }

    try {
        const { name, Email, phone, password } = req.body;

        console.log(password);

        if (!name || !phone || !password || !Email) {
            return res.status(400).json({ status: 0, message: 'All fields are required.' });
        }

        // Check if the email is already registered
        const existingEmail = await users.findOne({ where: { Email } });
        if (existingEmail) {
            return res.status(200).json({
                status: 0,
                message: 'Email is already registered. Please use a different email to Register .',
            });
        }

        // Check if the phone is already registered
        const existingUser = await users.findOne({ where: { phone } });
        if (existingUser) {
            return res.status(200).json({
                status: 0,
                message: 'Phone number is already registered. Please use a different number.',
            });
        }

        // Hash the password
        const hashedPassword = await bcrypt.hash(password, 10);

        // Create the new user
        const newUserEntry = await users.create({
            name,
            phone,
            Email, 
            password: hashedPassword,
        });

        res.status(201).json({
            status: 1,
            message: 'User created successfully you can login with your Credentials',
            user_info: {
                id: newUserEntry.id,
                phone: newUserEntry.phone,
                Email: newUserEntry.Email, 
                name: newUserEntry.name
            },
        });
    } catch (error) {
        console.error('Error creating new User:', error);
        res.status(500).json({
            status: 0,
            message: 'Something went wrong',
            error: error.message,
        });
    }
};

const getUserInfo = async (req, res) => {
    try {
        const userId = req.user?.id; 
        
        console.log(userId);

        const user = await users.findByPk(userId);
        if (!user) {
            return res.status(404).json({ status: 0, message: 'User not found.' });
        }
        res.status(200).json({
            status: 1,
            message: 'User information retrieved successfully.',
            user
        });
    } catch (error) {
        console.error('Error fetching user info:', error);
        res.status(500).json({
            status: 0,
            message: 'Something went wrong',
            error: error.message,
        });
    }
};

const updateUser = async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(400).json({ status: 0, message: 'Validation failed.', errors: errors.array() });
    }

    try {
        console.log("Decoded user from token:", req.user);

        const userId = req.user?.id; 
        if (!userId) {
            return res.status(401).json({ status: 0, message: 'User ID not found in token.' });
        }

        const { name, Email, phone, password, bod, profile_pic, subscriptionId } = req.body;
        const updatedFields = {};

        if (name) updatedFields.name = name;
        if (Email) updatedFields.Email = Email;
        if (phone) updatedFields.phone = phone;
        if (bod) updatedFields.bod = bod;
        if (profile_pic) updatedFields.profile_pic = profile_pic;
        if (subscriptionId) updatedFields.subscriptionId = subscriptionId;
        
        console.log(subscriptionId);
        console.log(subscriptionId);
        console.log(subscriptionId);
        console.log(subscriptionId);
        if (password) {
            const hashedPassword = await bcrypt.hash(password, 10);
            updatedFields.password = hashedPassword;
        }

        const user = await users.findByPk(userId);

        if (!user) {
            return res.status(404).json({ status: 0, message: 'User not found.' });
        }

        // Update the user with the fields that are provided
        await user.update(updatedFields);

        // Return the updated user information
        res.status(200).json({
            status: 1,
            message: 'User updated successfully.',
            user_info: {
                id: user.id,
                name: user.name,
                phone: user.phone,
                Email: user.Email,
                bod: user.bod,
                profile_pic: user.profile_pic,
                subscriptionId: user.subscriptionId,
            },
        });
    } catch (error) {
        console.error('Error updating user:', error);
        res.status(500).json({
            status: 0,
            message: 'Something went wrong',
            error: error.message,
        });
    }
};


const updatePassword = async (req, res) => {
    const errors = validationResult(req);

    // Validate the input data
    if (!errors.isEmpty()) {
        return res.status(400).json({ 
            status: 0, 
            message: 'Validation failed.', 
            errors: errors.array() 
        });
    }

    try {
        // Extract phone and new password from the request body
        const { Email, password } = req.body;

        // Ensure phone number and new password are provided
        if (!Email || !password) {
            return res.status(404).json({ 
                status: 0, 
                message: 'Email and new password are required.' 
            });
        }

        // Find the user based on the phone number
        const user = await users.findOne({ where: { Email } });

        // Check if the user exists
        if (!user) {
            return res.status(404).json({ 
                status: 0, 
                message: 'User not found with this Email.' 
            });
        }

        // Hash the new password
        const hashedPassword = await bcrypt.hash(password, 10);

        // Update the user's password with the hashed password
        await user.update({ password: hashedPassword });

        // Respond with a success message and the updated user info (excluding password)
        res.status(200).json({
            status: 1,
            message: 'Password reset successfully.',
            user_info: {
                id: user.id,
                name: user.name,
                phone: user.phone,
                bod: user.bod,
                profile_pic: user.profile_pic,
                subscriptionId: user.subscriptionId,
            },
        });
    } catch (error) {
        console.error('Error resetting password:', error);
        res.status(500).json({
            status: 0,
            message: 'Something went wrong.',
            error: error.message,
        });
    }
};



module.exports = {
    loginUser,
    createUser,
    updateUser,
    getUserInfo,
    uploadProfileImage,
    updatePassword
};
