import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:news/src/models/resources/api_provider.dart';
import 'package:http/testing.dart';

void main(){
  test('Testing the fetchTopIds function of NewApiProvider class' , () async {
  final newsApi = NewApiProvider();

    newsApi.client = MockClient(  (request) async{
      return Response(json.encode([1,2,3,4,5]), 10);
    });

    var ids =  await newsApi.fetchItem();

    expect(ids, [1,2,3,4,5]);
  } );
}