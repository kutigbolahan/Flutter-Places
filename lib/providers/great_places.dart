import 'package:flutter/foundation.dart';
import 'package:places/models/place.dart';

class GreatPlaces with ChangeNotifier{
  List<Place>_items =[];

  //a getter to retrieve a copy of our items
  List<Place> get items{
    return [..._items];
  }
}