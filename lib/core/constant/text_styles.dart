import 'package:base_project/gen/colors.gen.dart';
import 'package:flutter/material.dart';

import 'point_size.dart';
import 'index.dart';

class TextStyles {
  static void initFontSizeCalculation() {
    PointSize.init();
    PointSize.large = SizeConfig.isTabletDevice ? 48 : 32;
    PointSize.h1 = SizeConfig.isTabletDevice ? 38.5 : 22;
  }

  // H1

  static TextStyle getH1BlackRegular() => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h1,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH1Black(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h1,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH1BlackItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h1,
      color: Colors.black87,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  static TextStyle getH1WhiteRegular() => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h1,
      color: Colors.white,
      fontWeight: FontWeight.w500);

  static TextStyle getH1White(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h1,
      color: Colors.white,
      fontWeight: fontWeight);

  static TextStyle getH1WhiteItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h1,
      color: Colors.white,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  //  H2 ------------------

  static TextStyle getH2BlackRegular() => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h2,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH2Black(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h2,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH2BlackItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h2,
      color: Colors.black87,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  static TextStyle getH2WhiteRegular() => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h2,
      color: Colors.white,
      fontWeight: FontWeight.w500);

  static TextStyle getH2White(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h2,
      color: Colors.white,
      fontWeight: fontWeight);

  static TextStyle getH2WhiteItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h2,
      color: Colors.white,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  // H3

  static TextStyle getH3BlackRegular() => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h3,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH3Black(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h3,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH3BlackItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h3,
      color: Colors.black87,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  static TextStyle getH3WhiteRegular() => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h3,
      color: Colors.white,
      fontWeight: FontWeight.w500);

  static TextStyle getH3White(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h3,
      color: Colors.white,
      fontWeight: fontWeight);

  static TextStyle getH3WhiteItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h3,
      color: Colors.white,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  // H4

  static TextStyle getH4BlackRegular() => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h4,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH4Black(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h4,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH4BlackItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h4,
      color: Colors.black87,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  static TextStyle getH4WhiteRegular() => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h4,
      color: Colors.white,
      fontWeight: FontWeight.w500);

  static TextStyle getH4White(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h4,
      color: Colors.white,
      fontWeight: fontWeight);

  static TextStyle getH4WhiteItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h4,
      color: Colors.white,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  // H5

  static TextStyle getH5BlackRegular() => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h5,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH5Black(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h5,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH5BlackItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h5,
      color: Colors.black87,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  static TextStyle getH5WhiteRegular() => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h5,
      color: Colors.white,
      fontWeight: FontWeight.w500);

  static TextStyle getH5White(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h5,
      color: Colors.white,
      fontWeight: fontWeight);

  static TextStyle getH5WhiteItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h5,
      color: Colors.white,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  // H6

  static TextStyle getH6BlackRegular() => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h6,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH6Black(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h6,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH6BlackItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h6,
      color: Colors.black87,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  static TextStyle getH6WhiteRegular() => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h6,
      color: Colors.white,
      fontWeight: FontWeight.w500);

  static TextStyle getH6White(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h6,
      color: Colors.white,
      fontWeight: fontWeight);

  static TextStyle getH6WhiteItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.h6,
      color: Colors.white,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  // Large

  static TextStyle getLargeBlackRegular() => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.large,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getLargeBlack(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.large,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getLargeBlackItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.large,
      color: Colors.black87,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  static TextStyle getLargeWhiteRegular() => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.large,
      color: Colors.white,
      fontWeight: FontWeight.w500);

  static TextStyle getLargeWhite(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.large,
      color: Colors.white,
      fontWeight: fontWeight);

  static TextStyle getLargeWhiteItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: SFLStrings.appFont.helveticaNeueRegular,
      fontSize: PointSize.large,
      color: Colors.white,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  //  Custom

  static TextStyle getH1(
          Color color, FontWeight fontWeight, FontStyle fontStyle) =>
      TextStyle(
          fontFamily: SFLStrings.appFont.helveticaNeueRegular,
          fontSize: PointSize.h1,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle);

  static TextStyle getH2(
          Color color, FontWeight fontWeight, FontStyle fontStyle) =>
      TextStyle(
          fontFamily: SFLStrings.appFont.helveticaNeueRegular,
          fontSize: PointSize.h2,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle);

  static TextStyle getH3(
          Color color, FontWeight fontWeight, FontStyle fontStyle) =>
      TextStyle(
          fontFamily: SFLStrings.appFont.helveticaNeueRegular,
          fontSize: PointSize.h3,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle);

  static TextStyle getH4(
          Color color, FontWeight fontWeight, FontStyle fontStyle) =>
      TextStyle(
          fontFamily: SFLStrings.appFont.helveticaNeueRegular,
          fontSize: PointSize.h4,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle);

  static TextStyle getH5(
          Color color, FontWeight fontWeight, FontStyle fontStyle) =>
      TextStyle(
          fontFamily: SFLStrings.appFont.helveticaNeueRegular,
          fontSize: PointSize.h5,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle);

  static TextStyle getH6(
          Color color, FontWeight fontWeight, FontStyle fontStyle) =>
      TextStyle(
          fontFamily: SFLStrings.appFont.helveticaNeueRegular,
          fontSize: PointSize.h6,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle);

  static TextStyle getLargeText(
          Color color, FontWeight fontWeight, FontStyle fontStyle) =>
      TextStyle(
          fontFamily: SFLStrings.appFont.helveticaNeueRegular,
          fontSize: PointSize.large,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle);

  static InputDecoration getInputDecoration() => InputDecoration(
        filled: true,
        hintText: SFLStrings.hint.kEnterRequiredValue,
        hintStyle: const TextStyle(color: Colors.black38),
        fillColor: ColorName.inputTextBackground,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(26.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorName.primary,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(26.0),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(26.0),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(26.0),
          ),
        ),
      );
}
