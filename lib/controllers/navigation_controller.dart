import 'package:flutter/material.dart';

class NavigationController {
  // static void navigateToAndRemoveUntil(BuildContext context, String routeName, {Object arguments}) {
  //   Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
  // }

  // static void navigateToAndRemoveUntilWithPredicate(BuildContext context, String routeName,
  //     {Object arguments, bool Function(Route<dynamic>) predicate}) {
  //   Navigator.of(context).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  // }

  // static void navigateToReplacement(BuildContext context, String routeName, {Object arguments}) {
  //   Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
  // }

  // static void navigateToReplacementAndRemoveUntil(BuildContext context, String routeName, {Object arguments}) {
  //   Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
  // }

  // static void navigateToReplacementAndRemoveUntilWithPredicate(BuildContext context, String routeName,
  //     {Object arguments, bool Function(Route<dynamic>) predicate}) {
  //   Navigator.of(context).pushReplacementNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  // }

  static void navigateToRoot(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  static void navigateBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void navigateBackWithResult(BuildContext context, dynamic result) {
    Navigator.of(context).pop(result);
  }

  static void navigateBackWithResultAndRemoveUntil(BuildContext context, dynamic result) {
    Navigator.of(context).popUntil((route) => false);
    Navigator.of(context).pop(result);
  }

  static void navigateBackWithResultAndRemoveUntilWithPredicate(
      BuildContext context, dynamic result, bool Function(Route<dynamic>) predicate) {
    Navigator.of(context).popUntil(predicate);
    Navigator.of(context).pop(result);
  }

  static void navigateBackWithResultAndRemoveUntilWithPredicateAndResult(
      BuildContext context, dynamic result, bool Function(Route<dynamic>) predicate) {
    Navigator.of(context).popUntil(predicate);
    Navigator.of(context).pop(result);
  }

  static void navigateBackWithResultAndRemoveUntilWithPredicateAndResultAndRemove(
      BuildContext context, dynamic result, bool Function(Route<dynamic>) predicate) {
    Navigator.of(context).popUntil(predicate);
    Navigator.of(context).pop(result);
  }
}
