// Express Server

// Initialization
const { response } = require("express");
const express = require("express");

const app = express();


const mongoose = require("mongoose");
const Note = require('./models/Note');

const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

mongoose.connect("mongodb+srv://SJacob:$Jacob2000@cluster0.kdpenxt.mongodb.net/notesdb").then(function(){

    // Creating routes
    app.get("/", function(req,res){
        const response = {message: "API is working"};
        res.json(response);
        // res.send("This is the home page by nodemon");    
    });

    const noteRouter = require("./routes/Note");
    app.use("/notes",noteRouter);

});


//Starting the server on a port

const PORT = process.env.PORT || 5000

app.listen(PORT, function(){
    console.log("Server started at PORT: "+PORT);
});