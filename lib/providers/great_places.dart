import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:places/helpers/db_helper.dart';
import 'package:places/models/place.dart';

class GreatPlaces with ChangeNotifier{
  List<Place>_items =[];

  //a getter to retrieve a copy of our items
  List<Place> get items{
    return [..._items];
  }
  void addPlace(String pickedtitle, File pickedimage){
    final newPlace =Place(
      id: DateTime.now().toString(),
      image: pickedimage,
      title: pickedtitle,
      location: null
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('places',{
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    
    });
  }
  Future<void> fetchAndSetPlaces() async{
    final dataList =DBHelper.getData('places');
  }
}