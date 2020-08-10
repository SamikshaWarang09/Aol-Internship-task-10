import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_signupapp/pages/profile.dart';
import 'package:login_signupapp/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data:(brightness) =>new ThemeData(
        primaryColor: Colors.lightBlue[400],
        accentColor: Colors.yellow[600],
        brightness :brightness,
        scaffoldBackgroundColor: Colors.blue,
        textSelectionHandleColor: Colors.amber,
        textSelectionColor: Colors.lime,
        cursorColor: Colors.indigoAccent,
        toggleableActiveColor: Colors.black,
        
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red[900],
              width: 2.5,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          labelStyle: const TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
      themedWidgetBuilder: (context,theme){
        return new MaterialApp(
         // title: "Home page",uuuj    \
          //centerTitle :true,
          theme: theme,
          home: HomePage(), 
        );
      }
    );
}
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List storedData = ['', '',''];
  bool visited = false;

  @override
  void initState() {
    super.initState(); //super.initstate() says that okay , run the original function that we are actually overriding (we use super to do that), so whatever function we actually inherit for initstate , run that first inside here and then we can do the extra coding inside this version of the function as well 
    _loadData();
  }

//underscore in the front indicates that the function is private .i.e it can be used in the same file or class
//using final as the variable type tells that the value of this variable is not gonna change .It will remain the same throughout
//set state is a way for u to set properties on the state object and trigger updates to the UI.You gove it a function that makes the changes and the state object runs it and makes sure the UI gets build afterwards
//watch net ninja video anytime if u forget about initstate

  _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      storedData = prefs.getStringList('my_string_list_key');
      if (storedData[0] != '') {
        visited = true;
              }
    });
    
  }

  

  @override
  Widget build(BuildContext context) {
    
    print('build ran');
    return visited ? ProfilePage() : LoginPage();

  }
  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }


  void changeColor() {
    DynamicTheme.of(context).setThemeData(new ThemeData(
        primaryColor: Theme.of(context).primaryColor == Colors.indigo? Colors.red: Colors.indigo
    ));
  }
}


