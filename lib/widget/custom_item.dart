import 'package:cinema/data/data_model.dart';
import 'package:flutter/cupertino.dart';

class CustomItem extends StatelessWidget {
   CustomItem({Key? key, required this.onTap, required this.onLongTap, required this.dataModel}) : super(key: key);
  final Function onTap, onLongTap;
  final DataModel dataModel;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap.call();
      },
      onLongPress: (){
        onLongTap.call();
      },
      child: Container(
        height: 64,
        margin: EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          dataModel.title,
          style: TextStyle(
            color: CupertinoColors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
