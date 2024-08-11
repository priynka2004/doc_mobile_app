import 'package:flutter/material.dart';

class AddAppointScreen extends StatefulWidget {
  const AddAppointScreen({super.key});

  @override
  State<AddAppointScreen> createState() => _AddAppointScreenState();
}

class _AddAppointScreenState extends State<AddAppointScreen> {
  final PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(AppText.addAppointment,style: TextStyle(fontSize: 20),),
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: const Icon(Icons.arrow_back),
      //   ),
      //   automaticallyImplyLeading: false,
      //   actions: [
      //     // if (currentPageIndex > 1)
      //     //   TextButton(
      //     //     onPressed: () {},
      //     //     child: const Text(
      //     //       AppText.skip,
      //     //       style: TextStyle(color: Color(0XFF4646B5)),
      //     //     ),
      //     //   ),
      //     // if (currentPageIndex > 1) IconButton(
      //     //   onPressed: () {},
      //     //   icon: const Icon(Icons.more_vert),
      //     // ),
      //
      //
      //
      //
      //     // IconButton(
      //     //   icon: const Icon(Icons.more_vert, size: 28, color: Colors.black),
      //     //   onPressed: () {},
      //     // ),
      //     Container(
      //       height: 30,
      //       width: 30,
      //       decoration: BoxDecoration(
      //         border: Border.all(color: AppColors.blackColor),
      //         borderRadius: BorderRadius.circular(6),
      //       ),
      //       child: InkWell(
      //         onTap: () {
      //           Navigator.of(context).pop();
      //         },
      //         child: const Icon(
      //           Icons.close_rounded,
      //         ),
      //       ),
      //     ),
      //     const SizedBox(
      //       width: 15,
      //     ),
      //   ],
      // ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0,right: 14,top: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: SmoothPageIndicator(
              //     controller: pageController,
              //     count: 4,
              //     effect: const ExpandingDotsEffect(
              //         expansionFactor: 5,
              //         dotColor: Color(0XFF5351C7),
              //         strokeWidth: 3,
              //         dotHeight: 8,
              //         dotWidth: 8,
              //         paintStyle: PaintingStyle.fill),
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
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
                    children: const [
                      // AddPersonalDetailsScreen(
                      //   pageController: pageController,
                      // ),

                    ],
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 15,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}