import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main () {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/' : (context) => const HomePage(),
    },
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () async{
            await openAppSettings();
          } ,icon: const Icon(Icons.settings))
        ],
        title: const Text("Permissions",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async {
              PermissionStatus status = Permission.location.request() as PermissionStatus;

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("$status"),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                ),
              );

              if(status == PermissionStatus.granted) {
                print("grants....");
              } else {
                print("denied....");
              }
            }, child: const Text("Location Permission",)),
            ElevatedButton(onPressed: () async {
              PermissionStatus status = Permission.manageExternalStorage.request() as PermissionStatus;

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("$status"),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                ),
              );

              if(status == PermissionStatus.granted) {
                print("grants....");
              } else {
                print("denied....");
              }
            }, child: const Text("External Storage Permission",)),
          ],
        ),
      ),
    );
  }
}
