class Data_S{
  List<Section> sections=[];
  Data_S.fromJson(Map<String,dynamic>json){
    sections=(json['sections'] as List)
        .map((e) =>Section.fromJson(e)).toList();
  }

}

class Section{
 late int pk;
 String text='';
 String icon='';

 Section.fromJson(Map<String,dynamic>json){
   pk=json['pk'];
   text=json['text'];
   icon=json['icon'];
 }
}