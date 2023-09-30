import 'package:get/get.dart';

class TypewriterController extends GetxController {
  var animatedText = ''.obs;
  final String targetText;
  final Duration animationDuration;

  bool _isForward = true;

  TypewriterController(
    this.targetText,
    this.animationDuration,
  );

  @override
  void onInit() {
    super.onInit();
    _startTypingAnimation();
  }

  void _startTypingAnimation() async {
    while (true) {
      if (_isForward) {
        for (int i = 0; i <= targetText.length; i++) {
          animatedText.value = targetText.substring(0, i);
          await Future.delayed(animationDuration);
        }
      } else {
        await Future.delayed(const Duration(seconds: 2));
        for (int i = targetText.length; i >= 0; i--) {
          animatedText.value = targetText.substring(0, i);
          await Future.delayed(animationDuration);
        }
      }
      // Toggle direction
      _isForward = !_isForward;
    }
  }
}
