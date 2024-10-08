import 'package:flutter/material.dart';

class controllerModal {
  String? quote;
  String? author;

  controllerModal({
    this.quote,
    this.author,
  });

  factory controllerModal.from(Map m1) {
    return controllerModal(quote: m1['quote'], author: m1['author']);
  }
}

TextEditingController txtQuotes = TextEditingController();
TextEditingController txtAuthor = TextEditingController();