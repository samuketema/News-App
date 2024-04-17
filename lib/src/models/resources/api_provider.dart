import 'package:http/http.dart' show Client;

class NewApiProvider { 
  Client client = new Client();
  fetchTopIds(){
    client.get(Uri.parse('https://hacker-news.firebaseio.com/v0/topstories.json'));
  }

  fetchItem(){

  }
}