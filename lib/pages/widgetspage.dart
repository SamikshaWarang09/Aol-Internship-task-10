import 'package:flutter/material.dart';
import 'package:login_signupapp/pages/AlertDialogPage.dart';
import 'package:login_signupapp/pages/AspectRatioPage.dart';
import 'package:login_signupapp/pages/ColourFilteredPage.dart';
import 'package:login_signupapp/pages/DividerPage.dart';
import 'package:login_signupapp/pages/FlexiblePage.dart';
import 'package:login_signupapp/pages/IgnorePointerPage.dart';
import 'package:login_signupapp/pages/RichPage.dart';
import 'package:login_signupapp/pages/SelectableTextPage.dart';
import 'package:login_signupapp/pages/SizedBoxPage.dart';
import 'package:login_signupapp/pages/SpacerPage.dart';
import 'package:login_signupapp/pages/ToolTipPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: Colors.,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Home Page',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 50,
                          color: Colors.red,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AlertDialogPage()));
                            },
                            child: Center(
                              child: Text(
                                  'Tap here for more information on Alert Dialog',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 100,
                          color: Colors.blue,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RichPage()));
                            },
                            child: Center(
                              child: Text(
                                  'Tap here for more information on Rich Text',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 50,
                          color: Colors.green,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SelectableTextPage()));
                            },
                            child: Center(
                              child: Text(
                                  'Tap here for more information on Selectable Text',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 100,
                          color: Colors.amber,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FlexiblePage()));
                            },
                            child: Center(
                              child: Text(
                                  'Tap here for more information on Flexible',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 50,
                          color: Colors.pink,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SpacerPage()));
                            },
                            child: Center(
                              child: Text(
                                  'Tap here for more information on  Spacer',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 100,
                          color: Colors.deepOrange,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DividerPage()));
                            },
                            child: Center(
                              child: Text(
                                  'Tap here for more information on Divider',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 50,
                          color: Colors.purple,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          IgnorePointerPage()));
                            },
                            child: Center(
                              child: Text(
                                  'Tap here for more information on Ignore Pointer',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 100,
                          color: Colors.indigo,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ColourFilteredPage()));
                            },
                            child: Center(
                              child: Text(
                                  'Tap here for more information on Color Filtered',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 50,
                          color: Colors.lime,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ToolTipPage()));
                            },
                            child: Center(
                              child: Text(
                                  'Tap here for more information on Tool Tip',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 100,
                          color: Colors.teal,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AspectRatioPage()));
                            },
                            child: Center(
                              child: Text(
                                  'Tap here for more information on Aspect Ratio',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 50,
                          color: Colors.blueGrey,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SizedBoxPage()));
                            },
                            child: Center(
                              child: Text(
                                  'Tap here for more information on Sized Box',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
