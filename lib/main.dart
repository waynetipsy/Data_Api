import './api_call.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
  const  HomeApp(),
    );
  }

  class HomeApp extends StatefulWidget {
    const HomeApp({ Key? key }) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
   late Future<Users> users;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    users = getUsers();
  }


    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
       home: Scaffold(
         appBar: AppBar(
           title: Text('Api calls in flutter'),
           centerTitle: true,
         ),
     body: Center(
       child: FutureBuilder<Users>(
         future: users,
         builder: (context, snapshot) {
          if(snapshot.hasData) {
          return Column(
        mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(snapshot.data!.name),
        Text(snapshot.data!.email),
        Text(snapshot.data!.username),
      ],
       );
      }else if (snapshot.hasData) {
        return Text(snapshot.error.toString());
      }else{
        return  CircularProgressIndicator();
          }
         }
        ),
      ),
     ),
    );
  }
}
