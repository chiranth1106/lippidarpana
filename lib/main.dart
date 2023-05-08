import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/provider/auth_provider.dart';
import 'package:project/routes/app_pages.dart';
import 'package:project/screen/welcome_screen.dart';
import 'package:project/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    //Image.memory(await pickedFile.readAsBytes());
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey:"AIzaSyDDa9B_E-b47qIw3Sabj4oxUejb5fv4KlY" ,
            appId: "1:450960459392:web:8216d655ada58d30810865",
            messagingSenderId: "450960459392",
            storageBucket: 'final-project-auth-8da0e.appspot.com',
            projectId: "final-project-auth-8da0e")
    );
  }else
    {

    }
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
        title: "LIPIDARPANA",
        initialRoute: AppPages.initial,
        initialBinding: AppBindings(),
      ),
    );
  }
}
