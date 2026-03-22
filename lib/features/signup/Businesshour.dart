import 'package:flutter/material.dart';
import 'package:loginapp/features/auth/data/models/registermodel.dart';
import 'package:loginapp/features/signup/verification.dart';

import '../../shared/widgets/custombutton.dart';
import '../../shared/widgets/titletext.dart';
import '../auth/application/buttonfunctoin.dart';
import 'data/data/models/BusinessHourModel.dart';

class Business_hour extends StatefulWidget {
  final RegisterModel model;
  const Business_hour({super.key, required this.model});

  @override
  State<Business_hour> createState() => _Business_hourState();
}

class _Business_hourState extends State<Business_hour> {
  @override
  // int selectedDaysIndex = 0;
  Set<int> selectTimeIndicate = {};
  final List<String> days = ['M', 'T', 'W', 'Th', 'F', 'S', 'Su'];
  Map<String, List<String>> businessData = {
    'M': [],
    'T': [],
    'W': [],
    'Th': [],
    'F': [],
    'S': [],
    'Su': []
  };
  Map<String, dynamic>? businessHours;
  final Map<String, String> dayKeys = {
    'M': 'mon',
    'T': 'tue',
    'W': 'wed',
    'Th': 'thu',
    'F': 'fri',
    'S': 'sat',
    'Su': 'sun'
  };
  int selectedDaysIndex = 0;
  final List<String> timeSlots = [
    '8:00am - 10:00am',
    '10:00am - 1:00pm',
    '1:00pm - 4:00pm',
    '4:00pm - 7:00pm',
    '7:00pm - 10:00pm',
  ];
  Widget build(BuildContext context) {
    String currentDay = days[selectedDaysIndex];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Customtext(
              uptext: 'Signup 4 of 4',
              title: 'Business Hours',
              subtext:
                  'Choose the hours you form is open for pickups. This will allow customers to order deliveries.',
            ),
            SizedBox(
              height: 40,
            ),
            // _buildDayList(),
            // SizedBox(
            // height: 30,
            // ),
            // _bulidTimeGrid(),
            // const Spacer()
            SizedBox(
              height: 50,
              child: ListView.builder(
                  itemCount: days.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedDaysIndex == index;
                    return GestureDetector(
                      onTap: () => setState(() => selectedDaysIndex = index),
                      child: Container(
                        width: 45,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: isSelected
                                ? Color(0xFFD5715B)
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          days[index],
                          style: TextStyle(
                              fontSize: 14,
                              color:
                                  isSelected ? Colors.white : Colors.black54),
                        ),
                      ),
                    );
                  }),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 3.2),
              itemCount: timeSlots.length,
              itemBuilder: (context, index) {
                String slot = timeSlots[index];
                bool isTimeSelected = businessData[currentDay]!.contains(slot);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isTimeSelected) {
                        businessData[currentDay]!.remove(slot);
                      } else {
                        businessData[currentDay]!.add(slot);
                      }
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          isTimeSelected ? Color(0xFFF8C569) : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      timeSlots[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color:
                              isTimeSelected ? Colors.black : Colors.black54),
                    ),
                  ),
                );
              },
            ),
            // SizedBox(
            //   height: 200,
            // ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      // => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.black, size: 28)),
                  SizedBox(
                    width: 220,
                    height:
                        52, // Fixed height for buttons ensures they don't look "fat"
                    child: Custom_button(
                      btName: 'Signup',
                      onTap: () async {
                        Map<String, List<String>> formatData = {};
                        businessData.forEach((key, value) {
                          formatData[dayKeys[key]!] = value;
                        });
                        BusinessHourModel finalHours =
                            BusinessHourModel(hours: formatData);
                        widget.model.businessHourModel = finalHours;
                        bool isAnyTimeSelected =
                            businessData.values.any((list) => list.isNotEmpty);
                        if (!isAnyTimeSelected) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Please select business hour for a at least one day!")));
                          return;
                        }
                        FromHandler.ValidateAndeNext(
                            context: context,
                            model: widget.model,
                            currentPageData: {
                              "business_hours": widget.model.businessHourModel,
                            },
                            NextScreen: Verification(model: widget.model));
                        // print("Sending to Server: ${finalHours.tojson()}");
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
