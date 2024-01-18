import 'package:flutter/material.dart';

class MyNestedDropdowns extends StatefulWidget {
  @override
  _MyNestedDropdownsState createState() => _MyNestedDropdownsState();
}

class _MyNestedDropdownsState extends State<MyNestedDropdowns> {
  String selectedCategory = "Dadu" ;// Allow null for initial state
  String selectedSubcategory = "Dadu";

  List<String> categories = [
    "Dadu",
    "Jacobabad",
    "Larkana",
    "Jamshoro",
    "Tharparkar",
    "Thatta",
    "Korangi",
    "Malir",
    "Keamari"
    // Add more categories as needed
  ];

  Map<String, List<String>> subcategories = {
    "Dadu": ["Subcategory 1.1", "Subcategory 1.2", "Subcategory 1.3"],
    "Jacobabad 2": ["Subcategory 2.1", "Subcategory 2.2", "Subcategory 2.3"],
    "Larkana": ["Subcategory 1.1", "Subcategory 1.2", "Subcategory 1.3"],
    "Jamshoro 2": ["Subcategory 2.1", "Subcategory 2.2", "Subcategory 2.3"],
    "Tharparkar": ["Subcategory 1.1", "Subcategory 1.2", "Subcategory 1.3"],
    "Korangi 2": ["Subcategory 2.1", "Subcategory 2.2", "Subcategory 2.3"],
    "Malir": ["Subcategory 1.1", "Subcategory 1.2", "Subcategory 1.3"],
    "Keamari 2": ["Subcategory 2.1", "Subcategory 2.2", "Subcategory 2.3"],
    // Add more subcategories as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButtonFormField<String>(
            value: selectedCategory,
            onChanged: (String? newValue) {
              setState(() {
                selectedCategory = newValue!;
              });
            },
            items: categories.map((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
            decoration: InputDecoration(
              labelText: 'Select Category',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          if (selectedCategory != null)
            DropdownButtonFormField<String>(
              value: selectedSubcategory,
              onChanged: (String? newValue) {
                setState(() {
                  selectedSubcategory = newValue!;
                });
              },
              items:
                  subcategories[selectedCategory!]!.map((String subcategory) {
                return DropdownMenuItem<String>(
                  value: subcategory,
                  child: Text(subcategory),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select Subcategory',
                border: OutlineInputBorder(),
              ),
            ),
        ],
      ),
    );
  }
}
