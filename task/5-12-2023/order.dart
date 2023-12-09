import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class orderPage extends StatefulWidget {
  @override
  orderPageState createState() => orderPageState();
}

class orderPageState extends State<orderPage> {
  bool one = false;
  bool two = false;
  bool three = false;
  bool four = false;
  var total = 0;
  var amount = 0;
  var data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Coffee Club",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: Image.asset("images/coffe.jpg", height: 50,width: 50,),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: CheckboxListTile(
                      title: Text("Coffe"),
                      subtitle: Text("Rs.100"),
                      value: this.one,
                      onChanged: (bool? value) {
                        setState(() {
                          this.one = value!;
                          amount += 100;
                          data += "\n Coffe @ Rs.100";
                        });
                      }),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: Image.asset("images/tea.jpg",height: 50,width: 50,),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: CheckboxListTile(
                      title: Text("Tea"),
                      subtitle: Text("Rs.90"),
                      value: this.two,
                      onChanged: (bool? value) {
                        setState(() {
                          this.two = value!;
                          amount += 90;
                          data += "\n Tea @ Rs.90";
                        });
                      }),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: Image.asset("images/sandwich.webp",height: 50,width: 50,),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: CheckboxListTile(
                      title: Text("Sandwich"),
                      subtitle: Text("Rs.150"),
                      value: this.three,
                      onChanged: (bool? value) {
                        setState(() {
                          this.three = value!;
                          amount += 150;
                          data += "\n Sandwich @ Rs.150";
                        });
                      }),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: Image.asset("images/garlicbread.jpg",height: 50,width: 50,),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: CheckboxListTile(
                      title: Text("Garlic Bread"),
                      subtitle: Text("Rs.200"),
                      value: this.four,
                      onChanged: (bool? value) {
                        setState(() {
                          this.four = value!;
                          amount += 200;
                          data += "\n Garlic Bread @ Rs.200";
                        });
                      }),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  print(" Bill ");
                  print(" $data");
                  print("Total: $amount");
                },
                child: Text("Order")),
            SizedBox(
              width: 50,
            ),
            ElevatedButton(
              onPressed: exitApp,
              child: Text("Exit"),
            ),
          ],
        ),
      ),
    );
  }

  void exitApp() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 25,
                  height: 2,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Are you sure want to exit?"),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Text('Yes'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('No'),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}