import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:mid_term/model/hotels_repository.dart';
import 'package:mid_term/model/hotel.dart';




class FavoritePage extends StatefulWidget {
  FavoritePage({Key key, this.hotels}) : super(key: key);
  List<Hotel> hotels;

  List<String> _favHotelLists() {
    List<String> _hotelNames = [];
    int i  = 0;
    while(i<hotels.length) {
      print(hotels[i].get_favorited());
      print(hotels[i].name);
      if (hotels[i].get_favorited() == true){
        _hotelNames.add(hotels[i].name + " " + i.toString());
      }
      i++;
    }
    return _hotelNames;
  }
  @override
  _FavoritePageState createState() => new _FavoritePageState(hotels: hotels, items:_favHotelLists());
}

class _FavoritePageState extends State<FavoritePage> {
  _FavoritePageState({Key key, this.hotels, this.items});
  final List<Hotel> hotels;
//  List<String> items = [];
  final items;



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Favorite Hotels'),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            String item = items[index];
            String data = item.substring(0, item.length-2);
            return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify Widgets.
              key: Key(item),
              // We also need to provide a function that tells our app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from our data source.
                setState(() {
                  items.removeAt(index);
                  String a = item.substring(item.length -2 , item.length);
                  var index_i =  int.parse(a);
                  print(a + 'hello');
                  hotels[index_i].set_favorited(false);
                });

                // Then show a snackbar!
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("$data dismissed")));
              },
              // Show a red background as the item is swiped away
              background: Container(color: Colors.red),
              child: ListTile(
                title: Container(
                  height: 60.0,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 40.0,),
                      Text(data, style: new TextStyle(
                          fontWeight: FontWeight.w900, color: Colors.black),
                      ),

                    ],
                  ),
                ),
            ),
            );
          }
      ),
    );
  }
}
