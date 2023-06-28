const mongoose = require('mongoose');

const dbUrl = 'mongodb+srv://affan:affan@cluster0.sfe9kwm.mongodb.net/?retryWrites=true&w=majority'
const connection= mongoose.createConnection(dbUrl).on('open',()=>{
    console.log('connected');
}).on('error',()=>{
    console.log('some error');
});

module.exports = connection;