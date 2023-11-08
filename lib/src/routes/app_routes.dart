// ignore_for_file: constant_identifier_names
part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const MAIN = _Paths.MAIN;
  static const HOME = _Paths.HOME;
  static const PROFILE = _Paths.PROFILE;
  static const HISTORY = _Paths.HISTORY;
  static const SCAN = _Paths.SCAN;
  static const GUEST = _Paths.GUEST;
  static const CONFIRM = _Paths.CONFIRM;
}

abstract class _Paths {
  _Paths._();
  static const MAIN = '/main';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const PROFILE = '/profile';
  static const HISTORY = '/history';
  static const SCAN = '/scan';
  static const GUEST = '/guest';
  static const CONFIRM = '/confirm';
}
