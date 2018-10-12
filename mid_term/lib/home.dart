import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'model/hotels_repository.dart';
import 'model/hotel.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:mid_term/detail.dart';
import 'package:mid_term/search.dart';
import 'package:mid_term/favorite.dart';
import 'package:mid_term/mypage.dart';
import 'package:mid_term/ranking.dart';
import 'package:mid_term/language.dart';


class HomePage extends StatelessWidget {
  final String title;
  final TextStyle drawertext = new TextStyle(inherit: true, color: Colors.grey, fontSize: 20.0);
  final TextStyle cardnametext = new TextStyle(inherit: true, color: Colors.black, fontSize: 13.0);
  final TextStyle cardloctext = new TextStyle(inherit: true, color: Colors.black, fontSize: 10.0);
  final ThemeData theme;
  List<Hotel> products = HotelsRepository.loadProducts(Kind.all);

  HomePage({Key key, this.title, this.theme, this.products}) : super(key: key);

  List<Card> _buildGridCards(BuildContext context) {
    timeDilation = 5.0; // 1.0 means normal animation speed.

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    return products.map((product) {
      return Card(
        // TODO: Adjust card heights (103)
        child: Column(
          // TODO: Center items on the card (103)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PhotoHero(
              photo: "images/" + product.assetName,
              height: 100.0,
              onTap: () {

              },
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                  title: Row(
                    children: <Widget>[
                      SizedBox(width: 22.0),
                      Text(
                        product.name,
                        style: theme.textTheme.body1,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  subtitle: Row(

                    children: <Widget>[
                      Icon(Icons.location_on, color: theme.accentIconTheme.color),
                      Container(
                        height: 25.0,
                        width: 110.0,
                        child: Text(
                          product.location,
                          softWrap: true,

                          style: theme.textTheme.body2,
                        ),
                      ),


                    ],
                  ),
                ),
                    // TODO(larche): Make subtitle2 when available



              ),
            ),
            Container(
              height: 23.0,
              alignment: Alignment.topRight,
              child: ButtonTheme(
                minWidth: 5.0,
                height: 20.0,
                child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailPage(theme:theme, hotel: product)),
                      );
                    },
                    child: Text('more', style: new TextStyle(color: Colors.lightBlue)),
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Main'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LanguageSelectorPage()),
              );
            },
          ),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,

            padding: EdgeInsets.all(16.0),
            childAspectRatio: 8.0 / 9.0,
            children: _buildGridCards(context),
          );
        },
      ),

      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.fromLTRB(30.0, 100.0, 0.0, 0.0),
              child: Text("Pages", style: new TextStyle(fontSize: 25.0, color: Colors.white)),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Home', style : new TextStyle(color: Colors.lightBlue, fontSize: 20.0)),
              leading: Icon(Icons.home, color: Colors.lightBlue),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage(title: title, theme: theme, products: products)),
                );
              },
            ),
            ListTile(
              title: Text('Search', style : drawertext),
              leading: Icon(Icons.search, color: Colors.lightBlue),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
                },
            ),

            ListTile(
              title: Text('Favorit Hotel', style : drawertext),
              leading: Icon(Icons.location_city, color: Colors.lightBlue),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoritePage(hotels:products)),
                );              },
            ),

            ListTile(
              title: Text('Ranking', style: drawertext),
              leading: Icon(Icons.insert_chart, color: Colors.lightBlue),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RankingPage()),
                );              },
            ),
            ListTile(
              title: Text('My Page', style: drawertext),
              leading: Icon(Icons.person, color: Colors.lightBlue),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPage()),
                );              },
            ),
          ],
        ),
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {

  const PhotoHero({ Key key, this.photo, this.onTap, this.width, this.height}) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;
  final double height;


  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Hero(
        tag: photo,
        child: Image.asset(
          photo,
          fit: BoxFit.fitHeight,
        ),

      ),

    );
  }
}
