import 'package:flutter/material.dart';

class ControllerModal {
  String? description;
  String? name;

  ControllerModal({
    this.description,
    this.name,
  });

  factory ControllerModal.from(Map m1) {
    return ControllerModal(description: m1['description'], name: m1['name']);
  }
}

TextEditingController txtDescription = TextEditingController();
TextEditingController txtName = TextEditingController();