import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:login_signupapp/pages/myData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_signupapp/pages/login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final fb = FirebaseDatabase.instance.reference().child('users');
  List<Model> list = List();
  List storedData = ['',''];
  String emailID,userID;
  
  _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      storedData = prefs.getStringList('my_string_list_key');
      emailID = storedData[0];
      userID = storedData[1];
      print(userID);
      if (emailID == null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
  }

  @override
  void initState(){
    print('init ran');
    super.initState();
    _loadData();
    fb.once().then((DataSnapshot snap){
      var data = snap.value;
      //data.currentState.reset();
      data.forEach((key,value){
        print(key);
        print(value["name"]);
        Model model = new Model(
          name: value['name'],
          age:value['age'],
          key: key,
        );
        print("ss");
        list.add(model);
      });
      setState((){

      });
    });
  }



  Future<String> createDialog(BuildContext context){
    TextEditingController ed = TextEditingController();
    return showDialog(context: context,builder:(context){
      return AlertDialog(
        title: Text("Update Data"),
        content : TextField(
          controller: ed,
      
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: (){
              Navigator.of(context).pop(ed.text.toString());
          },
          child: Text("submit"),
          ),
        ],
      );
    });
  }

  deleteData(BuildContext context,String key){
    Widget okButton = FlatButton(
      onPressed: (){
        setState(() {
          fb.child(key).remove();
          Navigator.of(context).pop();
           });
      },
       child: Text('Yes')
       );

       Widget noButton = FlatButton(
         onPressed: (){
        setState(() {
          Navigator.of(context).pop();
        });
      },
       child: Text('No')
       );

       AlertDialog alert = AlertDialog(
         title:Text(" Delete Data !"),
         content:Text("Do you want to delete?"),
         actions:[
           okButton,
           noButton,
         ]
       );

       showDialog(
         context: context,
       builder: (BuildContext context){
         return alert;
       });
  }
  


  @override
  Widget build(BuildContext context) {
    print('build');
    Widget UI(String name , String age,String key){
      print(userID);
      return new GestureDetector(
        onLongPress: (){
          createDialog(context).then((value){
              Map<String,Object> createDoc1 =  LinkedHashMap();
              createDoc1['age'] = value;
              // createDoc['age'] = value;
              fb.child(key).update(createDoc1);          
          });
          createDialog(context).then((value){
              Map<String,Object> createDoc2 =  LinkedHashMap();
              createDoc2['name'] = value;
              fb.child(key).update(createDoc2);          
          });
        },
        onTap: (){
          deleteData(context,key);
        },
        child: SingleChildScrollView(
                  child: Card(
                    color: Colors.black,
                    semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
            margin: EdgeInsets.fromLTRB(10, 190, 10,0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Container(
                 padding: EdgeInsets.all(20),
                child: Text(
                      'Name :  ${name[0].toUpperCase()}${name.substring(1)}' ,
                      style: TextStyle(
                        color:Colors.red,
                        fontStyle:FontStyle.normal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                  // padding: EdgeInsets.all(20),

                  child: Text(                    
                      'Age : $age ',
                      style: TextStyle(
                        color:Colors.red,
                        //fontStyle:FontStyle.italic,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Email :  $emailID' ,
                      style: TextStyle(
                        color:Colors.red,
                        fontStyle:FontStyle.normal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                 padding: EdgeInsets.all(20),
                  child: Text(
                       'UID : $userID ',
                      style: TextStyle(
                        color:Colors.red,
                        fontStyle:FontStyle.normal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

            ],
            ),
            ),
        ),
      );

    }
    return Scaffold(
      appBar:AppBar(
        title: Text('Homepage'),
        backgroundColor: Colors.purple,
        ),
        body: new Scaffold(
          
          body:list.length == 0 ? Container(height: 900,
              decoration : BoxDecoration(
              color: const Color(0xff7c94b6),
              image:DecorationImage(
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.dstATop),
                    image: 
                    AssetImage(
                      './images/anime1.jpg',
                      ),
                     fit: BoxFit.cover,
                   )
                ),
                child: Center(
                  child: Container(
                    color: Colors.red,
                    height: 60,
                    width: 700,
                    child: Center(
                      child: Text(
                      " No Data Available ! ",
                      style: TextStyle(
                        color:Colors.blue[900],
                        fontSize:30,
                        fontWeight:FontWeight.bold,
                        // fontStyle:FontStyle.itac,
                        backgroundColor:Colors.red
                      ),
                      ),
                    ),
                  )
                    )
                    ): new ListView.builder(
            itemCount: list.length,
            itemBuilder: (_,index){
              return UI(list[index].name,list[index].age,list[index].key);
            }
            )
        ),
    );
  }
}