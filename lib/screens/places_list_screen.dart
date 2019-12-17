import 'package:flutter/material.dart';
import 'package:places/providers/great_places.dart';
import 'package:places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Places'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
            )
          ],
        ),
        body: Consumer<GreatPlaces>(
          child: Center(child: const Text('Add Your Places')),
          builder: (context, greatPlaces, ch) =>
              greatPlaces.items.length <= 0 ? ch : ListView.builder(
                itemCount: greatPlaces.items.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(greatPlaces.items[index].image),
                  ),
                  title: Text(greatPlaces.items[index].title),
                  onTap: (){
                    //Go to detail page
                  },
                ),
              ),
        ));
  }
}
