import 'dart:js_interop';

import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../models/resources/repository.dart';
class StoriesBloc{
  final _topIds = PublishSubject<List<int>?>();

  final _repository = Repository();

  Stream<List<int>?> get topIds => _topIds.stream; 

  fetchTopIds() async{
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  _itemsTransfromer(){
    return ScanStreamTransformer(
      (Map <int,Future<ItemModel?>>? cache,int id,_){
        cache?[id] = _repository.fetchItem(id);
        return cache;
      },
     <int , Future<ItemModel>> {},

    );
  }

  dispose(){
    _topIds.close();
  }


}