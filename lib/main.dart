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
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white ,
            fontSize: 25 ,
            fontWeight: FontWeight.bold ,
          ) ,
          headline2: TextStyle(
            color: Colors.red ,
            fontSize: 25 ,
            fontWeight: FontWeight.bold ,
          ) ,
        ) ,
      ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myKey ,
      appBar: AppBar(
        title: Text(
          "Gridview in flutter" ,
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Colors.red[300],
      ),
      body: GridView.count(
        scrollDirection: Axis.vertical ,
        crossAxisCount: 2 ,
        crossAxisSpacing: 15 ,
        mainAxisSpacing: 15,
        children: List.generate(30, (index){
          return Container(
            height: 100,
            child: Center(
              child:ListTile(
                title:  Text(
                  "item $index" ,
                  style: Theme.of(context).textTheme.headline2,
                ),
                subtitle: Text(
                  "subtitle $index" ,
                   style: Theme.of(context).textTheme.headline2,
                ),
                onTap: (){
                  myKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text(
                        "item $index" ,
                      ) , 
                    ),
                  ) ;
                },
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white ,
              border: Border.all(
                color: Colors.grey[300] ,
                width: 2 ,
              ) ,
              borderRadius: BorderRadius.circular(10) ,
            ),
            margin: EdgeInsets.all(5) ,
          ) ;
        }),
      ),
    );
  }
}