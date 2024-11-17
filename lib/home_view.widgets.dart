part of 'home_view.dart';

const overlayDescriptionText =
    "My darling, from the moment we met, you\'ve been my sunshine. Your kindness, beauty, and spirit captivate me every day. You\'re not just my girlfriend, but my partner in every sense – my rock, my confidante, my forever love. I cherish our laughter, adventures, and quiet moments together. Forever with you is where I want to be.";

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // Calculate font size based on screen width, capping at 60
    double calculatedFontSize = (screenSize.width * 0.08)
        .clamp(20, 60); // Adjust the multiplier (0.08) as needed

    return Container(
      height: screenSize.height,
      width: screenSize.width,
      color: const Color(0xffB10D31),
      child: Stack(
        children: [
          Positioned.fill(
            top: -50,
            child: Center(
              child: Text(
                "YOU ARE LOVED.\nA TREASURE TO ME.\nSOMETIMES LIFE GETS TOUGH\nBUT WITH YOU, I'M STRONGER\nTOGETHER, WE'LL FIND OUR WAY",
                textAlign: TextAlign.center,
                style: GoogleFonts.biryani(
                  color: Colors.black,
                  fontSize: calculatedFontSize, // Use the calculated font size
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OverlayTextSection extends StatelessWidget {
  final double scrollOffset; // Pass scrollOffset for dynamic adjustments
  const OverlayTextSection({
    Key? key,
    required this.scrollOffset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Determine when to show the additional image
    final bool showAdditionalImage = scrollOffset > screenSize.height * 0.8;

    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: Stack(
        children: [
          const _TitleText(
            text: 'ARA',
            top: 100,
            left: 50,
          ),
          const _TitleText(
            text: 'TEMI',
            top: 260,
            left: 20,
          ),
          const _TitleText(
            text: 'NIKAN',
            top: 420,
            left: 220,
          ),
          const Positioned(
            right: 50,
            top: 170,
            child: SizedBox(
              width: 470,
              child: Text(
                overlayDescriptionText,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          // Dynamically displayed additional image
          if (showAdditionalImage)
            Positioned(
              top: screenSize.height * 0.4, // Adjust positioning
              left: screenSize.width * 0.2, // Adjust positioning
              child: Image.asset(
                'pictures/my_bee5.jpg', // Replace with your image path
                height: screenSize.height * 0.3, // Adjust size
                width: screenSize.width * 0.5, // Adjust size
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  final double? top;
  final double? left;
  final String text;
  const _TitleText({
    Key? key,
    required this.text,
    this.top,
    this.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    // Calculate font size based on screen width, maxing out at 200
    final fontSize = screenWidth < 600
        ? 80
        : // Mobile
        screenWidth < 1200
            ? 140
            : // Tablet/Laptop
            screenWidth < 1800
                ? 180
                : 200; // Desktop, max out at 200

    return Positioned(
      top: top?.toDouble(),
      left: left?.toDouble(),
      child: Text(
        text,
        style: GoogleFonts.fascinate(
            fontSize: fontSize.toDouble(),
            fontWeight: FontWeight.w900,
            color: Colors.black),
      ),
    );
  }
}
