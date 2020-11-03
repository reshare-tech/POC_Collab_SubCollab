const mongoose=require('mongoose');

const ChatSchema=new mongoose.Schema({
    receiverChatID:String,
    senderChatID:String,
    content:String,
    time:String,
    isGroup:Boolean

});
const Chat=mongoose.model('chat',ChatSchema);
module.exports=Chat;