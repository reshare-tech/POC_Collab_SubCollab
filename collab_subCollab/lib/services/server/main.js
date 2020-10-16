const firebaseAdmin = require("firebase-admin");
const app = require("express")();
const bodyParser = require("body-parser")
const sgMail = require("@sendgrid/mail")
const controller = require("../controller/inviteProjectCollab.js")

//Authenticate SendGrid 
sgMail.setApiKey(process.env.SENDGRID_API_KEY)

//Authenticate Firebase
firebaseAdmin.initializeApp({
  credential: firebaseAdmin.credential.cert(JSON.parse(process.env.SERVICEACCOUNT_KEY)),
  databaseURL: "https://dynamic-links-demo-fbaa0.firebaseio.com"
});

app.use(bodyParser.json())
app.post("/inviteProjectCollab",function(req,res){controller.inviteEmail(req,res)});

const port = process.env.PORT||8000
app.listen(port,()=>{
  console.log(`Server is running on port ${port}`);
});