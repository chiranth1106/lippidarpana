


part of 'app_pages.dart';
abstract class _Paths {
  _Paths._();
  static const welcome='/';
  static const register='/register';
  static const otp='/otp';
  static const userinfo='/userinfo';
  static const home='/home';
  static const sidebar='/sidebar';
  static const upload='/upload';
  static const output='/output';
}

abstract class Routes{
  Routes._();
  static const welcome=_Paths.welcome;
  static const register=_Paths.register;
  static const otp=_Paths.otp;
  static const userinfo=_Paths.userinfo;
  static const home=_Paths.home;
  static const sidebar=_Paths.sidebar;
  static const upload=_Paths.upload;
  static const output=_Paths.output;
}
