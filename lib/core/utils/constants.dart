import 'package:flutter/material.dart';

class Constants {
  static String kindIsTrip = 'kindIsTrip';
  static String tripsSectionIdForRealtimeDatabase = 'trips';
  static String tripsReservationIdForFirestore = 'TripReservations';

  static String kindIsCourse = 'kindIsCourse';
  static String coursesSectionIdForRealtimeDatabase = 'courses';
  static String coursesReservationIdForFirestore = 'CourseReservations';

  static var isInternetConnectionOn = false;
  // static const Color kPrimaryColor = Color(0xffed1c23);
  static const Color kPrimaryColor = Color(0xff3A5641);
  static const Color kBlueColor = Color(0xff1E90FF);
  static const Color homePageBottomNavigationBackColor = Color(0xffF3EEF4);
  static const Color kHomeViewDrawerBackColor = Colors.indigoAccent;
  static Color kButtunDisableBackColor = const Color(0xffD9D9D9);
  static Color kButtunDisableTextColor = const Color(0xffB3B3B3);
  static Color kCardGrayBackGroundColor = Colors.white;
  static Color kCardDarkGrayBackGroundColor = const Color(0xff686868);
  static Color kReadMoreButtonTextColor = const Color(0xff3763FF);
  static Color kWishListCardsectionTitleColor = const Color(0xff808080);
  static Color kMainPageBackColor = const Color(0xfff4f4f4);
  static String kBeforeServerConnectionErrorResponseKey =
      'beforeServerConnection';
  static String kUnauthenticatedErrorResponseKey =
      'unauthenticatedErrorResponseKey';
  static String token = '';

  static Color kSearchTextFieldFillColor = const Color(0xffF0F0F0);

  static BoxDecoration splashBoxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff0A2463),
        Color(0xff1FA2FF),
      ],
    ),
  );
}

/*
    Light Theme Gradient Pairs:

    Light Blue Gradient:
        Starting Color: #ADD8E6
        Ending Color: #87CEEB

    Sunset Gradient:
        Starting Color: #FFA500
        Ending Color: #FF6347

    Ocean Gradient:
        Starting Color: #00BFFF
        Ending Color: #1E90FF

    Forest Gradient:
        Starting Color: #008000
        Ending Color: #008080

    Sunrise Gradient:
        Starting Color: #FFFF00
        Ending Color: #FFD700

    Lavender Gradient:
        Starting Color: #800080
        Ending Color: #8A2BE2

    Beach Gradient:
        Starting Color: #FFD700
        Ending Color: #20B2AA

    Desert Gradient:
        Starting Color: #FFD700
        Ending Color: #FF4500

    Coral Gradient:
        Starting Color: #FF0000
        Ending Color: #FF6A6A

    Arctic Gradient:
        Starting Color: #B0E0E6
        Ending Color: #4682B4

Dark Theme Gradient Pairs:

    Dark Blue Gradient:
        Starting Color: #00008B
        Ending Color: #0000CD

    Fire Gradient:
        Starting Color: #FF4500
        Ending Color: #FF0000

    Midnight Gradient:
        Starting Color: #191970
        Ending Color: #000080

    Deep Forest Gradient:
        Starting Color: #008080
        Ending Color: #006400

    Nightfall Gradient:
        Starting Color: #FFD700
        Ending Color: #FFFF00

    Violet Gradient:
        Starting Color: #8A2BE2
        Ending Color: #9400D3

    Dark Coral Gradient:
        Starting Color: #FF6A6A
        Ending Color: #FF3030

    Midnight Blue Gradient:
        Starting Color: #191970
        Ending Color: #00008B

    Deep Arctic Gradient:
        Starting Color: #00008B
        Ending Color: #4B0082

    Charcoal Gradient:
        Starting Color: #808080
        Ending Color: #696969
*/

/*
    Ocean Blue Gradient:
        Dark Blue: #0A2463
        Light Blue: #1FA2FF

    Sunset Gradient:
        Sunset Orange: #FFAA00
        Deep Red: #FF3D00

    Coral Reef Gradient:
        Coral Pink: #FF6B6B
        Sea Green: #64DD17

    Deep Sea Gradient:
        Deep Ocean Blue: #071E3D
        Midnight Black: #000000

    Tropical Gradient:
        Turquoise Blue: #4ECDC4
        Sunny Yellow: #F7FF58

    Underwater Cave Gradient:
        Dark Cave Brown: #533A71
        Crystal Blue: #00A5CF

    Mystical Abyss Gradient:
        Abyssal Black: #000000
        Electric Blue: #00FFFF

    Seashore Gradient:
        Sandy Beige: #F0E68C
        Aqua Blue: #00CED1

    Jellyfish Gradient:
        Transparent White: #FFFFFF
        Jellyfish Purple: #800080

    Golden Treasure Gradient:
        Shiny Gold: #FFD700
        Deep Sea Blue: #001F3F
*/
