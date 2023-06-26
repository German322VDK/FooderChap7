import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class AppRouter {
  final AppStateManager appStateManager;
  final ProfileManager profileManager;
  final GroceryManager groceryManager;
  final TeamManager teamManager;

  AppRouter(this.appStateManager, this.profileManager, this.groceryManager, 
    this.teamManager);

  late final router = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: appStateManager,
    initialLocation: '/login',
    routes: [
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => const LoginScreen(),
        routes: [
          GoRoute(
            name: 'signup',
            path: 'signup',
            builder: (context, state) => const SignupScreen(),
          )
        ]
      ),
      GoRoute(
        name: 'onboarding',
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        name: 'home',
        path: '/:tab',
        builder: (context, state) {
          final tab = int.tryParse(state.pathParameters['tab'] ?? '') ?? 0;
          return Home(key: state.pageKey, currentTab: tab);
        },
        routes: [
          GoRoute(
            name: 'item',
            path: 'item/:id',
            builder: (context, state) {
              final itemId = state.pathParameters['id'] ?? '';
              final item = groceryManager.getGroceryItem(itemId);
              return GroceryItemScreen(
                originalItem: item,
                onCreate: (item) {
                  groceryManager.addItem(item);
                },
                onUpdate: (item) {
                  groceryManager.updateItem(item);
                },
              );
            },
          ),
          GoRoute(
            name: 'profileEdit',
            path: 'profileEdit',
            builder: (context, state) {
                final tab = int.tryParse(state.pathParameters['tab'] ?? '') 
                ?? 0;
                return ProfileEditPage(
                    currentTab: tab);
              },        
          ),
          GoRoute(
            name: 'teamEdit',
            path: 'teamEdit',
            builder: (context, state) {
                final tab = int.tryParse(state.pathParameters['tab'] ?? '') 
                ?? 0;
                return TeamEditPage(
                    currentTab2: tab);
              },        
          ),
          GoRoute(
              name: 'profile',
              path: 'profile',
              builder: (context, state) {
                final tab = int.tryParse(state.pathParameters['tab'] ?? '') 
                ?? 0;
                return ProfileScreen(
                    user: Provider.of<ProfileManager>(context, listen: false).
                    getUser, currentTab: tab);
              },
             /* routes: [
                GoRoute(
                  name: 'rw',
                  path: 'rw',
                  builder: (context, state) => const ProfileScreen(),
                ),
              ]*/
            ),
        ],
      ),
    ],
    redirect: (context, state) {
      final loggedIn = appStateManager.isLoggedIn;
      final signupLinkPressed = appStateManager.isSignupLinkPressed;
      final loggingIn = state.matchedLocation == '/login';
      final signupPage = state.matchedLocation == '/login/signup';

      if (!loggedIn) return signupLinkPressed ? '/login/signup' : loggingIn ? null : '/login';

      final isOnboardingComplete = appStateManager.isOnboardingComplete;
      final onboarding = state.matchedLocation == '/onboarding';
      if (!isOnboardingComplete) {
        return onboarding ? null : '/onboarding';
      }

      if (loggingIn || onboarding || signupPage) return '/${AtbTab.profileInfo}';
      return null;
    },
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(
              state.error.toString(),
            ),
          ),
        ),
      );
    },
  );
}
