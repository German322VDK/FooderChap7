import 'dart:async';
import 'package:flutter/material.dart';
import 'models.dart';

class AtbTab {
  static const int profileInfo = 0;
  static const int teamInfo = 1;
  static const int lookingForGroups = 2;
}

// AppStateManager mocks the various app state such as app initialization,
// app login, and onboarding.
class AppStateManager extends ChangeNotifier {
  // Checks to see if the user is logged in
  bool _loggedIn = false;
  // Checks to see if the user wants to sign up
  bool _SignupLinkPressed = false;
  // Checks to see if the user has completed onboarding
  bool _onboardingComplete = false;
  // Records the current tab the user is on.
  int _selectedTab = AtbTab.profileInfo;
  // Stores user state properties on platform specific file system.
  final _appCache = AppCache();

  // Property getters.
  bool get isLoggedIn => _loggedIn;
  bool get isSignupLinkPressed => _SignupLinkPressed;
  bool get isOnboardingComplete => _onboardingComplete;
  int get getSelectedTab => _selectedTab;

  // Initializes the app
  Future<void> initializeApp() async {
    // Check if the user is logged in
    _loggedIn = await _appCache.isUserLoggedIn();
    // Check if the user completed onboarding
    _onboardingComplete = await _appCache.didCompleteOnboarding();
  }

  void login(String username, String password) async {
    final result = await HTTP_Login('api/user/login', {'username':username, 'password':password});
    _loggedIn = result;
    await _appCache.cacheUser();
    notifyListeners();
  }

  void toSignup()  {
    _SignupLinkPressed = true;
    notifyListeners();
  }

  void signup(String username, String password)  {
    _SignupLinkPressed = false;
    login(username, password);
    notifyListeners();
  }

  void onboarded() async {
    _onboardingComplete = true;
    await _appCache.completeOnboarding();
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  void goToRecipes() {
    _selectedTab = AtbTab.teamInfo;
    notifyListeners();
  }

  void logout() async {
    // Reset all properties once user logs out
    _SignupLinkPressed = false;
    _loggedIn = false;
    _onboardingComplete = false;
    _selectedTab = 0;

    // Reinitialize the app
    await _appCache.invalidate();
    await initializeApp();
    notifyListeners();
  }
}
