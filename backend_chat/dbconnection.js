require('dotenv').config()
const  mongoose  = require("mongoose");
mongoose.Promise = require('bluebird'); 
const  url  =  `mongodb+srv://${process.env.USER}:${process.env.PASS}@cluster0.a25bs.azure.mongodb.net/chatDB?retryWrites=true&w=majority`;
console.log(url);
const connect=mongoose.connect(url, { useNewUrlParser: true ,useUnifiedTopology:true});
module.exports=connect;
 