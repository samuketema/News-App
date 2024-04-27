import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/retry.dart';


class ItemModel {
late final int? id;
late final bool deleted;
late final String? type;
late final String? by;
late final int? time	;
late final String? text	;
late final bool dead	;
late final int? parent	;
late final List<dynamic>? kids	;
late final String? url;
late final int? score 	;
late final String? title;
late final int? descendants ;

ItemModel.fromJson(Map<String,dynamic> parsedjson)
: id = parsedjson['id'],
  deleted= parsedjson['delete'],
  type= parsedjson['type'],
  by= parsedjson['by'],
  time	= parsedjson['time'],
  text	= parsedjson['text'],
  dead	= parsedjson['dead'],
  parent	= parsedjson['parent'],
  kids	= parsedjson['kids'],
  url= parsedjson['url'],
  score 	= parsedjson['score'],
  title= parsedjson['title'],
  descendants = parsedjson['descendants'];

  ItemModel.fromDb(Map<String,dynamic> parsedjson)
: id = parsedjson['id'],
  deleted= parsedjson['delete'] == 1,
  type= parsedjson['type'],
  by= parsedjson['by'],
  time	= parsedjson['time'],
  text	= parsedjson['text'],
  dead	= parsedjson['dead'] == 1,
  parent	= parsedjson['parent'],
  kids	= jsonDecode(parsedjson['kids']),
  url= parsedjson['url'],
  score 	= parsedjson['score'],
  title= parsedjson['title'],
  descendants = parsedjson['descendants'];
 
Map<String , dynamic>toMap(){
 return <String ,dynamic> {
    "id": id,
    "type": type,
    "by": by,
    "time": time,
    "text": text,
    "parent": parent,
    "url": url,
    "score": score,
    "title": title,
    "descendants": descendants,
    "dead": dead ? 1 : 0,
    "deleted": deleted ? 1 : 0,
    "kids": jsonEncode(kids),
  
  };
}
}