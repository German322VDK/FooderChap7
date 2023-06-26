import 'package:flutter/material.dart';

import 'models.dart';

class ProfileManager extends ChangeNotifier {
  
  var _newUser = User(id: '0');
  void signupUser(String id,
    String login,
    String firstName,
    String lastName,
    String role,
    String email,
    ) 
    {
      _newUser = User(
        id: id, 
        login: login,
        firstName: firstName,
        lastName: lastName,
        role: role,
        email: email
        );
      userDatabase.add(_newUser);
      notifyListeners();
    }
    
  void setCurrentUser(input_login) => 
    _newUser = userDatabase.singleWhere((element) => element.login 
      == input_login);

  
  User get getUser => _newUser;

  
  set setUserPhone(String phone){
    _newUser.phone = phone;
  }
  

  bool get didSelectUser => _didSelectUser;
  bool get didTapOnRaywenderlich => _tapOnRaywenderlich;
  bool get darkMode => _darkMode;

  var _didSelectUser = false;
  var _tapOnRaywenderlich = false;
  var _darkMode = false;

  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
    _newUser.darkMode = darkMode;
  }

  void tapOnRaywenderlich(bool selected) {
    _tapOnRaywenderlich = selected;
    notifyListeners();
  }

  void tapOnProfile(bool selected) {
    _didSelectUser = selected;
    notifyListeners();
  }
}
