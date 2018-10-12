import 'dart:async';
import 'package:flutter/foundation.dart';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => new SearchPageState();
}
// At the top level:
enum Location { Seoul, Busan, Daegu }
enum Room { Single, Double, Family }
String _Room = 'Single';
String _Location = 'Seoul';
// In the State of a stateful widget:
Location _selectedLocation = Location.Seoul;
Room _selectedRoom = Room.Single;


class SearchPageState extends State<SearchPage> {
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool star1 = false;
  bool star2 = false;
  bool star3 = false;
  bool star4 = false;
  bool star5 = false;
  bool switch_on = false;
  String _check_in_date = 'check in date';

  String get check_in_date => _check_in_date;

  set check_in_date(String check_in_date) {
    _check_in_date = check_in_date;
  }
  String check_in_time = 'check in time';
  String check_out_date = 'check out date';
  String check_out_time = 'check out time';
  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();
  double fee = 0.0;


  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Search')),
      body: new ListView(
        children: [

          new ExpansionPanelList(
              expansionCallback: (int a, bool b) {
                setState(() {
                  if (a == 0)
                    isExpanded1 = !isExpanded1;
                  else if (a == 1)
                    isExpanded2 = !isExpanded2;
                  else if (a == 2)
                    isExpanded3 = !isExpanded3;
                });
              },
              children: [
                new ExpansionPanel(

                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return new Row(
                      children: <Widget>[
                        SizedBox(
                          width: 20.0,
                        ),

                        Container(
                          width: 100.0,
                          child: Text('Location', style: new TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w500)),
                        ),
                        Container(
                          width: 150.0,
                          child: Text('select location', style: new TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.w500)),
                        ),
                      ],
                    );
                  },
                  isExpanded: isExpanded1,
                  body: new Container(
                    padding: EdgeInsets.fromLTRB(90.0, 0.0, 0.0, 0.0),
                    child: new Column(

                      children: <Widget>[
                        new RadioListTile(
                          title: const Text('Seoul'),
                          value: Location.Seoul,
                          groupValue: _selectedLocation,
                          onChanged: (Location value) {
                            setState(() {
                              _selectedLocation = value;
                              _Location = 'Seoul';
                            });
                          },

                        ),
                        new RadioListTile(
                          title: const Text('Busan'),
                          value: Location.Busan,
                          groupValue: _selectedLocation,
                          onChanged: (Location value) {
                            setState(() {
                              _selectedLocation = value;
                              _Location = 'Busan';

                            });
                          },

                        ),
                        new RadioListTile(
                          title: const Text('Daegu'),
                          value: Location.Daegu,
                          groupValue: _selectedLocation,
                          onChanged: (Location value) {
                            setState(() {
                              _selectedLocation = value;
                              _Location = 'Daegu';

                            });
                          },

                        ),
                      ],
                    ),
                  ),
                ),
                new ExpansionPanel(

                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return new Row(
                      children: <Widget>[
                        SizedBox(
                          width: 20.0,
                        ),

                        Container(
                          width: 100.0,
                          child: Text('Room', style: new TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w500)),
                        ),
                        Container(
                          width: 150.0,
                          child: Text('select room', style: new TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.w500)),
                        ),
                      ],
                    );
                  },
                  isExpanded: isExpanded2,
                  body: new Container(
                    padding: EdgeInsets.fromLTRB(90.0, 0.0, 0.0, 0.0),
                    child: new Column(

                      children: <Widget>[
                        new RadioListTile(
                          title: const Text('Single'),
                          value: Room.Single,
                          groupValue: _selectedRoom,
                          onChanged: (Room value) {
                            setState(() {
                              _selectedRoom = value;
                              _Room = 'Single';
                            });
                          },

                        ),
                        new RadioListTile(
                          title: const Text('Double'),
                          value: Room.Double,
                          groupValue: _selectedRoom,
                          onChanged: (Room value) {
                            setState(() {
                              _selectedRoom = value;
                              _Room = 'Double';

                            });
                          },

                        ),
                        new RadioListTile(
                          title: const Text('Family'),
                          value: Room.Family,
                          groupValue: _selectedRoom,
                          onChanged: (Room value) {
                            setState(() {
                              _selectedRoom = value;
                              _Room = 'Family';

                            });
                          },

                        ),
                      ],
                    ),
                  ),
                ),
                new ExpansionPanel(

                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return new Row(
                      children: <Widget>[
                        SizedBox(
                          width: 20.0,
                        ),

                        Container(
                          width: 100.0,
                          child: Text('Rating', style: new TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w500)),
                        ),
                        Container(
                          width: 150.0,
                          child: Text(
                              'select a hotel rating', style: new TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.w500)),
                        ),
                      ],
                    );
                  },
                  isExpanded: isExpanded3,
                  body: new Container(
                    padding: EdgeInsets.fromLTRB(90.0, 0.0, 0.0, 0.0),
                    child: new Column(

                      children: <Widget>[
                        new CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Row(
                            children: <Widget>[
                              Icon(Icons.star, color: Colors.yellow[600]),
                            ],
                          ),
                          value: star1,
                          onChanged: (bool value) {
                            setState(() {
                              star1 = value;
                            });
                          },
                        ),

                        new CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Row(
                            children: <Widget>[
                              Icon(Icons.star, color: Colors.yellow[600]),
                              Icon(Icons.star, color: Colors.yellow[600]),
                            ],
                          ),
                          value: star2,
                          onChanged: (bool value) {
                            setState(() {
                              star2 = value;
                            });
                          },
                        ),
                        new CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Row(
                            children: <Widget>[
                              Icon(Icons.star, color: Colors.yellow[600]),
                              Icon(Icons.star, color: Colors.yellow[600]),
                              Icon(Icons.star, color: Colors.yellow[600]),
                            ],
                          ),
                          value: star3,
                          onChanged: (bool value) {
                            setState(() {
                              star3 = value;
                            });
                          },
                        ),
                        new CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Row(
                            children: <Widget>[
                              Icon(Icons.star, color: Colors.yellow[600]),
                              Icon(Icons.star, color: Colors.yellow[600]),
                              Icon(Icons.star, color: Colors.yellow[600]),
                              Icon(Icons.star, color: Colors.yellow[600]),
                            ],
                          ),
                          value: star4,
                          onChanged: (bool value) {
                            setState(() {
                              star4 = value;
                            });
                          },
                        ),
                        new CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Row(
                            children: <Widget>[
                              Icon(Icons.star, color: Colors.yellow[600]),
                              Icon(Icons.star, color: Colors.yellow[600]),
                              Icon(Icons.star, color: Colors.yellow[600]),
                              Icon(Icons.star, color: Colors.yellow[600]),
                              Icon(Icons.star, color: Colors.yellow[600]),
                            ],
                          ),
                          value: star5,
                          onChanged: (bool value) {
                            setState(() {
                              star5 = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ]
          ),
          ListTile(

            title: Container(
              padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 10.0),
              child: Row(
                children: <Widget>[
                  Text('Date', style: new TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.w900),),
                  SizedBox(width: 100.0),
                  Text('I don\'t have specific dates yet', style: new TextStyle(
                      fontSize: 10.0, fontWeight: FontWeight.normal),),
                  Switch(
                    value: switch_on,
                    onChanged: (bool value) {
                      setState(() {
                        switch_on = value;
                        check_out_time = '';
                        check_in_time = '';
                        check_out_date = '';
                        check_in_date = '';
                      });
                    },
                  ),

                ],
              ),

            ),
            subtitle: Container(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),

              height: 200.0,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),

                        width: 150.0,
                        height: 100.0,
                        child: Column(
                          children: <Widget>[
                            Row(children: <Widget>[
                              Icon(Icons.calendar_today),
                              Text('Check-in', style: new TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),),
                            ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(check_in_date, style: new TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500),)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(check_in_time, style: new TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500),)
                              ],
                            )

                          ],
                        ),
                      ),
                      Container(
                        width: 170.0,
                        height: 100.0,

                        child: Column(
                          children: <Widget>[
                            ButtonTheme(
                              minWidth: 120.0,
                              height: 30.0,

                              child: FlatButton(
                                child: Text('select Date'),
                                color: Colors.lightBlue,
                                onPressed: switch_on ? null : () {
                                    _selectCheckInDate();
                                },
                              ),
                            ),
                            ButtonTheme(
                              minWidth: 120.0,
                              height: 30.0,
                              child: FlatButton(
                                child: Text('select time'),
                                color: Colors.lightBlue,
                                onPressed: switch_on ? null : () {
                                  _selectCheckInTime();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),

                        width: 150.0,
                        height: 100.0,
                        child: Column(
                          children: <Widget>[
                            Row(children: <Widget>[
                              Icon(Icons.calendar_today),
                              Text('Check-out', style: new TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),),
                            ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(check_out_date, style: new TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500),)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(check_out_time, style: new TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500),)
                              ],
                            )

                          ],
                        ),
                      ),
                      Container(
                        width: 170.0,
                        height: 100.0,

                        child: Column(
                          children: <Widget>[
                            ButtonTheme(
                              minWidth: 120.0,
                              height: 30.0,

                              child: FlatButton(
                                child: Text('select Date'),
                                color: Colors.lightBlue,
                                onPressed: switch_on ? null : () {
                                  _selectCheckOutDate();
                                },
                              ),
                            ),
                            ButtonTheme(
                              minWidth: 120.0,
                              height: 30.0,
                              child: FlatButton(
                                child: Text('select time'),
                                color: Colors.lightBlue,
                                onPressed: switch_on ? null : () {
                                  _selectCheckOutTime();
                                },

                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ],
              ),

            ),

          ),
          Divider(color: Colors.grey),
          ListTile(
            title: Container(
              padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 10.0),
              child: Row(
                children: <Widget>[
                  Text('Fee', style: new TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.w900),),
                  SizedBox(width: 200.0),
                  Text('Up to \$' + fee.toString(), style: new TextStyle(
                      fontSize: 10.0, fontWeight: FontWeight.normal),),

                ],
              ),
            ),
            subtitle: Container(
              height: 150.0,
              child: Column(
                children: <Widget>[
                  Slider(
                    value: fee,
                    onChanged: (double value){
                      setState(() {
                        fee = value;
                      });
                    },
                    min: 0.0,
                    max: 300.0,
                    divisions: 10,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ButtonTheme(
                    minWidth: 200.0,
                    height: 50.0,
                    child: RaisedButton(
                      child: Text(
                          'Search', style: new TextStyle(fontSize: 30.0, color: Colors.white)),
                      color: Colors.lightBlue,
                      onPressed: () {
                        _showResultDialog();

                      },

                    ),

                  ),
                ],

              ),

            ),
          ),

        ],
      ),
    );
  }

  Future<Null> _selectCheckInDate() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2018),
        lastDate: DateTime(2020)
    );
    if (picked != null && picked != _date)
      setState((){
        _date = picked;
        check_in_date = DateFormat.yMMMd().format(_date);
        print(check_in_date);
      });
  }
  Future<Null> _selectCheckOutDate() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2018),
        lastDate: DateTime(2020)
    );
    if (picked != null && picked != _date)
      setState((){
        _date = picked;
        check_out_date = DateFormat.yMMMd().format(_date);
        print(check_out_date);
      });
  }

  Future<Null> _selectCheckInTime() async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (picked != null && picked != _time)
      setState((){
        _time = picked;
        check_in_time = _time.format(context);
        print(check_in_time);

      }
      );
  }
  Future<Null> _selectCheckOutTime() async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (picked != null && picked != _time)
      setState((){
        _time = picked;
        check_out_time = _time.format(context);
        print(check_out_time);

      }
      );
  }
  Future<Null> _showResultDialog() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: Container(
            color: Colors.blue,
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Please Check Your Choice:)', style: TextStyle(color: Colors.white, fontSize: 18.0),),
              ],
            )
          ),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.location_on, color: Colors.lightBlue,),
                    SizedBox(width: 5.0),
                    SizedBox(
                        child: Text(_Location, textAlign: TextAlign.center, style: new TextStyle(fontWeight: FontWeight.w500)),
                        width: 215.0),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.credit_card, color: Colors.lightBlue,),
                    SizedBox(width: 5.0),
                    SizedBox(
                        child: Text(_Room, textAlign: TextAlign.center, style: new TextStyle(fontWeight: FontWeight.w500)),
                        width: 215.0),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.stars, color: Colors.yellow,),
                    SizedBox(width: 5.0),
                    Container(
                        width: 215.0,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: <Widget>[
                            star1 ? Row(children: <Widget>[
                              Icon(Icons.star, color: Colors.yellow, size: 15.0),
                              Text('/')]) : Row(),
                            star2 ? Row(children: <Widget>[
                              Icon(Icons.star, color: Colors.yellow, size: 15.0),
                              Icon(Icons.star, color: Colors.yellow, size: 15.0),
                              Text('/'),
                            ],) : Row(),
                            star3 ? Row(children: <Widget>[
                              Icon(Icons.star, color: Colors.yellow, size: 15.0),
                              Icon(Icons.star, color: Colors.yellow, size: 15.0),
                              Icon(Icons.star, color: Colors.yellow, size: 15.0),
                              Text('/'),

                            ],) : Row(),
                            star4 ? Row(children: <Widget>[
                              Icon(Icons.star, color: Colors.yellow, size: 15.0),
                              Icon(Icons.star, color: Colors.yellow, size: 15.0),
                              Icon(Icons.star, color: Colors.yellow, size: 15.0),
                              Icon(Icons.star, color: Colors.yellow, size: 15.0),
                              Text('/'),

                            ],) : Row(),
                            star5 ? Row(children: <Widget>[
                              Icon(Icons.star, color: Colors.yellow, size: 15.0),
                              Icon(Icons.star, color: Colors.yellow, size: 15.0),
                              Icon(Icons.star, color: Colors.yellow, size: 15.0),
                              Icon(Icons.star, color: Colors.yellow, size: 15.0),
                              Icon(Icons.star, color: Colors.yellow, size: 15.0),


                            ],) : Row(),
                          ],
                        ),

                        ),
                  ],
                ),
                Container(
                  width: 215.0,
                  height: 30.0,
                  child: Row(
                    children: <Widget>[

                      Icon(Icons.calendar_today, color: Colors.lightBlue,),
                      SizedBox(width: 5.0),
                      Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                            SizedBox(
                                width: 40.0,
                                child: Text('IN', style: new TextStyle(fontSize: 10.0)),
                            ),
                            Text(check_in_date+ ' ' + check_in_time, style: new TextStyle(fontSize: 12.0, color: Colors.black26))
                          ],
                          ),
                          Row(children: <Widget>[
                            SizedBox(
                              width: 40.0,
                              child: Text('OUT', style: new TextStyle(fontSize: 10.0)),
                            ),
                            Text(check_out_date+ ' ' + check_out_time, style: new TextStyle(fontSize: 12.0, color: Colors.black26))
                          ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Container(
              height: 50.0,
              width: 278.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Search', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(width: 5.0),

                  RaisedButton(
                    color: Colors.grey,
                    child:  Text('Cancel', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            )
          ],
        );
      },
    );
  }


}

