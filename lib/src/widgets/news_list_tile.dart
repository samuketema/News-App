import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/item_model.dart';
import '../blocs/stories-provider.dart';

class NewsListTile extends StatelessWidget {
  final int? itemId;

  NewsListTile({this.itemId});

  Widget build(context) {
    final bloc = StoryProvider?.of(context);

    return StreamBuilder(stream: bloc?.items,
     builder: (context , AsyncSnapshot<Map<int,Future<ItemModel?>>> snapshot){
      if(!snapshot.hasData){
        return Text('Stream still loading');
      }
      return FutureBuilder(future: snapshot.data?[itemId],
       builder: (context, AsyncSnapshot<ItemModel?> itemSnapshot){
        if (!itemSnapshot.hasData){
          return Text('Strill loading item $itemId');
        }
        print('Future data: ${itemSnapshot.data}');
       return buildTile(itemSnapshot.data as  ItemModel);

       }
       
       );
     },
  );
  }
  Widget buildTile( ItemModel item){
    return ListTile(
      title: Text('${item.title}'),
      subtitle: Text('${item.score} points'),
    );
  }
}
