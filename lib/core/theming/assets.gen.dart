/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Vector.png
  AssetGenImage get vector => const AssetGenImage('assets/images/Vector.png');

  /// File path: assets/images/Vector_down.png
  AssetGenImage get vectorDown =>
      const AssetGenImage('assets/images/Vector_down.png');

  /// File path: assets/images/femail_doc.png
  AssetGenImage get femailDoc =>
      const AssetGenImage('assets/images/femail_doc.png');

  /// File path: assets/images/home_blue_pattern.png
  AssetGenImage get homeBluePattern =>
      const AssetGenImage('assets/images/home_blue_pattern.png');

  /// File path: assets/images/onboarding_doctor.png
  AssetGenImage get onboardingDoctor =>
      const AssetGenImage('assets/images/onboarding_doctor.png');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// File path: assets/images/splash_dark.png
  AssetGenImage get splashDark =>
      const AssetGenImage('assets/images/splash_dark.png');

  /// File path: assets/images/splash_logo_android12.png
  AssetGenImage get splashLogoAndroid12 =>
      const AssetGenImage('assets/images/splash_logo_android12.png');

  /// File path: assets/images/splash_logo_android12_dark.png
  AssetGenImage get splashLogoAndroid12Dark =>
      const AssetGenImage('assets/images/splash_logo_android12_dark.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        vector,
        vectorDown,
        femailDoc,
        homeBluePattern,
        onboardingDoctor,
        splash,
        splashDark,
        splashLogoAndroid12,
        splashLogoAndroid12Dark
      ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/docdoc_logo_low_opacity.svg
  SvgGenImage get docdocLogoLowOpacity =>
      const SvgGenImage('assets/svg/docdoc_logo_low_opacity.svg');

  /// File path: assets/svg/general_speciality.svg
  SvgGenImage get generalSpeciality =>
      const SvgGenImage('assets/svg/general_speciality.svg');

  /// File path: assets/svg/home-hedder-bell.svg
  SvgGenImage get homeHedderBell =>
      const SvgGenImage('assets/svg/home-hedder-bell.svg');

  /// File path: assets/svg/icon.svg
  SvgGenImage get icon => const SvgGenImage('assets/svg/icon.svg');

  /// File path: assets/svg/notifications.svg
  SvgGenImage get notifications =>
      const SvgGenImage('assets/svg/notifications.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        docdocLogoLowOpacity,
        generalSpeciality,
        homeHedderBell,
        icon,
        notifications
      ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
