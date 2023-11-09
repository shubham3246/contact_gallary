import 'package:responsive_framework/responsive_breakpoints.dart';

double getAppbarTitleSize(context) {
  final bool isMobile = ResponsiveBreakpoints.of(context).equals("MOBILE");
  final bool isTab7 = ResponsiveBreakpoints.of(context).equals("TAB7");
  final bool isTab10 = ResponsiveBreakpoints.of(context).equals("TAB10");

  double size = 18;
  if (isMobile)
    size = 18;
  else if (isTab7)
    size = 24;
  else if (isTab10) size = 32;

  return size;
}
