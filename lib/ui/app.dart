import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/ui/screens/change_password_screen.dart';
import 'package:task_manager/ui/screens/forgot_password_email_screen.dart';
import 'package:task_manager/ui/screens/main_nav_holder_screen.dart';
import 'package:task_manager/ui/screens/pin_verification_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/screens/splash_screen.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      //theme data diye app er global style define kora hoy
      theme: ThemeData(
        // primaryColor: Colors.green,
        colorSchemeSeed: Colors.green,
        // primarySwatch: Colors.green,
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          // titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          // titleSmall: TextStyle(
          //     fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
        ),

        //inoutdecoration theme prebuild style theke nijer kaj
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        //elevated button theme prebuild style theke nijer kaj
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(vertical: 12),
              fixedSize: Size.fromWidth(double.maxFinite),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        SplashScreen.name: (context) => SplashScreen(),
        SignInScreen.name: (context) => SignInScreen(),
        SignUpScreen.name: (context) => SignUpScreen(),
        ForgotPasswordEmailScreen.name: (context) =>
            ForgotPasswordEmailScreen(),
        PinVerificationScreen.name: (context) => PinVerificationScreen(),
        ChangePasswordScreen.name: (context) => ChangePasswordScreen(),
        MainNavHolderScreen.name: (context) => MainNavHolderScreen(),
        AddNewTaskScreen.name: (context) => AddNewTaskScreen(),
        UpdateProfileScreen.name: (context) => UpdateProfileScreen(),
      },
    );
  }
}
