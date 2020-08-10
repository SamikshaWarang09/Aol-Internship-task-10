import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpacerPage();
  }
}

class SpacerPage extends StatefulWidget {
  @override
  _SpacerPageState createState() => _SpacerPageState();
}

class _SpacerPageState extends State<SpacerPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Spacer',
              style: TextStyle(
                color: Colors.black,
              )),
          centerTitle: true,
          backgroundColor: Colors.pink,
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
                            '     Spacer ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.pink,
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
                            'Spacer creates an adjustable, empty spacer that can be used to tune the spacing between widgets in a Flex container, like Row or Column.'
                            'The Spacer widget will take up any available space, so setting the Flex.mainAxisAlignment on a flex container that contains a Spacer to MainAxisAlignment.spaceAround, MainAxisAlignment.spaceBetween, or MainAxisAlignment.spaceEvenly will not have any visible effect: the Spacer has taken up all of the additional space, therefore there is none left to redistribute link Sample',
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
                                color: Colors.pinkAccent,
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
                            'SP',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          child: Text(
                            'AC',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        Container(
                          child: Text(
                            'ER',
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
