import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:healtether_clinic_app/utils/global.dart';

class HomePageView extends StatefulWidget {
  int selectedIndex;

   HomePageView({super.key,required this.selectedIndex});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int _page = 0;
  final PageController _pageController = PageController();
  final NotchBottomBarController _notchBottomBarController = NotchBottomBarController();

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void onPageChanged(int page) {
    setState(() {
      _page = page;
      _notchBottomBarController.index = page;
    });
  }


  @override
  void initState() {
    _page = widget.selectedIndex;
    _notchBottomBarController.index =  widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: HomeScreenItems,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _notchBottomBarController,
        color: const Color(0xffA1EBD6),
        showBlurBottomBar: false,
        notchColor: const  Color(0xffA1EBD6),
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: SizedBox(
              width: 10.0,
              height: 10.0,
              child: ImageIcon(
                AssetImage('assets/homeimages/Home.png'),
                color: Color(0xff03BF9C),
              ),
            ),
            activeItem: SizedBox(
              width: 10.0,
              height: 10.0,
              child: ImageIcon(
                AssetImage('assets/homeimages/Home.png'),
                color: Colors.black,
              ),
            ),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: SizedBox(
              width: 10.0,
              height: 10.0,
              child: ImageIcon(
                AssetImage('assets/homeimages/Calender.png'),
                color: Color(0xff03BF9C),
              ),
            ),
            activeItem: SizedBox(
              width: 10.0,
              height: 10.0,
              child: ImageIcon(
                AssetImage('assets/homeimages/Calender.png'),
                color: Colors.black,
              ),
            ),
            itemLabel: 'Appointments',
          ),
          BottomBarItem(
            inActiveItem: SizedBox(
              width: 10.0,
              height: 10.0,
              child: ImageIcon(
                AssetImage('assets/homeimages/whatsapp12.png'),
                color: Color(0xff03BF9C),
              ),
            ),
            activeItem: SizedBox(
              width: 10.0,
              height: 10.0,
              child: ImageIcon(
                AssetImage('assets/homeimages/whatsapp12.png'),
                color: Colors.black,
              ),
            ),
            itemLabel: 'Chat',
          ),

          BottomBarItem(
            inActiveItem: ImageIcon(
              AssetImage('assets/homeimages/Notifications.png'),
              color: Color(0xff03BF9C),
            ),
            activeItem: ImageIcon(
              AssetImage('assets/homeimages/Notifications.png'),
              color: Colors.black,
            ),
            itemLabel: 'Notifications',
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            _pageController.jumpToPage(index);
          });
        },
        kBottomRadius: 20,
        kIconSize: 20,
      ),
    );
  }
}





