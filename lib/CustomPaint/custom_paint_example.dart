import 'package:flutter/material.dart';

class CustomPaintExampleScreen extends StatefulWidget {
  const CustomPaintExampleScreen({Key? key}) : super(key: key);

  @override
  State<CustomPaintExampleScreen> createState() => _CustomPaintExampleScreenState();
}

class _CustomPaintExampleScreenState extends State<CustomPaintExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Opacity(opacity: 0.5,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: Colors.deepOrangeAccent,
                height: 200,
              ),
            ),),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 3, size.height);
    var firstEnd = Offset(size.width / 2, size.height - 60);
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - (size.width / 3), size.height - 40);
    var secondEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(secondStart.dx, secondStart.dx, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
  
}
