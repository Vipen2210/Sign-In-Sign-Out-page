import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseServices {
  // collection refernce
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');
}
