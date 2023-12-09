class order extends StatefulWidget {
  @override
  orderState createState() => orderState();
}

class orderState extends State<order> {
  bool one = false;
  bool two = false;
  bool three = false;
  bool four = false;
  bool five = false;
  var total = 0;
  var amount = 0;
  var data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MENU"),
      ),
      body: Center(
        child: Column(
          children: [
            CheckboxListTile(
              title: Text("pizza"),
              subtitle: Text("Rs.100"),
              value: this.one,
              onChanged: (bool? value) {
                setState(() {
                  this.one = value!;
                  amount += 100;
                  data += "\n pizza @ Rs.100";
                });
              },
            ),
            CheckboxListTile(
              title: Text("manchurian"),
              subtitle: Text("Rs.70"),
              value: this.two,
              onChanged: (bool? value) {
                setState(() {
                  this.two = value!;
                  amount += 150;
                  data += "\n manchurian @ Rs.150";
                });
              },
            ),
            CheckboxListTile(
              title: Text("dhosa"),
              subtitle: Text("Rs.110"),
              value: this.three,
              onChanged: (bool? value) {
                setState(() {
                  this.three = value!;
                  amount += 110;
                  data += "\n dhosa @ Rs.110";
                });
              },
            ),
            CheckboxListTile(
              title: Text("pav bhaji"),
              subtitle: Text("Rs.70"),
              value: this.four,
              onChanged: (bool? value) {
                setState(() {
                  this.four = value!;
                  amount += 70;
                  data += "\n pav bhaji @ Rs.70";
                });
              },
            ),
            CheckboxListTile(
              title: Text("french fries"),
              subtitle: Text("Rs.180"),
              value: this.five,
              onChanged: (bool? value) {
                setState(() {
                  this.five = value!;
                  amount += 180;
                  data += "\n french fries @ Rs.180";
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                print("\n Bill \n $data \n Total: $amount");

              },
              child: Text("Order"),
            ),

            // Add the exit button
            ElevatedButton(
              onPressed: () {
                // Call exit(0) to exit the app
                exit(0);
              },
              child: Text("Exit"),
            ),
          ],
        ),
      ),
    );}}



