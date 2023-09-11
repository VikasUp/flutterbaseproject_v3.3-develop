/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/avatar_logo.png
  AssetGenImage get avatarLogo =>
      const AssetGenImage('assets/images/avatar_logo.png');

  /// File path: assets/images/placeholder_image.png
  AssetGenImage get placeholderImage =>
      const AssetGenImage('assets/images/placeholder_image.png');

  /// File path: assets/images/splash_screen_image.png
  AssetGenImage get splashScreenImage =>
      const AssetGenImage('assets/images/splash_screen_image.png');

  /// File path: assets/images/sunflower.png
  AssetGenImage get sunflower =>
      const AssetGenImage('assets/images/sunflower.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [avatarLogo, placeholderImage, splashScreenImage, sunflower];
}

class $AssetsMockGen {
  const $AssetsMockGen();

  /// File path: assets/mock/accountInfo.json
  String get accountInfo => 'assets/mock/accountInfo.json';

  /// File path: assets/mock/authentication.json
  String get authentication => 'assets/mock/authentication.json';

  /// File path: assets/mock/country_code.json
  String get countryCode => 'assets/mock/country_code.json';

  /// File path: assets/mock/division_response.json
  String get divisionResponse => 'assets/mock/division_response.json';

  /// File path: assets/mock/failure.json
  String get failure => 'assets/mock/failure.json';

  /// File path: assets/mock/register_finish.json
  String get registerFinish => 'assets/mock/register_finish.json';

  /// File path: assets/mock/register_init.json
  String get registerInit => 'assets/mock/register_init.json';

  /// File path: assets/mock/save_response.json
  String get saveResponse => 'assets/mock/save_response.json';

  /// File path: assets/mock/sfl_users.json
  String get sflUsers => 'assets/mock/sfl_users.json';

  /// File path: assets/mock/teams_response.json
  String get teamsResponse => 'assets/mock/teams_response.json';

  /// File path: assets/mock/update_profile.json
  String get updateProfile => 'assets/mock/update_profile.json';

  /// File path: assets/mock/user_model.json
  String get userModel => 'assets/mock/user_model.json';

  /// List of all assets
  List<String> get values => [
        accountInfo,
        authentication,
        countryCode,
        divisionResponse,
        failure,
        registerFinish,
        registerInit,
        saveResponse,
        sflUsers,
        teamsResponse,
        updateProfile,
        userModel
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsMockGen mock = $AssetsMockGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
