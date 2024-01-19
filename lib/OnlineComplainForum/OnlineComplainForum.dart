import 'package:flutter/material.dart';

class OnlineComplainForum extends StatefulWidget {
  const OnlineComplainForum({Key? key}) : super(key: key);

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
    return nameController.text.isNotEmpty &&
        fatherNameController.text.isNotEmpty &&
        cnicController.text.isNotEmpty &&
        selectedTaluka!.isNotEmpty &&
        contactNoController.text.isNotEmpty &&
        complaintController.text.isNotEmpty;
  }

  final _controller = TextEditingController();

  String? get errorText {
// at any time, we can get the text from _controller.value.text
    final text = _controller.value.text;
// Note: you can do your own custom validation here
// Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
// return null if the text is valid
    return null;
  }

  var name;
  var fathername;
  var cnic;
  var cellnumber;
  var complaint;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.addListener(() {
      name = nameController.text;
    });
    fatherNameController.addListener(() {
      fathername = fatherNameController.text;
    });
    cnicController.addListener(() {
      cnic = cnicController;
    });
    contactNoController.addListener(() {
      cellnumber = contactNoController;
    });
    complaintController.addListener(() {
      complaint = complaintController;
    });
  }

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
              ),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                        color: Colors.blue), // Border color when focused
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                        color: Colors.grey), // Border color when not focused
                  ),
                  hintText: 'Enter your name',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              T_T(
                heading: 'Father Name/Husband Name',
              ),
              TextFormField(
                controller: controller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                        color: Colors.blue), // Border color when focused
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                        color: Colors.grey), // Border color when not focused
                  ),
                  hintText: 'Enter your Father Name/Husband Name',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              T_T(
                heading: 'CNIC',
              ),
              TextFormField(
                controller: controller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                        color: Colors.blue), // Border color when focused
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                        color: Colors.grey), // Border color when not focused
                  ),
                  hintText: '41306xxxxxxxx',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              T_T(
                heading: 'District',
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
                height: 15,
              ),
              T_T(
                heading: 'Taluka',
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
                height: 15,
              ),
              T_T(
                heading: 'Contact No',
              ),
              TextFormField(
                controller: controller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                        color: Colors.blue), // Border color when focused
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                        color: Colors.grey), // Border color when not focused
                  ),
                  hintText: '031211xxxxx',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              T_T(
                heading: 'Nature of Complaint',
              ),
              TextFormField(
                controller: controller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                        color: Colors.blue), // Border color when focused
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(
                        color: Colors.grey), // Border color when not focused
                  ),
                  hintText: 'Enter your Complain',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    var name = nameController.text;
                    print(name);
                    var fname = fatherNameController.text;
                    print("\n" + fname);
                    var cnic = cnicController.text;
                    print("\n" + cnic);
                    const snackBar = SnackBar(
                      backgroundColor: Color.fromARGB(255, 53, 53, 53),
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
              Container(
                height: 40,
                child: Text("hhhhhh $name \n "),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
