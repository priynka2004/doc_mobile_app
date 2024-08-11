import 'package:flutter/material.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/diabetics_screen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/save_past_history_screen.dart';
import 'package:healtether_clinic_app/constant/app_colors.dart';
import 'package:healtether_clinic_app/constant/app_text.dart';

class PastHistoryScreen extends StatefulWidget {
  const PastHistoryScreen({Key? key}) : super(key: key);

  @override
  State<PastHistoryScreen> createState() => _PastHistoryScreenState();
}

class _PastHistoryScreenState extends State<PastHistoryScreen> {
  final List<String> _selectedDiseases = [];
  bool isSelected = false;

  void _toggleSelected() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text(
                'Past history',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SavePastHistoryScreen();
                }));
              },
              child: Container(
                width: 70,
                height: 35,
                decoration: BoxDecoration(
                  color: const Color(0xFF32856E),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Center(
                  child: Text(
                    AppText.save,
                    style: TextStyle(color: AppColors.whiteColor, fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 4),
                    Flexible(
                      child: TextField(
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.2,
                          color: AppColors.blue1Color,
                        ),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Search & select disease',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Text(
              "${_selectedDiseases.length} selected",
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 1.2,
                color: Color(0xFFA5A5A5),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                buildOption("Diabetics"),
                // CustomDivider(),
                const SizedBox(height: 8),
                buildOption("TB"),
                // CustomDivider(),
                const SizedBox(height: 8),
                buildOption("Cardiovascular"),
                // CustomDivider(),
                const SizedBox(height: 8),
                buildOption("Hemophilia-A"),
                // CustomDivider(),
                const SizedBox(height: 8),
                buildOption("Asthma"),
                // CustomDivider(),
                const SizedBox(height: 8),
                buildOption("Epilepsy"),
                // CustomDivider(),
                const SizedBox(height: 8),
                buildOption("Sickle Cell"),
                // CustomDivider(),
                const SizedBox(height: 8),
                buildOption("Option 1"),
                // CustomDivider(),
                const SizedBox(height: 8),
                buildOption("Option 2"),
                // CustomDivider(),
                const SizedBox(height: 8),
                buildOption("Option 3"),
                // CustomDivider(),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOption(String title) {
    bool isSelected = _selectedDiseases.contains(title);
    return InkWell(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedDiseases.remove(title);
          } else {
            _selectedDiseases.add(title);
          }
        });
      },
      child: Container(
        height: 50,
        color: const Color(0xffF7F7F7),
        child: GestureDetector(
          onTap: () {
            if (title == "Diabetics") {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const DiabeticsScreen();
                },
              );
            } else {
              setState(() {
                if (isSelected) {
                  _selectedDiseases.remove(title);
                } else {
                  _selectedDiseases.add(title);
                }
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                InkWell(

                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: const Color(0xFFA1A1A1),
                      ),
                      color:
                          isSelected ? const Color(0xFFFEFEFE) : Colors.transparent,
                    ),
                    child: isSelected
                        ? const Icon(
                            Icons.check,
                            size: 18,
                            color: Colors.black,
                          )
                        : null,
                  ),
                ),
                const SizedBox(width: 16),
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 1.2,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
