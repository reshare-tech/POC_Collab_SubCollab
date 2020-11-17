 // Setting up the server and linking it to socket.io
 require('dotenv').config()
 const express = require('express');
 const bodyParser=require('body-parser');
const app = express();
const server = require('http').createServer(app);
const io = require('socket.io')(server);
const Chat=require('./models/ChatSchema'); 
const UserToGroup=require('./models/UserToGroupSchema');
const connect=require('./dbconnection');
const events = require('./constants');
 
app.use(bodyParser.urlencoded({extended:true}));
const PORT = process.env.PORT || 3000;

// Importing user-defined events for socket as a map
app.get("/",function(req,res){
    res.send(" `Server is running  ");
}) 


 
io.on("connection", (socket) => {
    
    console.log(`NEW USER:USER connected   ${JSON.stringify(socket.handshake.query )} with socketID - ${socket.id}`);
    // console.log(socket);
    
    // socket.username="3000";
    // console.log(socket.username);
    // console.log(socket.rooms);

    var roomID =  socket.handshake.query.roomID;
    console.log(roomID);
     
    socket.join(roomID);

    UserToGroup.find({userID:roomID},function(err,groupMapping){
        if(err){
            console.log("USERTOGRP ERR");
        }
        else{
            console.log(groupMapping);
            listOfGroups=groupMapping[0].groups;
            console.log(listOfGroups); 
            listOfGroups.forEach(function(groupID){
                socket.join(groupID);
                console.log(`joined group ${groupID}`);
            })
        }
    })

    
     
    // When the users sends a message
    socket.on('send_message', (message) => {
       
        console.log("yo in ");
         
        let toID = message.receiverChatID;
        let fromID = message.senderChatID;
        let content = message.content;
        let time=message.time;
        let isGroup=message.isGroup; 
        console.log(message);
         
         
        // let check_online = checkOnline(toID);

        let response = {
            "content": content,
            "senderChatID": fromID,
            "receiverChatID": toID,
            "time":time,
            "isGroup":isGroup
        } ;
        
        console.log(`CHAT From-${fromID} To-${toID} is Online-Message-${content} and ${time} and ${isGroup}`);
         
        connect.then(db  =>  {
            console.log("connected correctly to the DB");
        
            let  chat1 =  new Chat({
                content: content,
                senderChatID: fromID,
                receiverChatID: toID,
                time:time, 
                isGroup:isGroup
            });
            chat1.save(function (err, chat) {
                if (err) console.log(err);
                else{
                    console.log("saved to DB");
                    onMessage(socket,toID,fromID,response);
                }
              });
               
            });
             
      
    });
    
    // Chat.find(function (err, chats) {
    //     if (err) return console.error(err);
    //     console.log(chats);
    //     io.sockets.in(roomID).emit('receive_message', chats);

    //   });
    
    
    // When the user logs out
    disposeOnDisconnect(socket,roomID);
})

const onMessage = (socket,to_id,from_id,response) => {
    
     
    let res=JSON.stringify(response);
    let resp=JSON.parse(res);
    console.log(res);
    console.log(resp); 
    if(resp.isGroup==false){
        io.sockets.in(to_id).emit('receive_message', resp);

    }
    else{
        socket.broadcast.emit('receive_message', resp);

    }
    console.log(" received");
        
       
    
}


const checkOnline = (roomID) => {
    let temp = rooms.get(roomID);
    // console.log(temp);
    if (temp == undefined || temp.length==0)//if no sockets, then no room
        return false;

    return true;
}

const disposeOnDisconnect = (socket,roomID) => {
    socket.on(events.ON_DISCONNECT, () => {
        
        socket.leave(roomID);
        console.log(roomID+' user disconncected'+JSON.stringify(socket.id));
        // socket.removeAllListeners(events.ON_DISCONNECT);
        // if (rooms.size != 0) {
            
        //     for (let [key, value] of rooms) {
        //         // console.log(key, value);
        //         value.forEach((obj) => {
        //             if (obj.socketID == socket.id) {
        //                 let array1 = rooms.get(key);
        //                 array1.pop({
        //                     socketID: socket.id
        //                 });
        //                 if (array1.length == 0) {
        //                     rooms.delete(key); // user is no longer online
        //                     socket.leave(key);
        //                 } else
        //                     rooms.set(key, array1);
        //             }


        //         })
        //     }
        // }



        // console.log(rooms);
        // console.log(`USER REMOVED - TOTAL NO. OF ROOMS ${rooms.size}`);

    });

}
app.get("/groupChats",function(req,res){
    connect.then(db => {
        Chat.find({isGroup:true,receiverChatID:req.query.groupID},function (err, chats) {
            //need to get in params,receiverchat id  and groupid and userid
            //should sep into GROUP CHAT SCHEMA TOO
            if (err)  console.log("group chats err");
            else{
            console.log(req.query);
            console.log(req.query.groupID);
            // console.log(chats); 
            // io.sockets.in(to_id).emit('receive_message', chats);
            // io.sockets.in(from_id).emit('receive_message', chats);
            res.send(chats);
            }
          });
          console.log("  returned group chats' list");        
        });
    })

app.get("/individualChats",function(req,res){
    connect.then(db=>{
        console.log("connected to db inside return individualschats' list");
        console.log(req.query.senderChatID);
        console.log(req.query.receiverChatID);
        let from_id=req.query.senderChatID;
        let to_id=req.query.receiverChatID;
 
        Chat.find({$or:[{$and:[{"senderChatID":from_id},{"receiverChatID":to_id}]},{$and:[{"senderChatID":to_id},{"receiverChatID":from_id}]}]},function (err, chats) {
 
            if (err)  console.log(err);
            else{
            
            // console.log(chats); 
            // io.sockets.in(to_id).emit('receive_message', chats);
            // io.sockets.in(from_id).emit('receive_message', chats);
            res.send(chats);
            }
          });
          console.log("  returned individual chats' list");        
        });
    
})
server.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});


// const individualChatHandler = (socket, message) => {
//     let toID = message.toID;
//     let fromID = message.fromID;
//     let content = message.content;
//     let toSocketID = getSocketID(toID);

//     let response = {
//         'content': content,
//         'senderID': fromID,
//         'recipientID': toID
//     };

//     // Check if the other person is online
//     let isOnline = (toSocketID == undefined) ? false : true;
//     console.log(`CHAT From-${fromID} To-${toID} is Online-${isOnline} Message-${content}`);

//     // Store in database

//     // Send message
//     message.status = isOnline ? events.STATUS_CODE_MESSAGE_SENT : STATUS_CODE_MESSAGE_NOT_SENT;
//     message.recipientIsOnline = isOnline;
//     sendToSelf(socket, events.MESSAGE_FROM_SERVER, response);

//     if (isOnline == true)
//         sendToOther(socket, events.RECEIVE_MESSAGE, toSocketID, response);
// }

// const groupChatHandler = (socket, message) => {
//     socket.join(message.group);
//     // Will implement after the individual chat works
//     // Something of this sort
//     //sendToAll(socket, event.GROUP_CHAT_MESSAGE, group, content);
//     socket.leave(message.group);
// }

// const sendToSelf = (socket, event, message) => {
//     socket.emit(event, message);
// }

// const sendToOther = (socket, event, toSocketID, message) => {
//     socket.in(toSocketID).emit(event, message);
// }

// const sendToAll = (socket, event, groupID, message) => {
//     socket.in(groupID).emit(event, message);
// }