import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/item_model.dart';
import '../blocs/stories-provider.dart';
import 'loading_container.dart';

class NewsListTile extends StatelessWidget {
  final int? itemId;

  NewsListTile({this.itemId});

  Widget build(context) {
    final bloc = StoryProvider?.of(context);

    return StreamBuilder(stream: bloc?.items,
     builder: (context , AsyncSnapshot<Map<int,Future<ItemModel?>>> snapshot){
      if(!snapshot.hasData){
        return LoadingContainer();
      }
      return FutureBuilder(future: snapshot.data?[itemId],
       builder: (context, AsyncSnapshot<ItemModel?> itemSnapshot){
        if (!itemSnapshot.hasData){
          return LoadingContainer();
        }
        print('Future data: ${itemSnapshot.data}');
       return Column(
        children: [buildTile(itemSnapshot.data as  ItemModel),
                    Divider(
                      height: 10.0,
                    )],) ;

       }
       
       );
     },
  );
  }
  Widget buildTile( ItemModel item){
    return ListTile(
      title: Text('${item.title}'),
      subtitle: Text('${item.score} points'),
      trailing: Column(
        children: [
          Icon(Icons.comment),
          Text('${item.descendants}'),
        ]),
    );
  }
}
