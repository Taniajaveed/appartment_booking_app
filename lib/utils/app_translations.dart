import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'welcome': 'Welcome',
      'home': 'Home',
      'login': 'Login',
      'email': 'Email',
      'password': 'Password',
    },
    'ur_PK': {
      'welcome': 'خوش آمدید',
      'home': 'ہوم',
      'login': 'لاگ ان',
      'email': 'ای میل',
      'password': 'پاس ورڈ',
    },
  };
}
