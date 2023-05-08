import 'dart:html';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:project/services/firebase_storage_service.dart';

class OutputController extends GetxController{
RxString url="".obs;
Future<void> test()  async {
  final Reference firebaseStorageRef = FirebaseStorage.instance
      .ref()
      .child('Output')
      .child("output.png");
  // await firebaseStorageRef.putData(await (yourimage as File/Xfile).readAsBytes());
  final String imageURL = await firebaseStorageRef.getDownloadURL();
  String? url=imageURL;

}

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    test();
  }



}
