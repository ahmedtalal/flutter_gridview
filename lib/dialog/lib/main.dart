import 'package:fancy_dialog/FancyAnimation.dart';
import 'package:fancy_dialog/FancyGif.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp()) ;
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var myKey = GlobalKey<ScaffoldState>() ;
  String result  ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myKey ,
      appBar: AppBar(
        title: Text(
          "dialog in flutter" ,
        ),
        backgroundColor: Colors.orange ,
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              child: Text(
                "alert dialog" ,
                style: TextStyle(
                  color: Colors.white ,
                ),
              ),
              onPressed: (){
                showDialog(
                  context: context ,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text(
                        "Notification" ,
                        style: TextStyle(
                          color: Colors.teal
                        ),
                      ),
                      content: Text(
                        "Do you want allow notification ?" ,
                        style: TextStyle(
                          color: Colors.green ,
                        ),
                      ),
                      actions: [
                        FlatButton(
                          onPressed: (){
                            myKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text(
                                  "cancel" ,
                                  style: TextStyle(
                                    fontSize: 25 ,
                                    fontWeight: FontWeight.bold ,
                                  ),
                                ),
                              ) ,
                            ) ;
                            Navigator.of(context).pop();
                          }, 
                          child: Text(
                            "Cancel"
                          ) ,
                        ) ,
                        FlatButton(
                          child: Text(
                            "Ok" ,
                          ),
                          onPressed: (){
                            myKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text(
                                  "yes" ,
                                  style: TextStyle(
                                    fontSize: 25 ,
                                    fontWeight: FontWeight.bold ,
                                  ),
                                ),
                              ) ,
                            );
                            Navigator.of(context).pop() ;
                          },
                        ) ,
                      ],
                    ) ;
                  }
                );
              },
              color: Colors.red ,
            ) ,
            RaisedButton(
              child: Text(
                "custom dailog" ,
                style: TextStyle(
                  color: Colors.white ,
                ),
              ),
              color: Colors.blue ,
              onPressed: (){
                showDialog(
                  barrierDismissible: false ,
                  context: context ,
                  builder: (BuildContext context){
                    return  Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7) ,
                      ),
                      child: Container(
                        height: 100 ,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch ,
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Enter your name ? " ,
                                ),
                                onChanged: (value){
                                  result = value ;
                                },
                              ) ,
                              RaisedButton(
                                child: Text("data"),
                                onPressed: (){
                                  Navigator.of(context).pop() ;
                                  myKey.currentState.showSnackBar(
                                    SnackBar(
                                      content: Text("the result is $result") ,
                                    ) ,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    );
                  }
                ) ;
              },
            ) ,
            // this is button 3
            RaisedButton(
              child: Text(
                "custom dialog 2" ,
              ),
              color: Colors.green ,
              textColor: Colors.white ,
              onPressed: (){
                showDialog(
                  context: context ,
                  barrierDismissible: false ,
                  builder: (BuildContext context){
                    return CustomDialog() ;
                  }
                ) ;
              },
            ),
            
            // external dialog 
            RaisedButton(
              child: Text(
                "external package dialog" ,
              ),
              textColor: Colors.white ,
              color: Colors.orange ,
              onPressed: (){
                showDialog(
                  context: context ,
                  barrierDismissible: false ,
                  builder: (context) => ExternalDialog(),
                ) ;
              },
            ) ,
          ],
        ),
      ) ,
    );
  }
}

class ExternalDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FancyDialog(
      title: "My lover",
      descreption: "aml yacien will be my lover forever" ,
      cancelFun: (){
        print("yes ,she will be my lover") ;
      } ,
      okFun: (){
        print("yes , she will be my lover") ;
      },
      gifPath: FancyGif.FUNNY_MAN ,
      animationType: FancyAnimation.TOP_BOTTOM ,
    );
  }
}

class CustomDialog extends StatefulWidget {
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  var result ;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10) ,
      ) ,
      child: Container(
        height: 180 ,
        padding: EdgeInsets.symmetric(horizontal: 12) ,
        child: Center(
         child : Column(
          children: [
            Text(
              "show message" ,
            ),
            Icon(
              Icons.bus_alert ,
              size: 50 ,
            ) ,
            TextField(
             decoration: InputDecoration(
               hintText: "enter your message ", 
             ),
            onChanged: (value){
              result = value ;
            },
           ),
            RaisedButton(
              child: Text(
                "save"
              ),
              onPressed: (){
                Navigator.of(context).pop() ;
                print(result) ;
              },
            ),
          ],
         ) ,
         ),
      ) ,
    );
  }
}