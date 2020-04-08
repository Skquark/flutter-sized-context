import 'dart:math';

import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

extension SizedContext on BuildContext {
  
  double get pixelsPerInch => UniversalPlatform.isAndroid || UniversalPlatform.isIOS? 150 : 96;
  
  /// Returns same as MediaQuery.of(context)
  MediaQueryData get mq => MediaQuery.of(this);

  /// Returns if Orientation is landscape
  bool get isLandscape => mq.orientation == Orientation.landscape;

  /// Returns same as MediaQuery.of(context).size
  Size get sizePx => mq.size;
  
  /// Returns same as MediaQuery.of(context).size.width
  double get widthPx => sizePx.width;
  
  /// Returns same as MediaQuery.of(context).height
  double get heightPx => sizePx.height;

  /// Returns diagonal screen pixels
  double get diagonalPx {
    final Size s = sizePx;
    return sqrt((s.width * s.width) + (s.height * s.height));
  }

  /// Returns pixel size in Inches
  Size get sizeInches {
    final Size pxSize = sizePx;
    return Size(pxSize.width / pixelsPerInch, pxSize.height / pixelsPerInch);
  }

  /// Returns screen width in Inches
  double get widthInches => sizeInches.width;

  /// Returns screen height in Inches
  double get heightInches => sizeInches.height;

  /// Returns screen diagonal in Inches
  double get diagonalInches => diagonalPx / pixelsPerInch;

  /// Returns fraction (0-1) of screen width in pixels
  double widthPct(double fraction) => fraction * widthPx;
  
  /// Returns fraction (0-1) of screen height in pixels
  double heightPct(double fraction) => fraction * heightPx;

  /// Returns percentage (1-100) of screen width in pixels
  double widthPercent(double percentage) => percentage / 100 * widthPx;
  
  /// Returns percentage (1-100) of screen height in pixels
  double heightPercent(double percentage) => percentage / 100 * heightPx;
  
  /// Ratio multiplier for text size (height / 100)
  double get textSizeMultiplier => heightPx / 100.0;
  
  /// Ratio multiplier for image size (width / 100)
  double get imageSizeMultiplier => widthPx / 100.0;
  
}
  /// Returns the device ScreenType of Mobile, Tablet or Desktop
  ScreenType get screenType {
    double deviceWidth = isLandscape ? heightPx : widthPx;
    if (deviceWidth > 950) return ScreenType.Desktop;
    if (deviceWidth > 600) return ScreenType.Tablet;
    return ScreenType.Mobile;
  }
}

