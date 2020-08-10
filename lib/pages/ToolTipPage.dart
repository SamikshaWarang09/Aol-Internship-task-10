import 'package:flutter/material.dart';

class Tool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ToolTipPage();
  }
}

class ToolTipPage extends StatefulWidget {
  @override
  _ToolTipPageState createState() => _ToolTipPageState();
}

class _ToolTipPageState extends State<ToolTipPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ToolTip',
              style: TextStyle(
                color: Colors.black,
              )),
          centerTitle: true,
          backgroundColor: Colors.lime,
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
                            '  Tool Tip ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.lime,
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
                            'Tooltips provide text labels that help explain the function of a button or other user interface action.'
                            'Wrap the button in a Tooltip widget to show a label when the widget long pressed (or when the user takes some other appropriate action).',
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
                                color: Colors.limeAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    // SizedBox(height: 20),
                    Container(
                      height: 300,
                      child: Center(
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              Colors.lime, BlendMode.softLight),
                          child: Tooltip(
                              message: 'Penguin',
                              verticalOffset: 40,
                              height: 25,
                              textStyle: TextStyle(color: Colors.red),
                              child: Image.asset('images/penguin.jpg')),
                        ),
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
