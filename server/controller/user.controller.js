const UserServices = require('../services/user.services');


exports.register = async (req, res, next) => {
    try {
        // const { email, password } = req.body;
        const email = req.body.email;
        const password = req.body.password;
        // if (!email || !password) {
        //     return res.status(400).json({ error: 'Email and password are required' });
        // }
        const successResponse = await UserServices.registerUser({ email, password });
        // res.json({ status: true, success: "User Registered Successfully" });
        res.status(200).json(successResponse);
    }
    catch (err) {
        throw err
    }
}