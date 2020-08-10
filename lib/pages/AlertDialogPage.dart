import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialogPage();
  }
}

class AlertDialogPage extends StatefulWidget {
  @override
  _RichPageState createState() => _RichPageState();
}

class _RichPageState extends State<AlertDialogPage> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notifications'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Hey! You have New Notifications.'),
                Text('Would you like to Check them?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              color: Colors.white,
              child: Text(
                'Yes!',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(width: 120),
            FlatButton(
              color: Colors.white,
              child: Text(
                'No!',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          backgroundColor: Colors.blue,
          elevation: 58.0,
          // shape: CircleBorder(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Alert Dialog',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.red,
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
                            '    Alert Dialog',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.red,
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
                            'An alert dialog informs the user about situations that require acknowledgement. '
                            'An alert dialog has an optional title and an optional list of actions.'
                            ' The title is displayed above the content and the actions are displayed below the content.',
                            style: TextStyle(color: Colors.green),
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
                                color: Colors.redAccent,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            color: Colors.blue,
                            child: FlatButton(
                                onPressed: () => _showMyDialog(),
                                child: Text('Notifications')))
                      ],
                    ),
                  ],
                ))),
      ),
    );
  }
}
