
import 'api_provider.dart';
import 'news_db_provider.dart';
import '../item_model.dart';
import 'dart:async';

class Repository{
 List<Source> sources = [newsDbProvider,NewApiProvider()];
 List<Cache> caches = [newsDbProvider];

  Future<List<int>>? fetchTopIds(){
    return sources[1].fetchTopIds();

  }
  
  Future<ItemModel?> fetchItem(int id) async {
    ItemModel? item;
    Source source;
    for(source in sources){
      item = await source.fetchItem(id);
      if (item != null){
        break;
      }
    }
    for (var cache in caches){
      cache.addItem(item);
    }
    return item;
  }
}
 abstract class Source{
   Future<List<int>>? fetchTopIds();
   Future<ItemModel?> fetchItem(int ids);
  }
  abstract class Cache{
   Future<int> addItem(ItemModel? item);
  }