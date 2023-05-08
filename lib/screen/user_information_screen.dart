import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project/model/user_model.dart';
import 'package:project/screen/home_screen.dart';
import 'package:project/screen/upload_screen.dart';
import 'package:project/utils/utils.dart';
import 'package:provider/provider.dart';
import '../provider/auth_provider.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({Key? key}) : super(key: key);

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  File? image;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();

  void dispose(){
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
  }
  void selectImage() async {
    image = await pickImage (context);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<AuthProvider>(context, listen: true).isloading;
    return Scaffold(
      body: SafeArea(
        child: isLoading == true ? const Center(child: CircularProgressIndicator(color: Colors.red,),)
            :SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 5.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () => selectImage(),
                  child: image == null ? const CircleAvatar(backgroundColor: Colors.red,
                    radius: 50,
                    child: Icon(Icons.account_circle,size: 50, color: Colors.white,),
                  ) : CircleAvatar(backgroundImage: FileImage(image!),
                    radius: 50,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15,),
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      //name
                      textFeild(hintText: "Max Furry", icon: Icons.account_circle,
                          inputType: TextInputType.name, maxLines: 1, controller: nameController
                      ),
                      //email
                      textFeild(hintText: "abc@example.com", icon: Icons.email,
                          inputType: TextInputType.emailAddress, maxLines: 1, controller: emailController
                      ),
                      //bio
                      textFeild(hintText: "Enter your bio here...", icon: Icons.edit,
                          inputType: TextInputType.name, maxLines: 2, controller: bioController
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                width: double.infinity *0.90,
                child: ElevatedButton(onPressed: () => storeData(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade900,
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(25),

                ),
                ),
                  child: const Text('Continue'),
                ),
                ),
              ],
            ),
          ),
        ),
    );
  }
  Widget textFeild({required String hintText, required IconData icon,
    required TextInputType inputType, required int maxLines,
  required TextEditingController controller}){
    return Padding(padding: const EdgeInsets.only(bottom: 10),
        child: TextFormField(
          cursorColor: Colors.red,
          controller: controller,
          keyboardType: inputType,
          maxLines: maxLines,
          decoration: InputDecoration(
            prefixIcon: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.red
              ),
              child: Icon(
                icon,
              size: 20,
              color: Colors.white,
            ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.transparent
            ),
          ),
    hintText: hintText,
    alignLabelWithHint: true,
    fillColor: Colors.red.shade50,
        ),
    ),
    );
  }

  void storeData() async{
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        bio: bioController.text.trim(),
        profilePic: "",
        createdAt: "",
        phoneNumber: "",
        uid: "",
        //inputUrl: "",
    );
    if(image != null){
      ap.saveUserDataToFirebase(
          context: context,
          userModel: userModel,
          profilePic: image!,
          onSuccess: () {
            ap.saveUserDataToSP().then((value) =>
                ap.setSignIn().then((value) =>
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
                    const HomeScreen()), (route) => false,),),);
          },
      );
    }else
      {
        showSnackBar(context, "please upload your profile photo");
      }
  }
}
