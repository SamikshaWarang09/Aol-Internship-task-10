import 'package:flutter/material.dart';
import 'package:login_signupapp/pages/widgetspage.dart';

class Ignore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IgnorePointerPage();
  }
}

class IgnorePointerPage extends StatefulWidget {
  @override
  _RichPageState createState() => _RichPageState();
}

class _RichPageState extends State<IgnorePointerPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ignore Pointer',
              style: TextStyle(
                color: Colors.black,
              )),
          centerTitle: true,
          backgroundColor: Colors.indigo,
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
                            '    Ignore Pointer',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.indigo,
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
                            'A widget that is invisible during hit testing.'
                            'We use Ignore Pointer when we want to protect a specific part of UI from user interaction',
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
                                color: Colors.indigoAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    IgnorePointer(
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                              ),
                            ),
                            child: Container(
                              child: Text(
                                'IG',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.blue,
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Container(
                            child: Text(
                              'NO',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blue,
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          Container(
                            child: Text(
                              'RE',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blue,
                          ),
                          Spacer(flex: 3),
                        ],
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
