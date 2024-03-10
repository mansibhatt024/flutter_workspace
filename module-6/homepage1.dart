import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:module_6/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginpage.dart';


class ChatMessage{
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}

List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
];






class HomePage1 extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomePage1>
{
  late String emailId, pass;
  late SharedPreferences logindata;

  @override

  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    //newuser = (logindata.getBool('login') ?? true);
    setState(() {
      emailId = logindata.getString('emailId')!;
      pass = logindata.getString('pass')!;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 80),
        child: AppBar(
          iconTheme: IconThemeData(color: Colors.indigoAccent),
          backgroundColor: Colors.white,
          flexibleSpace: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 40, width: 40),
                Text(
                  "Chatter",
                  style: TextStyle(color: Colors.indigoAccent, fontSize: 20),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("by mansiDeveloper"),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'logout')
                {
                  _logout();
                }
              },
              itemBuilder: (BuildContext context) {
                return ['logout'].map((String choice) {
                  return PopupMenuItem(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [

              ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10,bottom: 10),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return Container(
                    padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                    child: Align(
                      alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 200,),

              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 20, ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),

                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: IconButton(
                      onPressed: ()
                      {

                      }, icon: Icon(Icons.send, color: Colors.white, size: 20,),),
                  ),
                ],
              ),
            ],
          ),
        ),

      ),


      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Chandani Bachani"),
              accountEmail: Text("chandanibachani@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "C",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              onTap: () {
                // Handle navigation to the home screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              onTap: () {
                // Handle navigation to the account screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              onTap: () {
                // Handle navigation to the payment screen
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _logout() async
  {

    logindata = await SharedPreferences.getInstance();
    logindata.setBool('login', true); // Set the login flag back to true.
    Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(builder: (context) => LoginPage()));

  }
}
