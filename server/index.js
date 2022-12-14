//import packages
const express = require('express');
const  mongoose = require('mongoose');



//imports from files
const authRouter = require('./routes/auth');








//init
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://maskey:maskey123@cluster0.usubcqy.mongodb.net/?retryWrites=true&w=majority"

//middleware
app.use(express.json());
app.use(authRouter);



//connections
mongoose.connect(DB).then(() => {
    console.log("SuccessFul Connection");

}).catch(e => {
    console.log(e);
});




app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port ${PORT}`);
});
