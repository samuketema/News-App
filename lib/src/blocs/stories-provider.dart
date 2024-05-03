import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_bloc.dart';
import 'stories-provider.dart';

class StoryProvider extends InheritedWidget{
  final StoriesBloc bloc;
  

  StoryProvider({Key? key , Widget? child }) 
  : bloc = StoriesBloc(),
  super(key: key , child : child as Widget);

  bool updateShouldNotify(_) => true;

  static StoriesBloc of (BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType<StoryProvider>() as StoryProvider).bloc;
  }
}