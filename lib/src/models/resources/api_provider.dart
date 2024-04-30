import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../item_model.dart';

import 'package:news/src/models/item_model.dart';

class NewApiProvider { 

  final root = 'https://hacker-news.firebaseio.com/v0';
  Client client = new Client();
  Future<List<int>> fetchTopIds() async{
   final response = await client.get(Uri.parse('$root/topstories.json'));
   final ide = json.decode(response.body);
   return ide;
  }

  Future<ItemModel>  fetchItem ( int id) async{
    final response = await client.get(Uri.parse('$root/item/$id.json'));
    
    final parsedJson = json.decode(response.body);

   return ItemModel.fromJson(parsedJson);
  }
}