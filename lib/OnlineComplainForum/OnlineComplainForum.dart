import 'package:flutter/material.dart';
import 'package:swat/OnlineComplainForum/common.dart';

class OnlineComplainForum extends StatefulWidget {
  OnlineComplainForum({super.key});

  @override
  State<OnlineComplainForum> createState() => _OnlineComplainForumState();
}

class _OnlineComplainForumState extends State<OnlineComplainForum> {
  String selectedDistrict = 'Dadu'; // Initial selected district
  List<String> districts = [
    "Dadu",
    "Jacobabad",
    "Larkana",
    "Jamshoro",
    "Tharparkar",
    "Thatta",
    "Korangi",
    "Malir",
    "Keamari"
  ];
  String selectedTaluka = 'Dokri'; // Initial selected district
  List<String> Taluka = [
    "Dokri",
    "Bakrani",
    "Lakhi",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                child: Image.asset(
                  "assets/images/logo.jpeg",
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                ),
              ),
              const T_T(
                heading: 'Name',
                hint_text: 'Enter your name',
                keyboard_type: TextInputType.name,
                SecondWidget: false,
              ),
              const SizedBox(
                height: 15,
              ),
              const T_T(
                heading: 'Father Name/Husband Name',
                hint_text: 'Enter your Father Name/Husband Name',
                keyboard_type: TextInputType.name,
                SecondWidget: false,
              ),
              const SizedBox(
                height: 15,
              ),
              const T_T(
                heading: 'CNIC',
                hint_text: '41306xxxxxxxx',
                keyboard_type: TextInputType.number,
                SecondWidget: false,
              ),
              const SizedBox(
                height: 15,
              ),
              const T_T(
                heading: 'District',
                hint_text: 'Select District',
                keyboard_type: null,
                SecondWidget: true,
              ),
              DropdownButtonFormField<String>(
                value: selectedDistrict,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDistrict = newValue!;
                  });
                },
                items: districts.map((String district) {
                  return DropdownMenuItem<String>(
                    value: district,
                    child: Text(district,
                        style: const TextStyle(fontWeight: FontWeight.w400)),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue), // Border color when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey), // Border color when not focused
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const T_T(
                heading: 'Taluka',
                hint_text: 'Select Taluka',
                SecondWidget: true,
                keyboard_type: null,
              ),
              DropdownButtonFormField<String>(
                value: selectedTaluka,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedTaluka = newValue!;
                  });
                },
                items: Taluka.map((String Taluka) {
                  return DropdownMenuItem<String>(
                    value: Taluka,
                    child: Text(
                      Taluka,
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue), // Border color when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey), // Border color when not focused
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const T_T(
                heading: 'Contact No',
                hint_text: '031211xxxxx',
                keyboard_type: TextInputType.phone,
                SecondWidget: false,
              ),
              const SizedBox(
                height: 15,
              ),
              const T_T(
                heading: 'Nature of Complaint',
                hint_text: 'Enter your Complain',
                SecondWidget: false,
                keyboard_type: TextInputType.text,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
// Show Snackbar when button is pressed
                    const snackBar = SnackBar(
                      content: Text('Submitted'),
                      duration: Duration(seconds: 2),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(5.0), // Set border radius
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, letterSpacing: 1),
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
