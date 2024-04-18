import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../item_model.dart';

import 'package:news/src/models/item_model.dart';

class NewApiProvider { 
  Client client = new Client();
  fetchTopIds() async{
   final responce = await client.get(Uri.parse('https://hacker-news.firebaseio.com/v0/topstories.json'));
   final ide = json.decode(responce.body);
   return ide;
  }

  fetchItem() async{
    final responce = await client.get(Uri.parse('https://hacker-news.firebaseio.com/v0/item/8863.json'));
    
    final parsedJson = json.decode(responce.body);

   return ItemModel.fromJson(parsedJson);
  }
}