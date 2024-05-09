import 'package:flutter/material.dart';
import '../blocs/stories-provider.dart';
class NewsList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final bloc = StoryProvider.of(context);

    bloc.fetchTopIds();
    return Scaffold(
      appBar: AppBar(title: Text('Top News')),
      body: buildList(bloc)
);
  }
Widget buildList(StoriesBloc bloc){
  return StreamBuilder(
    stream: bloc.topIds,
    builder: (context, AsyncSnapshot<List<int>?> snapshot){
      if (!snapshot.hasData){
      return Text('still waiting on Ids');

      }
    
    
    return ListView.builder(
      itemCount:snapshot.data?.length ?? 0,
      itemBuilder:(context,int index){
        return Text(snapshot.data?[index].toString() ?? " ");
      },
    );
}
    );
}
}