import 'package:flutter/material.dart';

class Sized extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBoxPage();
  }
}

class SizedBoxPage extends StatefulWidget {
  @override
  _SizedBoxPageState createState() => _SizedBoxPageState();
}

class _SizedBoxPageState extends State<SizedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sized Box',
              style: TextStyle(
                color: Colors.black,
              )),
          centerTitle: true,
          backgroundColor: Colors.grey,
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
                            '    Sized Box',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.grey,
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
                            'A box with a specified size.'
                            'If given a child, this widget forces its child to have a specific width and/or height (assuming values are permitted by this widgets parent).'
                            'If not given a child, SizedBox will try to size itself as close to the specified height and width as possible given the parents constraints.',
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
                                color: Colors.grey[400],
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            'SIZ',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          child: Text(
                            'ED',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        Container(
                          child: Text(
                            'BOX',
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
