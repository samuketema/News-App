import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget{
Widget  build(BuildContext context){
    return Column(
      children: [
        ListTile(
          title: buildContainer() ,
          subtitle:buildContainer() ,
        ),
        Divider(height:8.0)
    ],) ;
  }

  Widget buildContainer(){
    return Container(
      color: Colors.grey[200],
      height:24 ,
      width: 124,
      margin: EdgeInsets.only(top: 5,bottom: 5),
    );
  }
  
}