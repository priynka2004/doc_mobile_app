import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healtether_clinic_app/Screens/patient_profile/edit_profile/contact_details.dart';
import 'package:healtether_clinic_app/Screens/patient_profile/edit_profile/documents.dart';
import 'package:healtether_clinic_app/Screens/patient_profile/edit_profile/payments_details.dart';
import 'package:healtether_clinic_app/Screens/patient_profile/edit_profile/personal_details.dart';
import 'package:healtether_clinic_app/utils/customButton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Profile"),
        ),
        body:  Container(
            height: MediaQuery.of(context).size.height,
           
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SmoothPageIndicator(controller: controller,
                   count: 4,
                   effect: const ExpandingDotsEffect(
                    expansionFactor: 5,
                  dotColor: Color(0XFF5351C7),
                    strokeWidth: 3,
                    dotHeight: 8,
                    dotWidth: 8,
                    paintStyle: PaintingStyle.fill
                   ),),
                ),
                 const SizedBox(height: 10,),
                Expanded(
                
                  child: PageView(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      const PersonalEdit(), const ContactsEdit(),Document_Details(),const PaymentDetails()],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(data: "Save",width: MediaQuery.of(context).size.width,height: 50,color: const Color(0XFF03BF9C),Textcolor: Colors.white,Textsize: 16,),
                ),
                const SizedBox(height: 10,)
              ],
            ),
          
        ));
  }
}
