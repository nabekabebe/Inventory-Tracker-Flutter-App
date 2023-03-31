import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AndroidButton implements PlatformButton {
  @override
  Widget build(
      {BuildContext? context,
      Widget child = PlatformButton.defaultText,
      VoidCallback? callback}) {
    return TextButton(onPressed: callback, child: child);
  }
}

class IosButton implements PlatformButton {
  @override
  Widget build(
      {BuildContext? context,
      Widget child = PlatformButton.defaultText,
      VoidCallback? callback}) {
    return CupertinoButton(onPressed: callback, child: child);
  }
}

abstract class PlatformButton {
  static const defaultText = Text("default");
  factory PlatformButton(TargetPlatform targetPlatform) {
    switch (targetPlatform) {
      case TargetPlatform.iOS:
        return IosButton();
      default:
        return AndroidButton();
    }
  }

  Widget build(
      {@required BuildContext context,
      @required Widget child,
      @required VoidCallback callback});
}

abstract class WidgetFactory {
  static Widget buildButton(
      {required BuildContext context,
      required Widget child,
      required VoidCallback callback}) {
    return PlatformButton(Theme.of(context).platform)
        .build(context: context, child: child, callback: callback);
  }
}
