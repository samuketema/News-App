import 'package:http/http.dart' show Client;
import 'dart:convert';

class NewApiProvider { 
  Client client = new Client();
  fetchTopIds() async{
   final responce = await client.get(Uri.parse('https://hacker-news.firebaseio.com/v0/topstories.json'));
   final ide = json.decode(responce.body);
   return ide;
  }

  fetchItem() {
    
}