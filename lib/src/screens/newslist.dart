
import 'package:flutter/material.dart';
import '../blocs/stories-provider.dart';
import '../widgets/news_list_tile.dart';
import '../widgets/refresh.dart';
class NewsList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final bloc = StoryProvider?.of(context);

    bloc?.fetchTopIds();
    return Scaffold(
      appBar: AppBar(title: Text('Top News')),
      body: buildList(bloc as StoriesBloc)
);
  }
Widget buildList(StoriesBloc bloc){
  return StreamBuilder(
    stream: bloc.topIds,
    builder: (context, AsyncSnapshot<List<int>?> snapshot){
      if (!snapshot.hasData){
        return Center(
          child: CircularProgressIndicator(),
        );

      }
      
    return Refresh(
      child:ListView.builder(
      itemCount:snapshot.data?.length ?? 0,
      itemBuilder:(context,int index){
        bloc.fetchItem(snapshot.data?[index] as int);
        return NewsListTile(
          itemId: snapshot.data?[index],
        );
      },
    )
    );
}
    );
}
}