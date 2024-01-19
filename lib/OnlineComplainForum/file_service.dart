import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileService {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController tagController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();
  final TextEditingController complaintController = TextEditingController();

  bool FieldsNotEmpty = false;
  File? _selectedFiled;
  String _selectedDirectory = '';

  void saveContent(context) async {
    final title = titleController.text;
    final description = descriptionController.text;
    final tags = tagController.text;
    final textContext =
        "Title:\n\n$title\n\nDescription:\n\n$description\n\nTags:\n\n$tags";
  }
}
