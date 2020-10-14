const request = require("request");
const sgMail = require("@sendgrid/mail")
const sendgridMail = require("../schema/sendgridMail.json")
const body = require("../schema/dynamicLink.json")

async function inviteEmail(req,res) {

console.log(req.body);

//Initialize mail schema
sendgridMail.personalizations[0].to[0].email = req.body.email;
sendgridMail.personalizations[0].dynamic_template_data.projectid = req.body.projectID;

//Create deeplink
var deeplink = "https://reshare.com?&email="+req.body.email+"&projectID="+req.body.projectID+"&route="+req.body.route;
body.dynamicLinkInfo.link = deeplink;

//Request ShortURL for DynamicLink
request({
url : "https://firebasedynamiclinks.googleapis.com/v1/shortLinks?key="+process.env.FIREBASE_API_KEY,
method : "POST", json : true , body 
},async(error,response)=>{
    if(error){
        console.log("Error :",error);
    }
    else{
      if(response&&response.statusCode!=200)
      {
        console.log("Error :",response.body);
      }
        else
        {
            console.log("Dynamic Link Successfully Created :",response.body);
            sendMail(response.body.shortLink);
            // sendgridMail.personalizations[0].dynamic_template_data.link = response.body.shortLink;
            // sgMail.send(sendgridMail);
        }
    }
}
);
res.send({"message" : "Invitation was sent"})
}

//Send mail via SendGrid
function sendMail(shortlink) {
    sendgridMail.personalizations[0].dynamic_template_data.link = shortlink;
    sgMail.send(sendgridMail);
}

module.exports = { inviteEmail }