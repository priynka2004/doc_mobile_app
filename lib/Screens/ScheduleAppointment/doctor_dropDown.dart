import 'package:flutter/material.dart';

class DoctorDropDown extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;

  const DoctorDropDown({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      color: const Color(0xffF5F5F5),
      width: 150,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10,top: 7),
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: InputBorder.none,
            isDense: true,
          ),
          value: value,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          items: <String>['Attending doctor', 'Dr. Samy Pal', 'Dr. Kim Jones', 'Others']
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value == 'Attending doctor' ? null : value,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: value == 'Attending doctor' ? Colors.grey : Colors.black,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
