part of 'app_pages.dart';


class AppBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OutputController>(() => OutputController(), fenix: true);
    Get.lazyPut(()=>FirebaseStorageServices());
  }

}