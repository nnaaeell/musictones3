import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart'as http;
import 'package:musictones3/cubit/states.dart';
import 'package:musictones3/model/items.dart';
import 'package:musictones3/model/sections.dart';



class MainCubit extends Cubit<CubitStates>{
  MainCubit() : super(InitialCubitState());

  static MainCubit get(context) => BlocProvider.of(context);

  List<Section> sections=[];
  List<Item> items=[];
  late Data_S data_s;
  late Data_I data_i;

  void getSections(){
    emit(GetSectionsLoadingState());
    http.get(
      Uri.parse('https://musictones.pythonanywhere.com/rest/sections/'),
      headers: {
        'Content-Type': 'application/json', // تحديد نوع المحتوى
      },
    ).then((value){
      var data = jsonDecode(utf8.decode(value.bodyBytes));
      print(data.toString());
      data_s=Data_S.fromJson(data as Map<String, dynamic>);
      sections=data_s.sections;
      print(sections[0].icon);


      emit(GetSectionsSuccessState());

    }).catchError((e){
      print(onError.toString());
      emit(GetSectionsErrorState());
    });

  }

  void getItems(int id){
    emit(GetItemsLoadingState());
    http.get(
      Uri.parse('https://musictones.pythonanywhere.com/rest/items/${id}'),
      headers: {
        'Content-Type': 'application/json', // تحديد نوع المحتوى
      },
    ).then((value){
      var data = jsonDecode(utf8.decode(value.bodyBytes));
      print(data.toString());
      data_i=Data_I.fromJson(data as Map<String,dynamic>);
      items=data_i.items;

      emit(GetItemsSuccessState());

    }).catchError((e){
      print(onError.toString());
      emit(GetItemsErrorState());
    });

  }

}