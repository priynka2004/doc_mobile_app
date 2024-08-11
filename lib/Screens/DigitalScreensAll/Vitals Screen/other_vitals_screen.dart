import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/VitalsGeneralScreen.dart';
import 'package:healtether_clinic_app/Screens/DigitalScreensAll/Vitals%20Screen/past_historyScreen.dart';

class OtherVitalsScreen extends StatefulWidget {
  const OtherVitalsScreen({Key? key}) : super(key: key);

  @override
  State<OtherVitalsScreen> createState() => _OtherVitalsScreenState();
}

class _OtherVitalsScreenState extends State<OtherVitalsScreen> {
  final List<String> _selectedDiseases = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                ' Vitals',
                style: GoogleFonts.urbanist(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                        // const VitalDetailScreen()
                      const VitalsGeneralScreen(),
                        // const PastHistory(),
                  ),
                );
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const VitalsGeneralScreen(),
                            // const PastHistory()),
                    ) );
                },
                child: Container(
                  width: 62,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xFF32856E),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Center(
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 12
                      ,fontWeight: FontWeight.w500,fontFamily: "Poppins"
                      ),
                    ),
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
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.2,
                          color: Color(0xFF110C2C),
                        ),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Search & select ',
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
                buildOption("Vital 1"),
                // CustomDivider(),
                const SizedBox(
                  height: 8,
                ),
                buildOption("Vital 2"),
                // CustomDivider(),
                const SizedBox(
                  height: 8,
                ),
                buildOption("Vital 3"),
                // CustomDivider(),
                const SizedBox(
                  height: 8,
                ),
                buildOption("Vital 4"),
                // CustomDivider(),
                const SizedBox(
                  height: 8,
                ),
                buildOption("Vital 5"),
                // CustomDivider(),
                const SizedBox(
                  height: 8,
                ),
                buildOption("Vital 6"),
                // CustomDivider(),
                const SizedBox(
                  height: 8,
                ),
                buildOption("Vital 7"),
                // CustomDivider(),
                const SizedBox(
                  height: 8,
                ),
                buildOption("Vital 8"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOption(String title) {
    bool isSelected = _selectedDiseases.contains(title);

    return SingleChildScrollView(
      child: GestureDetector(
        child: Container(
          height: 50,
          decoration: const BoxDecoration(
            color: Color(0xFFF8F7FC),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(children: [
            InkWell(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _selectedDiseases.remove(title);
                  } else {
                    _selectedDiseases.add(title);
                  }
                });
              },
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
                style: GoogleFonts.urbanist(
                  textStyle: const TextStyle(
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 1.2,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
