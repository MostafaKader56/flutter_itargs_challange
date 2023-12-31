import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class NoInternetErrorWidget extends StatefulWidget {
  const NoInternetErrorWidget({super.key});

  @override
  State<NoInternetErrorWidget> createState() => _NoInternetErrorWidgetState();
}

class _NoInternetErrorWidgetState extends State<NoInternetErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            // width: 150.0,
            // height: 150.0,
            decoration: const BoxDecoration(
              color: Colors.redAccent,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.wifi_off, // You can use any other suitable icon
              size: 20.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 1.0),
          Text(
            S.current.error,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 1.0),
          Text(
            S.current.oops,
            style: const TextStyle(
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    // return Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       Icon(
    //         Icons.signal_wifi_off, // You can use any other suitable icon
    //         size: 80.0,
    //         color: Colors.red, // Customize the color
    //       ),
    //       SizedBox(height: 16.0),
    //       Text(
    //         'No Internet Connection',
    //         style: TextStyle(
    //           fontSize: 20.0,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //       SizedBox(height: 8.0),
    //       Text(
    //         'Please check your internet connection and try again.',
    //         style: TextStyle(
    //           fontSize: 16.0,
    //           color: Colors.grey,
    //         ),
    //         textAlign: TextAlign.center,
    //       ),
    //       // SizedBox(height: 16.0),
    //       // ElevatedButton(
    //       //   onPressed: () {
    //       //     // You can add logic to retry the action when the button is pressed.
    //       //   },
    //       //   child: Text('Retry'),
    //       // ),
    //     ],
    //   ),
    // );
  }
}

// class _NoInternetErrorWidgetState extends State<NoInternetErrorWidget>
//     with TickerProviderStateMixin {
//   late AnimationController firstController;
//   late Animation<double> firstAnimation;
//   late AnimationController secondController;
//   late Animation<double> secondAnimation;
//   late AnimationController thirdController;
//   late Animation<double> thirdAnimation;
//   late AnimationController fourthController;
//   late Animation<double> fourthAnimation;
//   @override
//   void initState() {
//     super.initState();
//     firstController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1),
//     );
//     firstAnimation = Tween<double>(begin: .37, end: .3).animate(
//         CurvedAnimation(parent: firstController, curve: Curves.easeInOut))
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           firstController.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           firstController.forward();
//         }
//       });
//     secondController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1),
//     );
//     secondAnimation = Tween<double>(begin: .5, end: .41).animate(
//         CurvedAnimation(parent: secondController, curve: Curves.easeInOut))
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           secondController.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           secondController.forward();
//         }
//       });
//     thirdController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1),
//     );
//     thirdAnimation = Tween<double>(begin: .63, end: .52).animate(
//         CurvedAnimation(parent: thirdController, curve: Curves.easeInOut))
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           thirdController.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           thirdController.forward();
//         }
//       });
//     fourthController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1),
//     );
//     fourthAnimation = Tween<double>(begin: .76, end: .63).animate(
//         CurvedAnimation(parent: fourthController, curve: Curves.easeInOut))
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           fourthController.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           fourthController.forward();
//         }
//       });
//     firstController.forward();
//     secondController.forward();
//     thirdController.forward();
//     fourthController.forward();
//   }

//   @override
//   void dispose() {
//     firstController.dispose();
//     secondController.dispose();
//     thirdController.dispose();
//     fourthController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Scaffold(
//         backgroundColor: Color(0xFF6101EB),
//         body: Center(
//           child: CustomPaint(
//             painter: DrawPath(
//               firstAnimation.value,
//               secondAnimation.value,
//               thirdAnimation.value,
//               fourthAnimation.value,
//             ),
//             child: SizedBox(
//               height: 250,
//               width: 210,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DrawPath extends CustomPainter {
//   final double height1;
//   final double height2;
//   final double height3;
//   final double height4;
//   DrawPath(
//     this.height1,
//     this.height2,
//     this.height3,
//     this.height4,
//   );
//   @override
//   void paint(Canvas canvas, Size size) {
//     Color designColor = Color(0xffEAEEF0);
//     Paint firstPaint = Paint()
//       ..color = designColor
//       ..strokeCap = StrokeCap.round
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 25;
//     Paint secondPaint = Paint()
//       ..color = designColor
//       ..style = PaintingStyle.fill;
//     Path firstPath = Path();
//     firstPath.moveTo(0, size.height * height1);
//     firstPath.arcToPoint(
//       Offset(size.width, size.height * height1),
//       radius: Radius.circular(135),
//     );
//     canvas.drawPath(firstPath, firstPaint);
//     Path secondPath = Path();
//     secondPath.moveTo(size.width * .16, size.height * height2);
//     secondPath.arcToPoint(
//       Offset(size.width * .84, size.height * height2),
//       radius: Radius.circular(90),
//     );
//     canvas.drawPath(secondPath, firstPaint);
//     Path thirdPath = Path();
//     thirdPath.moveTo(size.width * .33, size.height * height3);
//     thirdPath.arcToPoint(
//       Offset(size.width * .67, size.height * height3),
//       radius: Radius.circular(43),
//     );
//     canvas.drawPath(thirdPath, firstPaint);
//     canvas.drawCircle(
//         Offset(size.width * .5, size.height * height4), 17, secondPaint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
