import 'package:flutter/material.dart';

class Colour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColourFilteredPage();
  }
}

class ColourFilteredPage extends StatefulWidget {
  @override
  _ColourFilteredPageState createState() => _ColourFilteredPageState();
}

class _ColourFilteredPageState extends State<ColourFilteredPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Color Filtered',
              style: TextStyle(
                color: Colors.black,
              )),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
            child: Container(
                color: Colors.black,
                height: 700,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Text(
                            '    Color Filtered',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Text(
                              'Applies a ColorFilter to its child.',
                              style: TextStyle(color: Colors.red),
                            ),
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
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      color: Colors.lightGreen,
                      // height: 500,
                      height: 400,
                      child: Center(
                        child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Colors.green, BlendMode.colorBurn),
                            child: Image.asset('images/penguin.jpg')),
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
