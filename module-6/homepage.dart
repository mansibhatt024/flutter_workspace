import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../appColors.dart';
import '../widget.dart';
import 'ChatPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController chatController = TextEditingController();
  late User _user;

  void chatData()async{
    String userChat = chatController.text;

    if(userChat.isEmpty){
      log('please enter massage');
      showModalBottomSheet(context: context, builder: (context) {
        return MyBottomSheetContent(context, 'please enter massage...');
      });
    }else{
      try{
        Map<String,dynamic> userChatData = {
          'userChat':userChat,
        };
        FirebaseFirestore.instance.collection('UserChatData').add(userChatData);
      }on FirebaseAuthException catch(ex){
        showModalBottomSheet(context: context, builder: (context) {
          return MyBottomSheetContent(context, ex.code.toString().replaceAll(RegExp('[_-]'), ' '));
        });
      }
    }
  }

  Future<void> updateFireStoreData(String collectionPath, String path, Map<String, dynamic> updateData) {
    return FirebaseFirestore.instance
        .collection(collectionPath)
        .doc(path)
        .update(updateData);
  }



  void _getUser() async {
    User? user = await _auth.currentUser;
    setState(() {
      _user = user!;
    });
  }

  void _sendMessage() async {
    String text = chatController.text.trim();
    if (text.isNotEmpty) {
      await _firestore.collection('messages').add({
        'text': text,
        'sender': _user.uid,
        'timestamp': Timestamp.now(),
      });
      chatController.clear();
    }
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Chatter',style: TextStyle(color:primeColor,fontSize: 20),),
            Text('develop by mansidev',style: TextStyle(color:primeColor,fontSize: 12),),
          ],
        ),
        iconTheme:  IconThemeData(color: primeColor),
        actions: [
          Icon(Icons.more_vert)
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 150,),
                    ChatBox(data: 'Hallo, Stranger!', userName: 'Test USer'),
                    ChatBox(data: 'This is a simple demonstration', userName: 'prashant',isLeft: false),
                    ChatBox(data: 'Did you notice these seamilees animation?', userName: 'Test USer'),
                    ChatBox(data: 'You mean like when i am typing like this...?', userName: 'prashant',isLeft: false),
                    ChatBox(data: 'Hallo, Stranger!', userName: 'Test USer'),
                    ChatBox(data: 'This is a simple demonstration', userName: 'prashant',isLeft: false),

                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 2,
                              offset: Offset(0, 3)
                          )
                        ],
                      ),
                      child: TextFormField(
                        controller: chatController,
                        minLines: 1,
                        maxLines: 2,
                        style: TextStyle(fontSize: 14,color: Colors.blue,decorationThickness: 0),
                        decoration: InputDecoration(
                            hintText: 'type your massage here...',
                            hintStyle: TextStyle(fontSize: 14,),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 15)
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      chatData();
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 2,
                                offset: Offset(0, 3)
                            )
                          ]
                      ),
                      child: Icon(Icons.send_rounded,color: Colors.white,),
                    ),
                  )

                ],
              ),)
          ],
        ),
      ),
      drawer: Drawer(),

    );
  }


  Widget buildUserList(DocumentSnapshot document){
    return StreamBuilder<QuerySnapshot>(
        stream:FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.active){
            return ListView(
              children: snapshot.data!.docs
                  .map<Widget>((doc) => _builderListItem(doc)).toList(),
            );
          }else{
            return Center(child: CircularProgressIndicator(color: primeColor,),);
          }
        });
  }

  Widget _builderListItem(DocumentSnapshot doc){
    Map<String,dynamic> data = doc.data()! as Map<String,dynamic>;
    if(_auth.currentUser!.email != data['email']){
      return ListTile(
        title: data['email'],
        onTap: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage()));
        },
      );
    }else{
      return Center(child: CircularProgressIndicator(color: primeColor,),);
    }
  }

}
