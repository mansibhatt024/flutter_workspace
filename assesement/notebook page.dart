import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'database notebook.dart';
import 'homepage.dart';

class NotebookPage extends StatefulWidget {
  final bool isDesc;
  final String? noteLogo;
  final String? title;
  final String? description;
  const NotebookPage({super.key, this.isDesc = false, this.noteLogo, this.title, this.description});

  @override
  State<NotebookPage> createState() => _NotebookPageState();
}

class _NotebookPageState extends State<NotebookPage> {


  List<Map<String,dynamic>> addNotebookDataList = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  ImagePicker picker = ImagePicker();
  XFile? image;
  Future<void>addData()async{
    await SQLiteDatabase.createData(titleController.text.toString(), descController.text.toString(),image!.path);
  }

  void _refreshData() async {
    final data = await SQLiteDatabase.getAllData();
    setState(() {
      addNotebookDataList = data;
    });
  }

  @override
  void initState() {
    _refreshData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: widget.isDesc == true?Text(widget.title!,style: TextStyle(color: Colors.white),): Text('E-Notebook Write',style: TextStyle(color: Colors.white),),
        actions: [
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(

          children: [
            SizedBox(height: 15,),
            widget.isDesc == true?ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.file(File(widget.noteLogo!),width: size.width, height: 200,fit: BoxFit.fitWidth,),): Row(
              children: [
                InkWell(
                  onTap: ()async{
                    image = await picker.pickImage(source: ImageSource.gallery);
                    setState(() {});
                  },
                  child: Container(
                    width: 60,height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: image != null?DecorationImage(image: FileImage(File(image!.path)),fit: BoxFit.cover):null,
                    ),
                    child: image == null?Icon(Icons.add):Container(),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: 'Write Title of Notebook',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                        )
                    ),
                    onPressed: (){
                      addData();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      setState(() {});
                    }, child:Text('Add \nNoteBook',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 12),) )
              ],
            ),
            widget.isDesc == true?Expanded(
              child: TextFormField(
                controller: descController,
                maxLines: 500,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: widget.description,
                  border: InputBorder.none,
                ),
              ),
            ):Expanded(
              child: TextFormField(
                controller: descController,
                maxLines: 500,
                decoration: InputDecoration(
                  hintText: 'Write content',
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
