import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'home_view.widgets.dart';

//const overlayDescriptionText =
//  'I have to write some stuff to put in here so that it looks like there\'s something real written here. So lets write some real stuff here. A few weeks ago I concluded the biggest failure of my career. I founded a new startup and poured all my money and energy into it and it failed. The reasons for failure are clear and if you\'d like to hear I can make a video about that. For now that\'s all that I\'ll say.';
//const backgroundImageUrl = 'https://source.unsplash.com/XO5qTnr0a50';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600; // Simple heuristic for mobile
    final isTablet =
        screenSize.width >= 600 && screenSize.width < 1200; // For tablets

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFEE5CA),
        body: ScrollTransformView(
          children: [
            // Upper image section
            ScrollTransformItem(
              builder: (scrollOffset) {
                final offScreenPercentage =
                    (scrollOffset / screenSize.height).clamp(0.0, 1.0);
                final maxHeightReduction = isMobile
                    ? 0.25
                    : isTablet
                        ? 0.20
                        : 0.15;
                final maxWidthReduction = isMobile
                    ? 0.55
                    : isTablet
                        ? 0.45
                        : 0.35;

                return Image.asset(
                  "pictures/my_bee10.jpg",
                  height: screenSize.height -
                      (screenSize.height *
                          maxHeightReduction *
                          offScreenPercentage),
                  width: screenSize.width -
                      (screenSize.width *
                          maxWidthReduction *
                          offScreenPercentage),
                  fit: BoxFit.contain,
                );
              },
              offsetBuilder: (scrollOffset) {
                final offScreenPercentage =
                    (scrollOffset / screenSize.height).clamp(0.0, 1.0);
                final shrinkageOffset = screenSize.height *
                    (isMobile
                        ? 0.25
                        : isTablet
                            ? 0.20
                            : 0.15) *
                    offScreenPercentage;

                final baseOffsetMultiplier = isMobile
                    ? 0.60
                    : isTablet
                        ? 0.65
                        : 0.70;
                final baseOffset = scrollOffset * baseOffsetMultiplier +
                    (shrinkageOffset /
                        (isMobile
                            ? 2.5
                            : isTablet
                                ? 2.8
                                : 3.2));

                return Offset(
                  0,
                  min(
                      baseOffset,
                      screenSize.height *
                          (isMobile
                              ? 0.60
                              : isTablet
                                  ? 0.65
                                  : 0.70)),
                );
              },
            ),

            // Overlay text and image section
            ScrollTransformItem(
              builder: (scrollOffset) {
                final textAppearsThreshold = screenSize.height *
                    (isMobile
                        ? 0.75
                        : isTablet
                            ? 0.70
                            : 0.65);
                final showOverlayImage = scrollOffset >= textAppearsThreshold;

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    OverlayTextSection(
                      scrollOffset: scrollOffset,
                    ),
                    if (showOverlayImage)
                      Positioned(
                        top: screenSize.height *
                            (isMobile
                                ? 0.35
                                : isTablet
                                    ? 0.30
                                    : 0.25), // Responsive positioning
                        child: Image.asset(
                          "pictures/my_bee5.jpg",
                          width: screenSize.width *
                              (isMobile
                                  ? 0.65
                                  : isTablet
                                      ? 0.60
                                      : 0.55),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                  ],
                );
              },
              offsetBuilder: (scrollOffset) => Offset(
                0,
                -scrollOffset *
                    (isMobile
                        ? 1.9
                        : isTablet
                            ? 2.0
                            : 2.1), // Adjusted for screen types
              ),
            ),

            // Bottom section
            ScrollTransformItem(
              builder: (scrollOffset) => BottomSection(),
            ),
          ],
        ),
      ),
    );
  }
}
