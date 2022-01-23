const express = require('express')
const app = express()
const port = 3000
const mongoose = require("mongoose");
// mongodb+srv://dbAJ8454:<password>@cluster0.ua9wi.mongodb.net/test

async function connectDB() {
    await mongoose.connect("mongodb+srv://dbAJ8454:7eH7ArlpvUUXu298@cluster0.ua9wi.mongodb.net/test");
    console.log("db connected");
}

connectDB();
// this will take to post method. (always ontop)
app.use(express.json({ extended: false }));

app.get('/', (req, res) => res.send('Hello World!'));
// signup route api
app.post('/signup', async (req, res) => {
    const { email, password } = req.body;
    console.log(email);
    console.log(password);
    const schema = new mongoose.Schema({ email: 'string', password: 'string' });
    const User = mongoose.model('User', schema);

    let user = new User({
        email,
        password,
    });
    console.log(user);
    await user.save();
    res.json({ token: "123456789" });

    // res.send('Signup api route')
});

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})