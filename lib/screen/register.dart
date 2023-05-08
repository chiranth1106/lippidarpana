import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "India",
      displayName: "India",
      displayNameNoCountryCode: "IN",
      e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(offset: phoneController.text.length,),
    );

    return Scaffold(
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
                const Text("Registration",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10,),
                const Text("Add your Phone Number, we'll send your Verification Code",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  cursorColor: Colors.red,
                  controller: phoneController,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  onChanged: (value) {
                    setState(() {
                      phoneController.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Phone Number",
                    hintStyle: const TextStyle(fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    prefixIcon:Container(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(context: context,
                            countryListTheme: const CountryListThemeData(
                              bottomSheetHeight: 550,
                            ),
                            onSelect: (value){
                            setState(() {
                              selectedCountry = value;
                            });
                          },);
                        },
                        child: Text("${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode} ",
                        style: const TextStyle(fontSize: 18, color: Colors.black,
                        fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                    ),
                    suffixIcon: phoneController.text.length > 9 ? Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: const Icon(Icons.done, color: Colors.white, size: 20,),
                    ) : null,
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () => sendPhoneNumber(),
                    child: const Text('login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade900,
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
  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signedInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");

  }
}
