import 'package:flutter/material.dart';

class Div extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DividerPage();
  }
}

class DividerPage extends StatefulWidget {
  @override
  _DividerPageState createState() => _DividerPageState();
}

class _DividerPageState extends State<DividerPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Divider',
              style: TextStyle(
                color: Colors.black,
              )),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
            child: Container(
                color: Colors.black,
                height: 700,
                padding: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            '    Divider ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'A thin horizontal line, with padding on either side.'
                            'In the material design language, this represents a divider. Dividers can be used in lists, Drawers, and elsewhere to separate content.',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Text(
                              'Example :',
                              style: TextStyle(
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      height: 20,
                      thickness: 3,
                      color: Colors.grey,
                      indent: 20,
                      endIndent: 5,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'DI',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          child: Text(
                            'VI',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        Container(
                          child: Text(
                            'DER',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        ),
                        Spacer(flex: 3),
                      ],
                    ),
                  ],
                ))),
      ),
    );
  }
}
