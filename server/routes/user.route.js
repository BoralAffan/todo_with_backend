const router = require('express').Router();
// const UserController = require('../controller/user.controller');
const UserModel = require('../model/user.model')
 
const bcrypt = require('bcrypt')
// router.post('/registeration', UserController.register);




router.get('/getUsers', async (req, res) => {
    try {
        const users = await UserModel.find({}, '-password');
        res.status(200).json(users);
    } catch (error) {
        console.error('Error fetching users:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

router.post('/login', async (req, res) => {

    try {
        const { email, password } = req.body;

        // Find the user by email
        const user = await UserModel.findOne({ email });
        // console.log(user);
        // console.log(req.body.email)
        if (!user) {
            return res.status(404).json({ error: 'User not found' });
        }

        // Compare the password
        const isPasswordValid = await bcrypt.compare(password, user.password);

        if (!isPasswordValid) {
            return res.status(401).json({ error: 'Invalid password' });
        }

        res.status(200).json({ message: 'Login successful' });
    } catch (error) {
        console.error('Error logging in:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
})


router.post('/register', async (req, res) => {
    try {
        const { email, password } = req.body;

        // Check if the email already exists in the database
        const existingUser = await UserModel.findOne({ email });
        if (existingUser) {
            return res.status(409).json({ error: 'Email already exists' });
        }


        // encrypt the password
        const salt = 10;
        const hashedPassword = await bcrypt.hash(password, salt);
        // Create a new user
        const newUser = new UserModel({ email, password: hashedPassword });
        await newUser.save();

        res.status(201).json({ message: 'User registered successfully' });
    } catch (error) {
        console.error('Error registering user:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});


module.exports = router;