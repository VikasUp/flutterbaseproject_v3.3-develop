import 'package:flutter/widgets.dart';

import 'index.dart';

class SizeConfig {
  SizeConfig._();
  static final SizeConfig _instance = SizeConfig._();

  factory SizeConfig() => _instance;

  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late bool isTabletDevice;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double safeAreaHorizontal;
  static late double safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    safeBlockHorizontal = (screenWidth - safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - safeAreaVertical) / 100;

    isTabletDevice = ((_mediaQueryData.orientation == Orientation.portrait)
                ? screenWidth
                : screenHeight) >
            700
        ? true
        : false;

    // To manage font size
    TextStyles.initFontSizeCalculation();
  }

  static double getScaledValue(double value, BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return (value * _mediaQueryData.textScaleFactor);
  }
}
