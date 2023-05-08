import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

Reference get firebaseStorage => FirebaseStorage.instance.ref();

class FirebaseStorageServices extends GetxService{
  Future <String?> getImage(String? imgName) async {
    if(imgName == null) {
      return null;
    }
    try{

      var urlRef = firebaseStorage
          .child("Output")
          .child('${imgName.toLowerCase()}.png');
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    }catch(error){
      return null;
    }
  }
}