import 'package:get/get.dart';

///  current Screen width 392.72727272727275
///  current Screen height 737.4545454545455

/// height factor = screenHeight/currentHeightValue
/// height factor = screenWidth/currentWidthValue
class AppDimension {
  /// 0
  static const zero = 0.0;

  ///  current Screen height
  static double screenHeight = Get.context!.height;

  ///  current Screen width
  static double screenWidth = Get.context!.width;

  /// 40
  static double width40 = screenWidth / 9.818;

  /// 25
  static double width25 = screenWidth / 15.709;

  /// 20
  static double width20 = screenWidth / 19.63;

  /// 15
  static double width15 = screenWidth / 26.18;

  /// 10
  static double width10 = screenWidth / 39.27;

  /// 12
  static double width12 = screenWidth / 32.727;

  /// 5
  static double width5 = screenWidth / 78.545;

  /// 15
  static double height5 = screenHeight / 147.49;

  /// 10
  static double height10 = screenHeight / 73.745;

  /// 15
  static double height15 = screenHeight / 49.16;

  /// 20
  static double height20 = screenHeight / 36.87;

  /// 30
  static double height30 = screenHeight / 24.58;

  /// 40
  static double height40 = screenHeight / 18.436;

  /// 100
  static double height100 = screenHeight / 7.374;

  /// 120
  static double height120 = screenHeight / 6.145;

  /// 140
  static double height140 = screenHeight / 5.268;

  /// 200
  static double height200 = screenHeight / 3.685;

  /// 270
  static double height270 = screenHeight / 2.73;

  /// 300
  static double height300 = screenHeight / 2.458;

  /// 350
  static double height350 = screenHeight / 2.107;

  /// 440
  static double height440 = screenHeight / 1.676;

  /// 33
  static double font33 = screenWidth / 11.9;
}
