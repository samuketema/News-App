import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/stories-provider.dart';

class NewsListTile extends StatelessWidget{
  final int? itemId;

  NewsListTile({this.itemId});

  Widget build(context){
    final bloc = StoryProvider.of(context);
    
    return StreamBuilder(stream: bloc.items ,
     builder:(context,AsyncSnapshot<Map<int,Future<ItemModel>>> snapshot){
      if(!snapshot.hasData){
        return CircularProgressIndicator();
      }
       return FutureBuilder(future: snapshot.data?[itemId],
        builder: (context , AsyncSnapshot<ItemModel> itemSnapshot){
          if (!itemSnapshot.hasData){
            return Text('Strill loading item : $itemId');
          }
          return Text (itemSnapshot.data?.title.toString() as String);
        }
        
        );
     }
     
     );

    
  }
}