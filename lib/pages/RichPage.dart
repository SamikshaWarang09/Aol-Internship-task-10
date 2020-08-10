import 'package:flutter/material.dart';

class Rich extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichPage();
  }
}

class RichPage extends StatefulWidget {
  @override
  _RichPageState createState() => _RichPageState();
}

class _RichPageState extends State<RichPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Rich Text'),
          centerTitle: true,
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
                        Center(
                          child: Text(
                            '    Rich Text',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.blue,
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
                            'The RichText widget displays text that uses multiple different styles. '
                            'The text to display is described using a tree of TextSpan objects, each of which has an associated style that is used for that subtree.'
                            ' The text might break across multiple lines or might all be displayed on the same line depending on the layout constraints.',
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
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                                // style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Rich Text ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          backgroundColor: Colors.grey)),
                                  TextSpan(text: '    is a useful Widget ')
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))),
      ),
    );
  }
}
