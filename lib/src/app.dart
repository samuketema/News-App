import 'package:flutter/material.dart';
import 'screens/newslist.dart';
import 'blocs/stories-provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoryProvider(
      child:MaterialApp(
      title: "NewStory App",
      home: NewsList(),
    )
    );
    
  }
}