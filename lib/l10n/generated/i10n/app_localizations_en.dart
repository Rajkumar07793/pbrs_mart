// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'PBRS Mart';

  @override
  String get welcomeBack => 'Welcome Back';

  @override
  String get signInToContinue => 'Sign in to Continue';

  @override
  String get signUpToContinue => 'Sign up to Continue';

  @override
  String get mobileNumber => 'Mobile Number';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get name => 'Name';

  @override
  String get email => 'Email';

  @override
  String get signIn => 'SIGN IN NOW';

  @override
  String get signUp => 'SIGN UP NOW';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get terms => 'Terms & Conditions';

  @override
  String get noAccount => 'You don\'t have an account?';

  @override
  String get haveAnAccount => 'Already have an account?';

  @override
  String get signUpHere => 'Sign Up';

  @override
  String get signInHere => 'Sign In';

  @override
  String get invalidEmail => 'Please enter a valid email';

  @override
  String get requiredField => 'This field is required';

  @override
  String get passwordLength => 'Password must be at least 6 characters';

  @override
  String get passwordMismatch => 'Passwords do not match';
}

/// The translations for English, as used in India (`en_IN`).
class AppLocalizationsEnIn extends AppLocalizationsEn {
  AppLocalizationsEnIn() : super('en_IN');

  @override
  String get appName => 'PBRS Mart';

  @override
  String get welcomeBack => 'Welcome back yaar!';

  @override
  String get signInToContinue => 'Sign in karo aur chalo aage';

  @override
  String get signUpToContinue => 'Naya account banao aur chalo aage';

  @override
  String get mobileNumber => 'Mobile number daalo';

  @override
  String get password => 'Password daalo';

  @override
  String get confirmPassword => 'Dubara password likho';

  @override
  String get name => 'Naam';

  @override
  String get email => 'Email ID';

  @override
  String get signIn => 'Sign in now';

  @override
  String get signUp => 'Sign up abhi';

  @override
  String get forgotPassword => 'Password bhool gaye?';

  @override
  String get terms => 'Terms & Conditions maan lo';

  @override
  String get noAccount => 'Kya account nahi hai?';

  @override
  String get haveAnAccount => 'Kya account hai?';

  @override
  String get signUpHere => 'Sign up yaha karo';

  @override
  String get signInHere => 'Sign up yaha karo';

  @override
  String get invalidEmail => 'Sahi email daalo';

  @override
  String get requiredField => 'Ye field zaroori hai';

  @override
  String get passwordLength =>
      'Password kam se kam 6 character ka hona chahiye';

  @override
  String get passwordMismatch => 'Passwords match nahi kar rahe';
}
