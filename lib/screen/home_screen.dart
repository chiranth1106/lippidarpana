import 'package:flutter/material.dart';
import 'package:project/screen/welcome_screen.dart';
import 'package:project/utils/sidebar.dart';
import 'package:provider/provider.dart';


import '../provider/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String imageUrl = '';
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      drawer: const MySidebar(),


      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("PROFILE"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            ap.userSignOut().then((value) =>
                Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen(),),),);
          }, icon:const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.red,
              backgroundImage: NetworkImage(ap.userModel.profilePic),
              radius: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(ap.userModel.name),
            Text(ap.userModel.phoneNumber),
            Text(ap.userModel.email),
            Text(ap.userModel.bio),
          ],
        ),
      ),
    );
  }

}
