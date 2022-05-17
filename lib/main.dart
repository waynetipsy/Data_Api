import 'package:flutter/material.dart';
import './api_controller.dart';
import './dart_json_class.dart';


void main() {
  runApp( MyApp(),
    );
  }

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
       home: const MyHomePage(),
         );
  }
}

  class MyHomePage extends StatefulWidget {
   const MyHomePage({ Key? key }) : super(key: key);
 
   @override
   State<MyHomePage> createState() => _MyHomePageState();
 }
 
 class _MyHomePageState extends State<MyHomePage> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: const Text('Complex Json Request')
       ),
      body: FutureBuilder<List<Users>>(
        future: ApiProvider().getUsers(),
        builder: (context, snapshot) {
       final data = snapshot.data;
       if (snapshot.hasData) {
      return ListView.builder(
        itemCount: data!.length,
        itemBuilder: (context, index) {
          final userData = data[index];
          final name = userData.name;
          final firstName = name.substring(0, 2);
          return ListTile(
            onTap: () {
              print(userData.address);
            },
            leading: CircleAvatar(
            backgroundColor: Colors.yellow,
              radius: 30,
              child: Text(firstName,
            style: const TextStyle(color: Colors.black),
              ),
            ),
            title: Text(userData.name),
            subtitle: Text(userData.email),
             );
            }
          );
            } else {
            return const Center(child: CircularProgressIndicator(),
            );
          }
         }
       ),
     );
   }
 }
