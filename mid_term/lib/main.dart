import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Midterm';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final TextStyle drawertext = new TextStyle(inherit: true, color: Colors.grey, fontSize: 20.0);

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('My Page!')),
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Search', style : drawertext),
              leading: Icon(Icons.search, color: Colors.lightBlue),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Favorit Hotel', style : drawertext),
              leading: Icon(Icons.location_city, color: Colors.lightBlue),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text('Ranking', style: drawertext),
              leading: Icon(Icons.insert_chart, color: Colors.lightBlue),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('My Page', style: drawertext),
              leading: Icon(Icons.person, color: Colors.lightBlue),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}