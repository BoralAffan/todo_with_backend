const userModel = require('../model/user.model');
class UserServices {
    static async registerUser(email, password) {
        try {
            console.log(email);
            const createUser = new userModel({ email, password });
            console.log(createUser);
            return await createUser.save();
        } catch (err) {
            throw err;
        }
    }
}

module.exports = UserServices;