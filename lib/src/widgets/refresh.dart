import 'package:flutter/material.dart';
import '../blocs/stories-provider.dart';

class Refresh extends StatelessWidget{
  final Widget? child;
  
  Refresh({this.child});
  Widget build(context){
    final bloc = StoryProvider.of(context) ;
    return RefreshIndicator(
      
      child: child as Widget,
      onRefresh:() async{
        await bloc?.clearCach();
        await bloc?.fetchTopIds();
      } ,
      );
  }
}