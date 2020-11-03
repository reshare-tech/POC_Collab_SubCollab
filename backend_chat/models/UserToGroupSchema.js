const mongoose=require('mongoose');

const UserToGroupSchema=new mongoose.Schema({
    userID:String,
    groups:[String]

});
const UserToGroup=mongoose.model('usertogroup',UserToGroupSchema);
module.exports=UserToGroup;