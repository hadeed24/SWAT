import 'package:flutter/material.dart';
import 'package:swat/OnlineComplainForum/common.dart';

class OnlineComplainForum extends StatefulWidget {
  const OnlineComplainForum({Key? key}) : super(key: key);

  @override
  State<OnlineComplainForum> createState() => _OnlineComplainForumState();
}

class _OnlineComplainForumState extends State<OnlineComplainForum> {
  String? selectedDistrict; // Initial selected district
// Initial selected district
  List<String> districts = [
    "Dadu",
    "Jacobabad",
    "Larkana",
    "Jamshoro",
    "Tharparkar",
    "Korangi",
    "Malir",
    "Keamari"
  ];

  String? selectedTaluka; // Initial selected district
  Map<String, List<String>> subcategories = {
    "Dadu": ["Dadu 1.1", "Dadu1.2", "Dadu 1.3"],
    "Jacobabad": ["Jacobabad 2.1", "Jacobabad 2.2", "Jacobabad 2.3"],
    "Larkana": ["Larkana 1.1", "Larkana 1.2", "Larkana 1.3"],
    "Jamshoro": ["Jamshoro 2.1", "Jamshoro 2.2", "Jamshoro 2.3"],
    "Tharparkar": ["Tharparkar 1.1", "Tharparkar 1.2", "Tharparkar 1.3"],
    "Korangi": ["Korangi 2.1", "Korangi 2.2", "Korangi 2.3"],
    "Malir": ["Malir 1.1", "Malir 1.2", "Malir 1.3"],
    "Keamari": ["Keamari 2.1", "Keamari 2.2", "Keamari 2.3"],
// Add more subcategories as needed
  };
  bool isSubmitButtonEnabled() {
// Check if all text fields are filled
    if (selectedTaluka?.isNotEmpty == true) {
      return nameController.text.isNotEmpty &&
          fatherNameController.text.isNotEmpty &&
          cnicController.text.isNotEmpty &&
          contactNoController.text.isNotEmpty &&
          complaintController.text.isNotEmpty;
    }

// Default return if selectedTaluka is null or empty
    return false;
  }

  var name;
  var fathername;
  var cnic;
  var cellnumber;
  var complaint;

  @override
  void initState() {
    super.initState();
    nameController.addListener(() {
      setState(() {
        name = nameController.text;
      });
    });
    fatherNameController.addListener(() {
      setState(() {
        fathername = fatherNameController.text;
      });
    });
    cnicController.addListener(() {
      setState(() {
        cnic = cnicController.text;
      });
    });
    contactNoController.addListener(() {
      setState(() {
        cellnumber = contactNoController.text;
      });
    });
    complaintController.addListener(() {
      setState(() {
        complaint = complaintController.text;
      });
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    fatherNameController.dispose();
    cnicController.dispose();
    contactNoController.dispose();
    super.dispose();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();
  final TextEditingController complaintController = TextEditingController();

  List<String> talukas = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
              T_T(
                heading: 'Name',
                hint_text: 'Enter your name',
                SecondWidget: false,
                controller: nameController, maxlength: 30,
              ),
              const SizedBox(
                height: 7,

              ),
              T_T(
                heading: 'Father Name/Husband Name',
                hint_text: 'Enter your Father Name/Husband Name',
                SecondWidget: false,
                controller: fatherNameController, maxlength: 30,
              ),
              const SizedBox(
                height: 7,
              ),
              T_T(
                heading: 'CNIC',
                hint_text: '41306-xxxxxxx-x',
                SecondWidget: false,
                controller: cnicController, maxlength: 15,
              ),
              const SizedBox(
                height: 7,

              ),
              T_T(
                heading: 'District',
                hint_text: 'Select District',
                SecondWidget: true,
                controller: nameController, maxlength: 0,
              ),
              DropdownButtonFormField<String>(
                value: selectedDistrict,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDistrict = newValue!;
// Update talukas based on the selected district
                    talukas = subcategories[selectedDistrict] ?? [];
                    selectedTaluka = talukas.isNotEmpty ? talukas.first : '';
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
                height: 7,

              ),
              T_T(
                heading: 'Taluka',
                hint_text: 'Select Taluka',
                SecondWidget: true,
                controller: nameController, maxlength: 0,
              ),
              DropdownButtonFormField<String>(
                value: selectedTaluka,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedTaluka = newValue!;
                  });
                },
                items: talukas.map((String taluka) {
                  return DropdownMenuItem<String>(
                    value: taluka,
                    child: Text(
                      taluka,
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
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,

              ),
              T_T(
                heading: 'Contact No',
                hint_text: '0312-11xxxxx',
                SecondWidget: false,
                controller: contactNoController, maxlength: 13,
              ),
              const SizedBox(
                height: 7,

              ),
              T_T(
                heading: 'Nature of Complaint',
                hint_text: 'Enter your Complain',
                SecondWidget: false,
                controller: complaintController, maxlength: 500,
              ),
              const SizedBox(
                height: 7,

              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isSubmitButtonEnabled()
                      ? () {
                          setState(() {
                            nameController.clear();
                            fatherNameController.clear();
                            cnicController.clear();
                            contactNoController.clear();
                            complaintController.clear();
                            selectedDistrict = null;
                          });
                          const snackBar = SnackBar(
                            backgroundColor: Color.fromARGB(255, 53, 53, 53),
                            content: Text('Submitted'),
                            duration: Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      : null,
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
              SizedBox(
                height: 40,
                child: Text(
                    " $name  $fathername  $cnic  $complaint $cellnumber $selectedDistrict $selectedTaluka  "),
              )
            ],
          ),
        ),
      ),
    );
  }
}
/* 
final controller = TextEditingController();

/// reuseble widgets/////////////////////
class T_T extends StatelessWidget {
T_T({
super.key,
required this.heading,
});
final String heading;



// then, in the build method:
@override
Widget build(BuildContext context) {
return Column(
children: [
Container(
alignment: Alignment.centerLeft,
child: Text(
heading,
textAlign: TextAlign.left,
style: const TextStyle(color: Colors.black, fontSize: 15),
),
),
const SizedBox(
height: 5,
),
],
);
}
}
*/