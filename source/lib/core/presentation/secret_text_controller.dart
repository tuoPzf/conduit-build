import 'package:flutter/material.dart';

/// A [TextEditingController] that hides its text by rendering bullets itself,
/// instead of using the platform password input type.
///
/// Android ROMs such as MIUI/HyperOS and EMUI/HarmonyOS force their own
/// "secure keyboard" whenever an editor is marked as a password field, which
/// blocks third-party IMEs and Chinese input. Rendering the mask in Dart keeps
/// the platform input type as plain text so the user's own keyboard is used.
class SecretTextController extends TextEditingController {
  SecretTextController({super.text});

  bool _hidden = true;

  bool get hidden => _hidden;

  set hidden(bool value) {
    if (_hidden == value) {
      return;
    }
    _hidden = value;
    notifyListeners();
  }

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    if (!_hidden) {
      return super.buildTextSpan(
        context: context,
        style: style,
        withComposing: withComposing,
      );
    }
    return TextSpan(style: style, text: '\u2022' * value.text.length);
  }
}
