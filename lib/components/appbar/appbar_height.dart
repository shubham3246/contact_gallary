import 'package:responsive_framework/responsive_breakpoints.dart';

double getAppbarHeight(context) {
  final bool isMobile = ResponsiveBreakpoints.of(context).equals("MOBILE");
  final bool isTab7 = ResponsiveBreakpoints.of(context).equals("TAB7");
  final bool isTab10 = ResponsiveBreakpoints.of(context).equals("TAB10");

  double height = 60;
  if (isMobile)
    height = 60;
  else if (isTab7)
    height = 90;
  else if (isTab10) height = 120;

  return height;
}
