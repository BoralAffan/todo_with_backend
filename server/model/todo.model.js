const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const todoSchema = new Schema({

    title: {
        type: String,
        required: true
    },

    description: {
        type: String,
        required: true
    },

    createdAt: {
        type: Date,

        default: () => new Date().toUTCString()
    }
},
    { toJSON: { virtuals: true }, id: false }
);
todoSchema.virtual('id').get(function () {
    return this._id.toHexString();
});

const todoModel = db.model('todo', todoSchema);

module.exports = todoModel;