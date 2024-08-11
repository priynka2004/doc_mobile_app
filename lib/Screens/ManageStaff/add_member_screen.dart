import 'package:flutter/material.dart';
import 'package:healtether_clinic_app/Screens/ManageStaff/personal_detail_screen.dart';
import 'package:healtether_clinic_app/constant/constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddMemberScreen extends StatefulWidget {

  const AddMemberScreen({super.key});

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  final PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text(AppText.addMember),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        automaticallyImplyLeading: false,
        actions: [
          if (currentPageIndex > 1)
            TextButton(
              onPressed: () {},

              child:  const Text(
                AppText.skip,
                style: TextStyle(color: Color(0XFF4646B5)),
              ),
            ),
          if (currentPageIndex > 1)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: 14,right: 14,top: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 4,
                    effect: const ExpandingDotsEffect(
                        expansionFactor: 5,
                        dotColor: Color(0XFF5351C7),
                        strokeWidth: 3,
                        dotHeight: 8,
                        dotWidth: 8,
                        paintStyle: PaintingStyle.fill),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.7, // Adjust the height as needed
                    child: PageView(
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index) {
                        setState(() {
                          currentPageIndex = index;
                        });
                      },
                      children: [
                        PersonalDetailScreen(
                          pageController: pageController,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
