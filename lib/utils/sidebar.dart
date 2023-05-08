import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/screen/upload_screen.dart';



class MySidebar extends StatelessWidget {

  const MySidebar({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Text(
              'LIPIDARPANA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.upload_outlined),
            title: const Text('Upload',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute
                (builder: (context) => const UploadScreen(),),);
            },
          ),
        ],
      ),
    );
  }
}


