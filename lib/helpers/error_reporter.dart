import 'package:flutter/material.dart';

/// General error reporter used for logging errors to [FirebaseCrashlytics]
class ErrorReporter {
  void reportError(error, stackTrace, {String? reason, bool? fatal}) {
    try {
      ///TODO Fixe firebase crashlytic issue
      // FirebaseCrashlytics.instance.setCustomKey("email", SessionManager.instance.email);
      // FirebaseCrashlytics.instance.setUserIdentifier(
      //     "Auth id: ${SessionManager.instance.userId} - User type Id: ${SessionManager.instance.userTypeId}");
      // FirebaseCrashlytics.instance.setCustomKey("name", SessionManager.instance.firstName);
      // FirebaseCrashlytics.instance.recordError(error, stackTrace, reason: reason, fatal: fatal);
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
