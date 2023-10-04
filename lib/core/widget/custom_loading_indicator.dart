import 'dart:math';

import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatefulWidget {
  const CustomLoadingIndicator({super.key, this.size = 65});

  final double size;
  @override
  State<CustomLoadingIndicator> createState() => _CustomLoadingIndicatorState();
}

class _CustomLoadingIndicatorState extends State<CustomLoadingIndicator>
    with TickerProviderStateMixin {
  late AnimationController firstController;
  late Animation<double> firstAnimation;

  late AnimationController secondController;
  late Animation<double> secondAnimation;

  @override
  void initState() {
    super.initState();

    firstController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    firstAnimation = Tween<double>(begin: -pi, end: pi).animate(firstController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          firstController.forward();
        }
      });

    secondController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    secondAnimation = Tween<double>(begin: -1, end: -4).animate(
      CurvedAnimation(
        parent: secondController,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          secondController.forward();
        }
      });

    firstController.forward();
    secondController.forward();
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: widget.size,
        width: widget.size,
        child: CustomPaint(
          painter: MyCustomPainter(
            firstAnimation.value,
            secondAnimation.value,
          ),
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  final double startAngle;
  final double sweepAngle;
  MyCustomPainter(this.startAngle, this.sweepAngle);
  @override
  void paint(Canvas canvas, Size size) {
    Paint myCircle = Paint()
      ..color = const Color(0xffCFCDF6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawCircle(
      Offset(size.width * .5, size.height * .5),
      size.width * .5,
      myCircle,
    );
    Paint myArc = Paint()
      ..color = const Color(0xff420097)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromLTRB(0, 0, size.width, size.height),
      startAngle,
      sweepAngle,
      false,
      myArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
