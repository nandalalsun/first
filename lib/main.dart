//import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Message Card',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String message = "Type your message here";
  Color textColor = Colors.lightGreen;
  TextEditingController clearText = new TextEditingController();
  TextEditingController clearPass = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textColor,
        title: Text("Messaging Card"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightGreen,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit'),
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Video',
                  style: TextStyle(
                    color: Colors.red,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 15.0,
              child: Container(
                height: 200.0,
                width: 410.0,
                color: textColor,
                child: Center(
                    child: Text(message,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Raleway',
                        ))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: clearText,
              onChanged: (String newValue) {
                print(newValue);
                setState(() {
                  message = newValue;
                });
              },
              autofocus: false,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                      width: 2.0,
                      color: textColor,
                    )),
                hintText: "John Abhram",
                helperText: "Please input your full name here",
                suffixIcon: Icon(
                  Icons.message,
                  color: textColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: clearPass,
              maxLength: 8,
              autofocus: false,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                      width: 2.0,
                      color: textColor,
                    )),
                hintText: "****",
                suffixIcon: Icon(
                  Icons.edit,
                  color: textColor,
                ),
                helperText: "Please password here",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              elevation: 5.0,
              child: Text(
                "clear the Data",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
                //side: BorderSide(color: Colors.red,),
              ),
              onPressed: () {
                clearPass.clear();
                clearText.clear();
              },
              color: textColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          textColor = Colors.blue;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          textColor = Colors.green;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          textColor = Colors.pinkAccent;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.pinkAccent,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          textColor = Colors.orange;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
              elevation: 7.0,
            ),
          ),
          ManImg(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.settings_backup_restore),
        label: Text("Reset"),
        onPressed: () {
          clearPass.clear();
          clearText.clear();
          setState(() {
            textColor = Colors.lightGreen;
          });
        },
        backgroundColor: textColor,
      ),
    );
  }
}

class ManImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/man.png');
    Image image = Image(
      image: assetImage,
      height: 250.0,
    );
    return Container(
      child: image,
    );
  }
}
