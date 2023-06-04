import 'package:flutter/widgets.dart';

class AppProvider extends ChangeNotifier{

  //true for dark mode
  //false for light mode
  bool _isDarkMode = false;

  bool getThemeMode(){
    return _isDarkMode;
  }

  void changeTheme(bool darkModeOn){
    _isDarkMode = darkModeOn;
    //shared pref add
    notifyListeners();
  }

}