import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../item_model.dart';
import 'repository.dart';

class NewApiProvider implements Source { 

  final _root = 'https://hacker-news.firebaseio.com/v0';
  Client client =  Client();
  Future<List<int>> fetchTopIds() async{
   final response = await client.get(Uri.parse('$_root/topstories.json?'));
   final ide = json.decode(response.body);
   return ide.cast<int>();
  }

  Future<ItemModel>  fetchItem ( int id) async{
    final response = await client.get(Uri.parse('$_root/item/$id.json?'));
    
    final parsedJson = json.decode(response.body);

   return ItemModel.fromJson(parsedJson);
  }}