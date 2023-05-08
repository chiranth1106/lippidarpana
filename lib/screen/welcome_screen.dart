import 'package:flutter/material.dart';
import 'package:project/provider/auth_provider.dart';
import 'package:project/screen/home_screen.dart';
import 'package:project/screen/register.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/LipiDarpana.png',
                  height: 300,
                ),
                const SizedBox(height: 20,),
                const Text("Let's get started",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                ),
                const SizedBox(height: 10,),
                const Text("Never a Better Time than now to Start",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () async{
                    if(ap.isSignedIn == true) {
                      await ap.getDataFromSP().whenComplete(() =>
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                          const HomeScreen(),),),);

                    }else{
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterScreen(),),);
                    }
                  },
                    child: const Text('Get Started'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red.shade900,
                      shape:RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),
        ),
      ),
    );
  }
}
