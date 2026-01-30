import 'package:flutter/material.dart';

// 2. Responsive Utilities (lib/utils/responsive.dart)
// Requirements:
// Define breakpoint constants for tablet (600) and desktop (900)
// Create a Responsive class with static methods for layout decisions

class Responsive {
  // Define breakpoint constants
  static const double tabletBreakpoint = 600;
  static const double desktopBreakpoint = 900;

  // Helper method to determine if the device is in portrait mode
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  // Helper method to get screen padding based on width
  // Returns larger padding for smaller screens to ensure content doesn't touch edges
  static EdgeInsets getScreenPadding(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < tabletBreakpoint) {
      return const EdgeInsets.all(16.0);
    } else {
      return const EdgeInsets.all(8.0);
    }
  }

  // Static methods to determine device type based on width
  static bool isMobile(double width) => width < tabletBreakpoint;
  static bool isTablet(double width) => width >= tabletBreakpoint && width < desktopBreakpoint;
  static bool isDesktop(double width) => width >= desktopBreakpoint;

  // Calculate the number of columns for GridView based on screen width
  // Mobile: 1 column (ListView effectively)
  // Tablet: 2 columns
  // Desktop: 3 columns
  static int getColumnCount(double width) {
    if (isMobile(width)) return 1;
    if (isTablet(width)) return 2;
    return 3;
  }
}
