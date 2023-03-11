import 'package:flutter/material.dart';

mixin GlobalVariables {
  late BuildContext ctx;

  double get _textScaleFactor {
    return MediaQuery.textScaleFactorOf(ctx);
  }

  TextStyle _buildTextStyle(double fontSize) {
    return TextStyle(fontSize: fontSize * _textScaleFactor);
  }

  TextStyle getTextStyle({required TextStyleType styleType}) {
    switch (styleType) {
      case (TextStyleType.header):
        {
          return _buildTextStyle(18);
        }
        break;
      case (TextStyleType.quote):
        {
          return _buildTextStyle(20);
        }
        break;
      case (TextStyleType.quoteAuthor):
        {
          return _buildTextStyle(16.5);
        }
        break;
      case (TextStyleType.button):
        {
          return _buildTextStyle(17);
        }
        break;
      case (TextStyleType.error):
        {
          return _buildTextStyle(17);
        }
        break;
      default:
        {
          return _buildTextStyle(16);
        }
        break;
    }
  }
}

enum TextStyleType { header, quote, quoteAuthor, button, error }
