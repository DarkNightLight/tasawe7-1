// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

class ThemeManager with  ChangeNotifier{


 ThemeMode _themeMode = ThemeMode.light;

 get themeMode => _themeMode;

 ToggleTheme( bool isDark) {

   _themeMode = isDark?ThemeMode.dark:ThemeMode.light;
   notifyListeners();
 }


}

