import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeSlotDropDown extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;

  const TimeSlotDropDown({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> timeSlots = generateTimeSlots();

    return Container(
      height: 52,
      color: const Color(0xffF5F5F5),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: InputBorder.none,
            isDense: true,
          ),
          value: value,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          items: timeSlots.map((String value) {
            return DropdownMenuItem<String>(
              value: value == 'Select Time Slot' ? null : value,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color:
                      value == 'Select Time Slot' ? Colors.grey : Colors.black,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  List<String> generateTimeSlots() {
    List<String> timeSlots = ['Select Time Slot'];
    DateTime startTime = DateTime(2021, 1, 1, 9, 0);
    DateTime endMorning = DateTime(2021, 1, 1, 12, 0);
    DateTime startAfternoon = DateTime(2021, 1, 1, 14, 0);
    DateTime endAfternoon = DateTime(2021, 1, 1, 16, 0);
    DateTime startEvening = DateTime(2021, 1, 1, 16, 0);
    DateTime endEvening = DateTime(2021, 1, 1, 22, 0);
    timeSlots.add('Slot 1');
    while (startTime.isBefore(endMorning)) {
      DateTime nextTime = startTime.add(const Duration(minutes: 15));
      timeSlots.add(
          "${DateFormat('h:mm a').format(startTime)} - ${DateFormat('h:mm a').format(nextTime)}");
      startTime = nextTime;
    }

    timeSlots.add('Slot 2');
    while (startAfternoon.isBefore(endAfternoon)) {
      DateTime nextTime = startAfternoon.add(const Duration(minutes: 15));
      timeSlots.add(
          "${DateFormat('h:mm a').format(startAfternoon)} - ${DateFormat('h:mm a').format(nextTime)}");
      startAfternoon = nextTime;
    }

    timeSlots.add('Slot 3');
    while (startEvening.isBefore(endEvening)) {
      DateTime nextTime = startEvening.add(const Duration(minutes: 15));
      timeSlots.add(
          "${DateFormat('h:mm a').format(startEvening)} - ${DateFormat('h:mm a').format(nextTime)}");
      startEvening = nextTime;
    }

    return timeSlots;
  }
}
