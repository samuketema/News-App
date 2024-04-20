import 'package:flutter/material.dart';


class ItemModel{
late final int? id;
late final bool? deleted;
late final String? type;
late final String? by;
late final int? time	;
late final String? text	;
late final bool? dead	;
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


}