import 'dart:js_interop';

import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../models/resources/repository.dart';
class StoriesBloc{
  final _topIds = PublishSubject<List<int>?>();
  final _itemsFetcher = PublishSubject<int>();
  final _itemsOutput = BehaviorSubject<Map<int , Future<ItemModel>>>();

  final _repository = Repository();
  Stream<Map<int,Future<ItemModel>>>? get items => _itemsOutput.stream;
  Stream<List<int>?> get topIds => _topIds.stream; 
  
  StoriesBloc(){
   _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
  }

  Function(int) get fetchItem => _itemsFetcher.sink.add;

  fetchTopIds() async{
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  _itemsTransformer(){
    return ScanStreamTransformer(
      (Map <int,Future<ItemModel?>>? cache,int id,index){
        print(index);
        cache?[id] = _repository.fetchItem(id);
        return cache;
      },
     <int , Future<ItemModel>> {},

    );
  }

  dispose(){
    _topIds.close();
    _itemsOutput.close();
    _itemsFetcher.close();
  }


}