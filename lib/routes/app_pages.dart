import 'package:get/get.dart';
import 'package:project/controller/output_controller.dart';

import '../screen/home_screen.dart';
import '../screen/otp_screen.dart';
import '../screen/output_screen.dart';
import '../screen/register.dart';
import '../screen/upload_screen.dart';
import '../screen/user_information_screen.dart';
import '../screen/welcome_screen.dart';
import '../services/firebase_storage_service.dart';
import '../utils/sidebar.dart';

part 'app_routes.dart';

part 'app_bindings.dart';

class AppPages {
  static const initial = Routes.welcome;
  static final routes = [
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: Routes.otp,
      page: () => const OtpScreen(
        verificationId: '',
      ),
    ),
    GetPage(
      name: Routes.userinfo,
      page: () => const UserInformationScreen(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: Routes.sidebar,
      page: () => const MySidebar(),
    ),
    GetPage(
      name: Routes.upload,
      page: () => const UploadScreen(),
    ),
    GetPage(
        name: Routes.output,
        page: () => const OutputScreen(),
        binding: AppBindings()),
  ];
}
