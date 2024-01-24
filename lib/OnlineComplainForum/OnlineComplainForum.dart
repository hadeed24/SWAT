import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    "Badin",
    "Dadu",
    "Ghotki",
    "Hyderabad",
    "Jacobabad",
    "Jamshoro",
    "Kashmore",
    "Khairpur",
    "Larkana",
    "Matiari",
    "Mirpur Khas",
    "Naushahro Feroze",
    "Shaheed Benazirabad",
    "Qambar Shahdadkot",
    "Sanghar",
    "Shikarpur",
    "Sukkur",
    "Tando Allahyar",
    "Tando Muhammad Khan",
    "Tharparkar",
    "Thatta",
    "Umerkot",
    "Sujawal",
    "Malir",
  ];

  List<String> Taluka = [];
  String? _selectedTaluka;

  Future<void> fetchData(String selectedDistrict) async {
    final response = await http.get(Uri.parse(
        "https://cms.swatagriculture.gos.pk/api/get-talukas?district=$selectedDistrict"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      FetchAPI api = FetchAPI.fromJson(data);

      if (api.success == true) {
        List<String> unsortedData = api.data ?? [];
        unsortedData.sort(); // Sort the data

        setState(() {
          Taluka = unsortedData;
          _selectedTaluka =
              Taluka.isNotEmpty ? Taluka.first : null; // Change this line
        });
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  String? selectedTaluka; // Initial selected district
/*  Map<String, List<String>> subcategories = {
"Dadu": ["Dadu 1.1", "Dadu1.2", "Dadu 1.3"],
"Jacobabad": ["Jacobabad 2.1", "Jacobabad 2.2", "Jacobabad 2.3"],
"Larkana": ["Larkana 1.1", "Larkana 1.2", "Larkana 1.3"],
"Jamshoro": ["Jamshoro 2.1", "Jamshoro 2.2", "Jamshoro 2.3"],
"Tharparkar": ["Tharparkar 1.1", "Tharparkar 1.2", "Tharparkar 1.3"],
"Korangi": ["Korangi 2.1", "Korangi 2.2", "Korangi 2.3"],
"Malir": ["Malir 1.1", "Malir 1.2", "Malir 1.3"],
"Keamari": ["Keamari 2.1", "Keamari 2.2", "Keamari 2.3"],
// Add more subcategories as needed
}; */
  bool isSubmitButtonEnabled() {
// Check if all text fields are filled
    if (selectedTaluka?.isNotEmpty == true) {
      return nameController.text.isNotEmpty &&
//fatherNameController.text.isNotEmpty &&
          cnicController.text.length == 15 &&
          contactNoController.text.length == 12 &&
          complaintController.text.isNotEmpty;
    }

// Default return if selectedTaluka is null or empty
    return false;
  }

  bool isCnic = false;
  bool RedCnic = false;
  bool RedNO = false;

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
/*  fatherNameController.addListener(() {
setState(() {
fathername = fatherNameController.text;
});
}); */
    cnicController.addListener(() {
      setState(() {
        cnic = cnicController.text;
        if (cnicController.text.length < 15 && cnicController.text.length > 2) {
          RedCnic = true;
        } else {
          RedCnic = false;
        }
      });
    });
    contactNoController.addListener(() {
      setState(() {
        cellnumber = contactNoController.text;

        if (contactNoController.text.length < 12 &&
            contactNoController.text.length > 2) {
          RedNO = true;
        } else {
          RedNO = false;
        }
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
//fatherNameController.dispose();
    cnicController.dispose();
    contactNoController.dispose();
    super.dispose();
  }

  final TextEditingController nameController = TextEditingController();
// final TextEditingController fatherNameController = TextEditingController();
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
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Online Complain Forum",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              T_T(
                heading: 'Name',
                hint_text: 'Enter your name',
                SecondWidget: false,
                controller: nameController,
                maxlength: 30,
                maxlines: 1,
                isCnic: false,
                needFormatter: false,
                keyboard_type: TextInputType.name,
              ),
              const SizedBox(
                height: 7,
              ),
/*    T_T(
heading: 'Father Name/Husband Name',
hint_text: 'Enter your Father Name/Husband Name',
SecondWidget: false,
controller: fatherNameController,
maxlength: 30,
maxlines: 1,
isCnic: false,
needFormatter: false,
keyboard_type: TextInputType.name,
),
const SizedBox(
height: 7,
), */
              T_T(
                heading: 'CNIC',
                hint_text: '41306-xxxxxxx-x',
                SecondWidget: true,
                controller: cnicController,
                maxlength: 15,
                maxlines: 1,
                isCnic: true,
                needFormatter: true,
                keyboard_type: TextInputType.number,
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  inputFormater(!isCnic),
                ],
                minLines: 1,
                maxLines: 1,
                maxLength: 15, // Set the maximum length
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                buildCounter: (BuildContext context,
                    {required int currentLength,
                    required bool isFocused,
                    required int? maxLength}) {
                  return const SizedBox();
                },
                controller: cnicController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                        color: RedCnic
                            ? Colors.red
                            : Colors.blue), // Border color when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                        color: RedCnic
                            ? Colors.red
                            : Colors.grey), // Border color when not focused
                  ),
                  hintText: "0312-11xxxxx",
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              T_T(
                heading: 'District',
                hint_text: 'Select District',
                SecondWidget: true,
                controller: nameController,
                maxlength: 0,
                maxlines: 1,
                isCnic: false,
                needFormatter: false,
              ),
              DropdownButtonFormField<String>(
                hint: const Text("Select District"),
                value: selectedDistrict,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDistrict = newValue!;
// Update talukas based on the selected district
                    fetchData("$selectedDistrict") ?? [];
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
                controller: nameController,
                maxlength: 0,
                maxlines: 1,
                isCnic: false,
                needFormatter: false,
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                hint: const Text("Select Taluka"),
                value: _selectedTaluka,
                items: Taluka.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: const TextStyle(fontWeight: FontWeight.w400)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTaluka = newValue;
                  });
                },
              ),

/* DropdownButtonFormField<String>(
hint: const Text("Select Taluka"),
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
), */
              const SizedBox(
                height: 7,
              ),
              T_T(
                heading: 'Contact No',
                hint_text: '0312-11xxxxx',
                SecondWidget: true,
                controller: contactNoController,
                maxlength: 12,
                maxlines: 1,
                isCnic: false,
                needFormatter: true,
                keyboard_type: TextInputType.number,
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  inputFormater(isCnic),
                ],
                minLines: 1,
                maxLines: 1,
                maxLength: 12, // Set the maximum length
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                buildCounter: (BuildContext context,
                    {required int currentLength,
                    required bool isFocused,
                    required int? maxLength}) {
                  return const SizedBox();
                },
                controller: contactNoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                        color: RedNO
                            ? Colors.red
                            : Colors.blue), // Border color when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                        color: RedNO
                            ? Colors.red
                            : Colors.grey), // Border color when not focused
                  ),
                  hintText: "0312-11xxxxx",
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              T_T(
                heading: 'Nature of Complaint',
                hint_text: 'Enter your Complain',
                SecondWidget: false,
                controller: complaintController,
                maxlength: 500,
                maxlines: 5,
                isCnic: false,
                needFormatter: false,
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
// fatherNameController.clear();
                            cnicController.clear();
                            contactNoController.clear();
                            complaintController.clear();
                            selectedDistrict = null;
                            selectedTaluka = null;
                          });
                          const snackBar = SnackBar(
                            backgroundColor: Colors.green,
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
                height: 60,
                child: Text(
                    " $name    $cnic  $complaint $cellnumber $selectedDistrict $_selectedTaluka  "),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FetchAPI {
  bool? success;
  List<String>? data;

  FetchAPI({this.success, this.data});

  FetchAPI.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['data'] = this.data;
    return data;
  }
}


//https://cms.swatagriculture.gos.pk/api/store-complain