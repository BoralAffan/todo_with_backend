const express = require('express');
const body_parser = require('body-parser');
const todoRouter = require('../server/routes/todo.route')
const userRouter = require('./routes/user.route')
const app = express();


app.use(body_parser.json());
app.use('/api/users', userRouter),
    app.use('/api/todos', todoRouter)
module.exports = app;