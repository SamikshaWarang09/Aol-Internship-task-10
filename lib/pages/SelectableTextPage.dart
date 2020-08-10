import 'package:flutter/material.dart';
import 'package:login_signupapp/pages/widgetspage.dart';

class Select extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SelectableTextPage();
  }
}

class SelectableTextPage extends StatefulWidget {
  @override
  _SelectableTextPageState createState() => _SelectableTextPageState();
}

class _SelectableTextPageState extends State<SelectableTextPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Selectable Text',
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
                padding: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Selectable'
                            ' Text',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.green,
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
                            'The SelectableText widget displays a string of text with a single style. '
                            'The string might break across multiple lines or might all be displayed on the same line depending on the layout constraints.'
                            'To make SelectableText react to touch events, use callback onTap to achieve the desired behavior.',
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
                                color: Colors.greenAccent,
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
                            child: SelectableText(
                          ' Hey ! I am Samiksha ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                          autofocus: true,
                          showCursor: true,
                          cursorColor: Colors.amber,
                          cursorRadius: Radius.circular(2),
                          cursorWidth: 2.0,
                          onTap: () => MyHomePage(),
                          enableInteractiveSelection: true,
                          toolbarOptions: ToolbarOptions(
                            copy: true,
                            paste: true,
                            cut: true,
                            selectAll: true,
                          ),
                        )),
                      ],
                    ),
                  ],
                ))),
      ),
    );
  }
}
