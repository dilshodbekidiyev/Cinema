import 'package:cinema/data/data_model.dart';
import 'package:cinema/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/custom_item.dart';
import 'add_task_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DataModel> movieList = [];

  @override
  Widget build(BuildContext context) {
    movieList = context.watch<AppProvider>().movieList;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Movies',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.normal, color: Colors.blue),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_){
                  return AddTaskList();
                }));
              },
              icon: const Icon(
                Icons.add_rounded,
                color: Colors.blue,
              )),
        ],
      ),
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (context, index) {
            return CustomItem(
              onTap: () {
                playMovies(movieList[index]);
              },
              onLongTap: (){
                deleteMovies(movieList[index]);
              },
              dataModel: movieList[index],
            );
          }),
    );
  }

  void playMovies(DataModel movieList) {}

  void deleteMovies(DataModel dataModel) {
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Diqqat'),
        content: Text('ersthjrhytgrf'),
        actions: [
          TextButton(onPressed: (){
            context.read<AppProvider>().deleteMovie(dataModel);
            Navigator.pop(context);
          }, child: Text('ok')),
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('yoq'))
        ],
      );
    });
  }
}
