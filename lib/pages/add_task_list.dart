import 'package:cinema/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskList extends StatelessWidget {
  AddTaskList({Key? key}) : super(key: key);
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController urlCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Add Movie',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: TextField(
              controller: titleEditingController,
              decoration: InputDecoration(
                label: Text('Movie Name'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: TextField(
              controller: urlCont,
              decoration: InputDecoration(
                label: Text('Movie Url'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (titleEditingController.text.isNotEmpty &&
                  urlCont.text.isNotEmpty) {
                context.read<AppProvider>().addMovie(
                    title: titleEditingController.text, url: urlCont.text);
                Navigator.pop(context);
              }
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              height: 48,
              margin: EdgeInsets.all(16),
              child: Text('Saqlash'),
            ),
          )
        ],
      ),
    );
  }
}
