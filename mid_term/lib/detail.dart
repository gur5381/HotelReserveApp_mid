import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'model/hotels_repository.dart';
import 'package:flutter/cupertino.dart';

import 'model/hotel.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:mid_term/home.dart';

class DetailPage extends StatefulWidget {
  final Hotel hotel;
  final ThemeData theme;
  DetailPage({Key key, this.theme, this.hotel});
  @override
  State createState() => new DetailPageState(hotel: hotel, theme: theme);
}

class DetailPageState extends State<DetailPage>  with TickerProviderStateMixin{
  final Hotel hotel;
  final ThemeData theme;
  DetailPageState({Key key, this.theme, this.hotel});

  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: const Alignment(0.999, -0.999),
            children: <Widget>[
              Container(
                height: 300.0,
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.topLeft,
                child: PhotoHero(
                  photo: 'images/' + hotel.assetName,

                  width: 450.0,
                  height: 300.0,
                  onTap: () {

                  },
                ),
              ),
              new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 4.0),
                  child: Theme.of(context).platform == TargetPlatform.iOS
                      ? new CupertinoButton(
                    child: hotel.get_favorited() ? new Icon(Icons.favorite, color: Colors.redAccent) : new Icon(Icons.favorite_border, color: Colors.redAccent),
                    onPressed: (){
                      setState(() {
                        hotel.set_favorited(!hotel.get_favorited());
                        }
                      );
                    },
                  )
                      : new IconButton(
                    icon: hotel.get_favorited() ? new Icon(Icons.favorite, color: Colors.redAccent) : new Icon(Icons.favorite_border, color: Colors.redAccent),
                    onPressed: (){
                      setState(() {
                        hotel.set_favorited(!hotel.get_favorited());
                      }
                      );
                    },
                  )
              ),

            ],
          ),


          Container(
            padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),

            height: 150.0,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),

                  ],
                ),
                SizedBox(height:6.0),
                Row(
                  children: <Widget>[
                    Text(hotel.name, style: new TextStyle(inherit: true, fontSize: 20.0, color: Colors.lightBlue)),
                  ],
                ),
                SizedBox(height: 7.0),

                Row(

                  children: <Widget>[
                    Icon(Icons.location_on, color: theme.accentIconTheme.color),
                    SizedBox(width: 4.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 40.0,
                      width: 287.0,
                      child: Text(hotel.location,
                          softWrap: true,
                          style: new TextStyle(
                              inherit: true,
                              fontWeight: FontWeight.normal,
                              fontSize:  15.0,
                              color: Colors.lightBlue),
                      ),
                    ),

                  ],
                ),



                SizedBox(height: 5.0),
                Row(
                  children: <Widget>[
                    Icon(Icons.phone, color: theme.accentIconTheme.color),
                    SizedBox(width: 4.0),
                    Text(hotel.phone_number, style: new TextStyle(inherit: true, fontWeight: FontWeight.normal, fontSize:  15.0, color: Colors.lightBlue))
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
            height: 200.0,
            child: Text(hotel.description, style: new TextStyle(inherit: true, fontWeight: FontWeight.normal, fontSize:  15.0, color: Colors.lightBlue))
          ),

        ],
      ),
    );

  }


}
