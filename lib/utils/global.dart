import 'package:flutter/material.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/appointment_screen.dart';
import 'package:healtether_clinic_app/Screens/ChatScreen/chat_screen.dart';
import 'package:healtether_clinic_app/Screens/HomeScreen/homescreen.dart';
import 'package:healtether_clinic_app/Screens/Notification/screen/notifications_screen.dart';


List<Widget> HomeScreenItems = [
  const HomeScreen(),
  const AppointmentScreen(),
  const ChatScreen(),
  const NotificationScreen()
];

PageRouteBuilder createRoute(Widget screen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.linear;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      var opacityAnimation = tween.animate(animation);

      return FadeTransition(
        opacity: opacityAnimation,
        child: child,
      );
    },
  );
}
