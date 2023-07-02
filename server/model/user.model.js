const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const userSchema = new Schema({

    name: {
        type: String,
        default: ''
    },

    email: {
        type: String,
        lowercase: true,
        required: true,
        unique: true
    },

    password: {
        type: String,
        required: true
    }
},
    { toJSON: { virtuals: true }, id: false }
);
userSchema.virtual('id').get(function () {
    return this._id.toHexString();
});

const userModel = db.model('user', userSchema);

module.exports = userModel;