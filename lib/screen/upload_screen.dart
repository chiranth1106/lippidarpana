import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:project/screen/output_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {

  String inputUrl ='';
  bool loading =true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("LIPPIDARPANA"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    padding: const EdgeInsets.all(00.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red.shade50
                    ),
                    child: Image.asset('assets/LipiDarpana.png',
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text("Welcome",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text("Upload the the image of Lippi here...",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,
                      color: Colors.black38,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(onPressed:() async {

                      //buffer
                      showDialog(context: context, builder: (context){
                        return const Center(child: CircularProgressIndicator(),
                        //valueColor:AlwaysStoppedAnimation<Color>(Colors.red)
                        );
                      });

                      ImagePicker imagePicker =ImagePicker();
                      XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
                      print('{file?.path}');

                      if(file==null) return;
                      //String input = DateTime.now().microsecondsSinceEpoch.toString();

                      Reference referenceRoot = FirebaseStorage.instance.ref();
                      Reference referenceDirinput = referenceRoot.child('Input');

                      Reference referenceImageToUpload = referenceDirinput.child('input.png');

                      try {
                        await referenceImageToUpload.putFile(File(file!.path));

                        inputUrl = await referenceImageToUpload.getDownloadURL();
                        // ignore: empty_catches
                      }catch(error){
                      }
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();

                    },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade900,
                        shape:RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text('UPLOAD'),
                    ),
                  ),
                  const SizedBox(height: 20,),
                   SizedBox(
                     height: 50,
                     width: double.infinity,
                     child: ElevatedButton(onPressed:() {
                       showDialog(context: context, builder: (context){


                         return const Center(child: CircularProgressIndicator(),
                           //valueColor:AlwaysStoppedAnimation<Color>(Colors.red)
                         );
                       });
                       Navigator.push(context, MaterialPageRoute
                         (builder: (context) => const OutputScreen(),
                       ),);

                       Navigator.of(context).pop();
                       
                     },
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.red.shade900,
                         shape:RoundedRectangleBorder(
                           borderRadius:BorderRadius.circular(25),
                         ),
                       ),
                       child: const Text('NEXT'),
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
