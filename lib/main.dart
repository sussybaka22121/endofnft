import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.jpeg'),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavItem(title: "PUMP.FUN", url: "https://pump.fun"),
                  NonClickableNavItemWithHover(
                    title: "DEXSCREENER",
                    hoverText: "AFTER GRADUATION",
                  ),
                  NavItem(
                    title: "OUR STORY",
                    url: "https://x.com/IcedKnife/status/1892332670056575224",
                  ),
                ],
              ),
            ),
            AnimatedBuyNowButton(url: "https://raydium.io/swap"),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage('assets/images/NFTEND.gif'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.red.withOpacity(0.3),
                        BlendMode.overlay,
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 40,
                        top: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MenuLink(
                              title: "HOME",
                              url: "https://endofnft.netlify.app/",
                            ),
                            SizedBox(height: 20),
                            NonClickableMenuLinkWithHover(
                              title: "DEXSCREENER",
                              hoverText: "AFTER GRADUATION",
                            ),
                            SizedBox(height: 20),
                            MenuLink(
                              title: "CHART",
                              url: "https://pump.fun/board",
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 40,
                        bottom: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "[SOCIALS]",
                              style: GoogleFonts.orbitron(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 1.5,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                SocialIconButton(
                                  imagePath: 'assets/images/website.webp',
                                  label: "",
                                  url: 'https://endofnft.netlify.app/',
                                ),
                                SizedBox(width: 10),
                                SocialIconButton(
                                  imagePath: 'assets/images/x.webp',
                                  label: "",
                                  url: 'https://x.com/EndofSOLNFTs',
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                SocialIconButton(
                                  imagePath: 'assets/images/pumpfun.webp',
                                  label: "",
                                  url: 'https://pump.fun',
                                ),
                                SizedBox(width: 10),
                                NonClickableSocialIconWithHover(
                                  imagePath: 'assets/images/dexscreener.webp',
                                  hoverText: "AFTER GRADUATION",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border(
                      top: BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "2025 © ALL RIGHTS RESERVED",
                          style: GoogleFonts.orbitron(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Don’t be sad it’s over, Be happy that it happened. This is the END of NFTS",
                          style: GoogleFonts.orbitron(
                            color: Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final String url;

  const NavItem({required this.title, required this.url});

  Future<void> _launchURL() async {
    if (url.isEmpty) return;
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          title,
          style: GoogleFonts.orbitron(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class NonClickableNavItemWithHover extends StatefulWidget {
  final String title;
  final String hoverText;

  const NonClickableNavItemWithHover({
    required this.title,
    required this.hoverText,
  });

  @override
  _NonClickableNavItemWithHoverState createState() =>
      _NonClickableNavItemWithHoverState();
}

class _NonClickableNavItemWithHoverState
    extends State<NonClickableNavItemWithHover> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          isHovering ? widget.hoverText : widget.title,
          style: GoogleFonts.orbitron(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class MenuLink extends StatelessWidget {
  final String title;
  final String url;

  const MenuLink({required this.title, required this.url});

  Future<void> _launchURL() async {
    if (url.isEmpty) return;
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      child: Text(
        title,
        style: GoogleFonts.orbitron(
          color: Colors.white,
          fontSize: 32,
          letterSpacing: 2.0,
        ),
      ),
    );
  }
}

class NonClickableMenuLinkWithHover extends StatefulWidget {
  final String title;
  final String hoverText;

  const NonClickableMenuLinkWithHover({
    required this.title,
    required this.hoverText,
  });

  @override
  _NonClickableMenuLinkWithHoverState createState() =>
      _NonClickableMenuLinkWithHoverState();
}

class _NonClickableMenuLinkWithHoverState
    extends State<NonClickableMenuLinkWithHover> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: Text(
        isHovering ? widget.hoverText : widget.title,
        style: GoogleFonts.orbitron(
          color: Colors.white,
          fontSize: 32,
          letterSpacing: 2.0,
        ),
      ),
    );
  }
}

class AnimatedBuyNowButton extends StatefulWidget {
  final String url;

  const AnimatedBuyNowButton({required this.url});

  @override
  _AnimatedBuyNowButtonState createState() => _AnimatedBuyNowButtonState();
}

class _AnimatedBuyNowButtonState extends State<AnimatedBuyNowButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _launchURL() async {
    if (widget.url.isEmpty) return;
    final Uri uri = Uri.parse(widget.url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch ${widget.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: TextButton(
              onPressed: _launchURL,
              child: Text(
                "BUY NOW",
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SocialIconButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final String url;

  const SocialIconButton({
    required this.imagePath,
    required this.label,
    required this.url,
  });

  Future<void> _launchURL() async {
    if (url.isEmpty) return;
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.white24, width: 1),
        ),
        child: Center(
          child:
              label.isEmpty
                  ? Image.asset(imagePath, width: 20, height: 20)
                  : Text(
                    label,
                    style: GoogleFonts.orbitron(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
        ),
      ),
    );
  }
}

class NonClickableSocialIconWithHover extends StatefulWidget {
  final String imagePath;
  final String hoverText;

  const NonClickableSocialIconWithHover({
    required this.imagePath,
    required this.hoverText,
  });

  @override
  _NonClickableSocialIconWithHoverState createState() =>
      _NonClickableSocialIconWithHoverState();
}

class _NonClickableSocialIconWithHoverState
    extends State<NonClickableSocialIconWithHover> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.white24, width: 1),
        ),
        child: Center(
          child:
              isHovering
                  ? Text(
                    widget.hoverText,
                    style: GoogleFonts.orbitron(
                      color: Colors.white70,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
                  : Image.asset(widget.imagePath, width: 20, height: 20),
        ),
      ),
    );
  }
}

class CapsuleButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Widget? child;
  final LinearGradient gradient;
  final double width;
  final String url;

  const CapsuleButton({
    required this.label,
    this.icon,
    this.child,
    required this.gradient,
    required this.width,
    required this.url,
  });

  Future<void> _launchURL() async {
    if (url.isEmpty) return;
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white24, width: 1),
        ),
        child: Center(
          child:
              child ??
              (icon != null
                  ? Icon(icon, color: Colors.white, size: 24)
                  : Text(
                    label,
                    style: GoogleFonts.orbitron(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  )),
        ),
      ),
    );
  }
}
