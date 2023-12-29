import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserData extends ChangeNotifier {
  String? uid;
  String? accountType;
  String? profile;
  String? name;
  String? email;
  String? image;

  void setUserData(String uid, String accountType, [String? profile]) {
    this.uid = uid;
    this.accountType = accountType;
    this.profile = profile;

    // Fetch the name using the UID
    fetchName(accountType);
    notifyListeners();
  }

  void clearUserData() {
    uid = null;
    accountType = null;
    profile = null;
    name = null;
    email = null;
    notifyListeners();
  }

  // Function to fetch the name using the UID
  Future<void> fetchName(String accountType) async {
    try {
      // Assuming you have a "users" collection in Firestore
      DocumentSnapshot userSnapshot =
      await FirebaseFirestore.instance.collection(accountType).doc(uid).get();

      // Assuming the name is stored in a field called "Name" in the document
      name = userSnapshot.get('Name');
      email = userSnapshot.get('Email');

    } catch (error) {
      print('Error fetching name: $error');
    }
  }

  // Function to update the image in the UserData
  void updateImage(String imagePath) {
    image = imagePath;
    notifyListeners();
  }

}
