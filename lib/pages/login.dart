import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_signupapp/pages/profile.dart';
import 'package:login_signupapp/pages/register.dart';
import 'package:login_signupapp/services/forgotpassword.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('anime page ran');

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("My Anime page"),
        centerTitle: true,
      ),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
 const LoginForm({Key key}) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  
  List<String> data = ['', ''];
  

  //Global key allows us to access our form's state
  //We are creating a variable called _form key and this _form key is getting the GlobalKey and the GlobalKey has our FormState inside of it . 
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); 
  final userController = TextEditingController();
  final passController = TextEditingController();

   

  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }

  void changeColor() {
    DynamicTheme.of(context).setThemeData(new ThemeData(
        primaryColor: Theme.of(context).primaryColor == Colors.blue
            ? Colors.blue
            : Colors.pink));
  }


  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
//Accessing shared preferences return a future
  Future<FirebaseUser> _logInGoogle() async {
    FirebaseUser user;
    bool isSignedIn = await _googleSignIn.isSignedIn();
    if (isSignedIn) {
      user = await _firebaseAuth.currentUser();
      print(user);
    } else {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      user = (await _firebaseAuth.signInWithCredential(credential)).user;
      //user = (await _firebaseAuth.currentUser()).user;

    }
    print(user);
    return user;
  }

  Future<FirebaseUser> _logInWithEmailPass(String email, String pass) async {
    //The validator ,as the name is implied, is a function that helps validate the form item 
    if (_formKey.currentState.validate() == true) {
      // firebase code
      FirebaseUser user;
      AuthResult result;
      result = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: pass)
          .catchError((err) {
            print(err);
    Future.delayed(const Duration (milliseconds: 2000),(){
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Error : $err ",
            ),
          ),
        );
    });
      });
      user = result.user;
      print(user);
      return user;
    } else {
      print('null was returned');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('main page ran ');
    return  SingleChildScrollView(
        child:Container(
            decoration : BoxDecoration(
            color: const Color(0xff7c94b6),
            image:DecorationImage(
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  image: 
                  AssetImage(
                    './images/anime.jpg',
                    ),
                   fit: BoxFit.cover,
                 )
              ),
          padding: EdgeInsets.all(20),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Form(
                   
                   //This is the variable _formkey that we created up
                   //We are setting the key property to our form key and now our form and everything inside of it will refer to by the Globalkey that we have created.
                   key: _formKey,
                   
                  child: Column(children: <Widget>[
                    const SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Login Page",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    Divider(height:15.0,color: Colors.white,thickness: 2.0,),
                    const SizedBox(height: 50.0),
                    TextFormField(
                      controller: userController,
                      decoration: const InputDecoration(
                        hintText: 'Email ID',
                        hintStyle: TextStyle(color:Colors.white),
                        filled: false,
                        fillColor: Colors.white,
                      ),
                      validator: (String value) {
                        if (value.trim().isEmpty) {
                          return 'Please enter your email';
                        }
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                    obscureText: true,
                      controller: passController,
                      decoration: const InputDecoration(
                        hintText: 'password',
                        hintStyle: TextStyle(color:Colors.white),
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      validator: (String value) {
                        if (value.trim().isEmpty) {
                          return 'Please enter your password';
                        }
                        },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "      Forgot Password ? ",
                          style: TextStyle(
                            color:Colors.limeAccent,
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                            ),
                          ),
                          
                      
                          //gesture detectore captures all the tapping activity and it provides more controls like dragging , etc
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassPage()),
                            );
                            changeBrightness();
                          },
                          child: Text(
                            "Click Here...",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                              ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: OutlineButton(
                            color: Color(008000),
                        highlightColor: Colors.orange,
                        borderSide: BorderSide(
                          color:Colors.black,
                          width:5.0,
                          style:BorderStyle.solid
                        ),
                            padding: EdgeInsets.symmetric(
                            horizontal: 45, vertical: 15),
                            highlightedBorderColor: Colors.red,
                            onPressed: () async {
                              print('login with email password ran');
                              FirebaseUser user = await _logInWithEmailPass(
                                  userController.text, passController.text);
                              data[0] = user.email;
                              data[1] = user.uid;
                              await FirebaseAuth.instance.signOut();
                              final prefs = await SharedPreferences.getInstance();
                              prefs.setStringList('my_string_list_key', data);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(),
                                ),
                              );
                              changeBrightness();
                              changeColor();
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color:Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "  New User ? ",
                          style: TextStyle(
                            color:Colors.limeAccent,
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                            ),
                          ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                            );
                          },
                          child: Text(
                            "Click here to Register...",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                              ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>[
                      Center(
                        child: Text(
                          'OR',
                         style: TextStyle(
                           fontSize: 30,
                           color:Colors.black87,
                           fontWeight: FontWeight.bold,
                         ), 
                          ),
                      )
                    ]),
                    SizedBox(height:10),
                    Row(
                      children: <Widget>[
                      OutlineButton(
                        splashColor: Colors.grey,
                        onPressed: () async {
                          print('google login ran');
                          FirebaseUser user = await _logInGoogle();
                          data[0] = user.email;
                          data[1] = user.uid;
                          await FirebaseAuth.instance.signOut();
                          _googleSignIn.signOut();
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setStringList('my_string_list_key', data);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePage(),
                            ),
                          );
                          changeBrightness();
                          changeColor();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        highlightElevation: 0,
                        borderSide: BorderSide(color: Colors.black,width:2.0),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                    image: AssetImage("images/google_logo.png"),
                                    height: 35.0,
                                    fit: BoxFit.cover,
                                    ),
                                    
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    ' Sign in with Google' ,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.greenAccent,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ]
                  ),
                ]
              ),
            )
          )
        ),
      );
    }
}
