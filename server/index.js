const app = require('./app');
const db = require('./config/db');
// const userModel = require('./model/user.model')
const port = 3000;


// app.get('/', (req, res) => {
//     res.send('hello world bro')
// });
// app.get('/home', (req, res) => {
//     res.send('heome world')
// });
app.listen(port, () => {
    console.log(`Server connected to port http://localhost:${port}`);
});