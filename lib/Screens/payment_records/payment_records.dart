import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/AppointmentScreen/appointment_screen.dart';
import 'package:healtether_clinic_app/Screens/ChatScreen/chat_screen.dart';
import 'package:healtether_clinic_app/Screens/Notification/screen/notifications_screen.dart';
import 'package:healtether_clinic_app/Screens/payment_records/payment_record_fullscreen.dart';
import 'package:healtether_clinic_app/Screens/payment_records/payment_record_listTile.dart';
import 'package:healtether_clinic_app/Screens/payment_records/provider/payment_provider.dart';
import 'package:healtether_clinic_app/constant/app_colors.dart';
import 'package:healtether_clinic_app/constant/app_text.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PaymentsRecordScreen extends StatefulWidget {
  const PaymentsRecordScreen({super.key});

  @override
  _PaymentsRecordScreenState createState() => _PaymentsRecordScreenState();
}

class _PaymentsRecordScreenState extends State<PaymentsRecordScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _controller = NotchBottomBarController(index: 0);
  late PaymentProvider paymentProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      paymentProvider = Provider.of<PaymentProvider>(context, listen: false);
      paymentProvider.fetchPayments();
    });
  }

  List<Widget> get _pages => [
    _buildPaymentsPage(),
    const AppointmentScreen(),
    const ChatScreen(),
    const NotificationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _controller.index == 0
          ? AppBar(
        leadingWidth: 30,
        title: const Text(
          'Payment Records',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      )
          : null,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _controller.index = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: const Color(0xffA1EBD6),
        showBlurBottomBar: false,
        notchColor: const Color(0xffA1EBD6),
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: SizedBox(
              width: 24,
              height: 24,
              child: ImageIcon(
                AssetImage('assets/homeimages/Home.png'),
                color: Color(0xff03BF9C),
              ),
            ),
            activeItem: SizedBox(
              width: 24,
              height: 24,
              child: ImageIcon(
                AssetImage('assets/homeimages/Home.png'),
                color: Colors.black,
              ),
            ),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: SizedBox(
              width: 24,
              height: 24,
              child: ImageIcon(
                AssetImage('assets/homeimages/Calender.png'),
                color: Color(0xff03BF9C),
              ),
            ),
            activeItem: SizedBox(
              width: 24,
              height: 24,
              child: ImageIcon(
                AssetImage('assets/homeimages/Calender.png'),
                color: Colors.black,
              ),
            ),
            itemLabel: 'Appointments',
          ),
          BottomBarItem(
            inActiveItem: SizedBox(
              width: 24,
              height: 24,
              child: ImageIcon(
                AssetImage('assets/homeimages/whatsapp12.png'),
                color: Color(0xff03BF9C),
              ),
            ),
            activeItem: SizedBox(
              width: 24,
              height: 24,
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
            _controller.index = index;
          });
          _pageController.jumpToPage(index);
        },
        kBottomRadius: 20,
        kIconSize: 20,
      ),
    );
  }

  Widget _buildPaymentsPage() {
    return Consumer<PaymentProvider>(
      builder: (context, paymentProvider, child) {
        if (paymentProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (paymentProvider.payments.isEmpty) {
          return Center(child: Text('No payment records available.'));
        }
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: true,
          children: [
            customSearchBar(),
            const SizedBox(height: 8),
            const Text(AppText.allPaymentRecords),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: paymentProvider.payments.length,
              itemBuilder: (context, index) {
                final payment = paymentProvider.payments[index];
                String formatDate(DateTime date) {
                  final DateFormat formatter = DateFormat('dd-MM-yy');
                  return formatter.format(date);
                }

                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentRecordFullScreen(
                        name: payment.name ?? '',
                        number: payment.mobile ?? '',
                        status: payment.paymentStatus == true ? 'Completed' : 'Pending',
                        payment: paymentProvider.payments[index],
                        date: formatDate(payment.appointmentDate),
                      ),
                    ),
                  ),
                  child: PaymentRecordTile(
                    name: payment.name ?? '',
                    number: payment.mobile ?? '',
                    date: formatDate(payment.appointmentDate) ?? '',
                    status: payment.paymentStatus == true ? 'Completed' : 'Pending',
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget customSearchBar() {
    return Container(
      height: 60,
      color: AppColors.white1Color,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 10, left: 10, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.search),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppText.quickSearch,
                  hintStyle: GoogleFonts.montserrat(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
