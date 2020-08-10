import 'package:flutter/material.dart';

class Aspect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatioPage();
  }
}

class AspectRatioPage extends StatefulWidget {
  @override
  _AspectRatioPageState createState() => _AspectRatioPageState();
}

class _AspectRatioPageState extends State<AspectRatioPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Aspect Ratio',
              style: TextStyle(
                color: Colors.black,
              )),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
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
                            '   Aspect Ratio',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.blueGrey,
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
                            'A widget that attempts to size the child to a specific aspect ratio.'
                            'The widget first tries the largest width permitted by the layout constraints.',
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
                                color: Colors.blueGrey,
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
                          child: Expanded(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: AspectRatio(
                                aspectRatio: 3 / 2,
                                child: Image.asset('images/penguin.jpg'),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ))),
      ),
    );
  }
}
