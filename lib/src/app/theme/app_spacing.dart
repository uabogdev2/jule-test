import 'package:flutter/material.dart';

class AppSpacing {
  // General spacing units
  static const double xxs = 4.0;
  static const double xs = 8.0;
  static const double sm = 12.0;
  static const double md = 16.0; // Base spacing unit
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  // Specific use cases (can be expanded)
  static const EdgeInsets screenPadding = EdgeInsets.all(md);
  static const EdgeInsets cardPadding = EdgeInsets.all(sm);
  static const EdgeInsets dialogPadding = EdgeInsets.all(lg);

  // Gaps
  static const SizedBox gapHxxs = SizedBox(width: xxs);
  static const SizedBox gapHxs = SizedBox(width: xs);
  static const SizedBox gapHsm = SizedBox(width: sm);
  static const SizedBox gapHmd = SizedBox(width: md);
  static const SizedBox gapHlg = SizedBox(width: lg);
  static const SizedBox gapHxl = SizedBox(width: xl);
  static const SizedBox gapHxxl = SizedBox(width: xxl);

  static const SizedBox gapVxxs = SizedBox(height: xxs);
  static const SizedBox gapVxs = SizedBox(height: xs);
  static const SizedBox gapVsm = SizedBox(height: sm);
  static const SizedBox gapVmd = SizedBox(height: md);
  static const SizedBox gapVlg = SizedBox(height: lg);
  static const SizedBox gapVxl = SizedBox(height: xl);
  static const SizedBox gapVxxl = SizedBox(height: xxl);
}
