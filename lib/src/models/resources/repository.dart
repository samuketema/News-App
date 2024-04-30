
import 'api_provider.dart';
import 'news_db_provider.dart';
import '../item_model.dart';
import 'dart:async';

class Repository{
  NewsDbProvier dbProvier = NewsDbProvier();
  NewApiProvider apiProvider = NewApiProvider();

  Future<List<int>> fetchTopIds(){
    return apiProvider.fetchTopIds();

  }
  
  Future<ItemModel> fetchItem(int id) async {
    var item = await dbProvier.fetchItem(id);
    if (item != null){
      return item;
    }

    else item = await apiProvider.fetchItem(id);
    dbProvier.addItem(item);
    return item;
  }
}