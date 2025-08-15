import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;

  const Navbar({
    super.key,
    this.onHomeTap,
    this.onLeftTap,
    this.onRightTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            size: const Size(double.infinity, 80),
            painter: NavBarPainter(),
          ),
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: onLeftTap,
                  child: _navItem(Icons.notifications_none, "Notifications"),
                ),
                const SizedBox(width: 80), // espacio para Pokéball
                GestureDetector(
                  onTap: onRightTap,
                  child: _navItem(Icons.person_outline, "User"),
                ),
              ],
            ),
          ),
          // Pokéball encima de la curva
          Positioned(
            top: -35,
            left: MediaQuery.of(context).size.width / 2 - 35,
            child: InkWell(
              onTap: onHomeTap,
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset(
                      "lib/features/data/assets/pokeball.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Home',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

class NavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.black87, Colors.black54],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.35, 0);

    // Curva hacia afuera para cubrir Pokébola
    path.quadraticBezierTo(
      size.width * 0.40, 0,
      size.width * 0.42, -20,
    );
    path.arcToPoint(
      Offset(size.width * 0.58, -20),
      radius: const Radius.circular(40),
      clockwise: true,
    );
    path.quadraticBezierTo(
      size.width * 0.60, 0,
      size.width * 0.65, 0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
