import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:login_signupapp/pages/ShowDataPage.dart';
import 'package:login_signupapp/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Update extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ADD DATA',
      home: UpdatePage(),
    );
  }
}

class UpdatePage extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
  String name, age;
  List storedData = ['', ''];
  var emailID;
  var userID;

  final fb = FirebaseDatabase.instance;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      storedData = prefs.getStringList('my_string_list_key');
      emailID = storedData[0];
      userID = storedData[1];
      if (emailID == null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ref = fb.reference().child("users");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text('Add Data', style: TextStyle(color: Colors.red)),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
              height: 900,
              decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: DecorationImage(
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(1), BlendMode.dstATop),
                    image: AssetImage(
                      './images/anime5.jpg',
                    ),
                    fit: BoxFit.cover,
                  )),
              padding: EdgeInsets.all(20),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Form(
                    //This is the variable _formkey that we created up
                    //We are setting the key property to our form key and now our form and everything inside of it will refer to by the Globalkey that we have created.
                    key: _key,
                    autovalidate: _autovalidate,
                    child: Column(children: <Widget>[
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            " ADD ",
                            style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                                color: Colors.red[600],
                                backgroundColor: Colors.black87,
                                letterSpacing: 2.0),
                          )
                        ],
                      ),
                      Divider(
                        height: 15.0,
                        color: Colors.grey[400],
                        thickness: 2.0,
                      ),
                      const SizedBox(height: 60.0),
                      TextFormField(
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.greenAccent, width: 5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5.0),
                          ),
                          hintText: 'Enter your name here',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: false,
                          fillColor: Colors.white,
                        ),
                        validator: validateName,
                        onChanged: (val) {
                          //As the user enters the info the onchanged function automatically keeps getting the info and below we have stored that in the name variable
                          name = val;
                        },
                      ),
                      const SizedBox(height: 30.0),
                      TextFormField(
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.greenAccent, width: 5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5.0),
                          ),
                          hintText: 'Enter your age here',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.transparent,
                        ),
                        validator: validateAge,
                        onChanged: (val) {
                          age = val;
                        },
                      ),
                      SizedBox(height: 40),
                      RaisedButton(
                        onPressed: () async {
                          if (_key.currentState.validate()) {
                            if (emailID != null) {
                              ref.child(userID).set({
                                "name": name,
                                "age": age,
                              });
                            }
                          }
                        },
                        child: Text('Add Data',
                            style: TextStyle(color: Colors.white)),
                        color: Colors.black,
                      ),
                      SizedBox(height: 20),
                      RaisedButton(
                        onPressed: () async {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Text('Show Data',
                            style: TextStyle(color: Colors.white)),
                        color: Colors.black,
                      )
                    ]),
                  ))),
        ));
  }

  String validateName(String val) {
    return val.length == 0 ? "Enter Name First" : null;
  }

  String validateAge(String val) {
    return val.length == 0 ? "Enter Email First" : null;
  }
}
