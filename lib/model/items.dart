class Data_I{

  List<Item> items=[];

  Data_I.fromJson(Map<String,dynamic>json){
    items=(json['items'] as List).map((e) =>Item.fromJson(e)).toList();
  }

}

class Item{
  late int pk;
  String text='';
  String link='';

  Item.fromJson(Map<String,dynamic>json){
    pk=json['pk'];
    text=json['text'];
    link=json['link'];
  }
}