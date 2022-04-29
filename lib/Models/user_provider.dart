import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gocart/Models/user_model.dart';

// Stream Provider for Authentication
class AuthProvider extends ChangeNotifier {
  // Will be initialized to when the user is logged in
  late UserAuth userAuth;

  UserAuth get user => userAuth;

  void initUser(UserAuth userAuth) {
    this.userAuth = userAuth;
    notifyListeners();
  }
}

// Provider for User Collection
class UserProvider extends ChangeNotifier {
  // Will be initialized to when the user is logged in
  UserProfile user = UserProfile(id: "", email: "");
  CollectionReference firebaseUser =
      FirebaseFirestore.instance.collection('users');

  UserProfile get userProfile => user;

  void loadUser(UserAuth? userLogin) {
    if (userLogin != null) {
      user = UserProfile(
        id: userLogin.id,
        email: userLogin.email,
        name: userLogin.name,
        display: userLogin.photoUrl,
      );
      // Check if User is in Firebase
      firebaseUser.doc(user.id).get().then((doc) {
        if (doc.exists) {
          // Update User Profile
          print("User ${user.email} is in Firebase");
          loadUserFromFirebase();
        } else {
          // Add User to Firebase
          print("User is not in Firebase");
          addUser();
          print("added in FB!");
        }
      });
    } else {
      user = UserProfile(id: "", email: "");
    }
    notifyListeners();
  }

  // Update User Profile
  void updateUserInfo({name, address, phone, city}) {
    user.name = name;
    user.address = address;
    user.phone = phone;
    user.city = city;
    saveChanges();
    notifyListeners();
  }

  // Update UserDisplay
  void updateUserDisplay(String display) {
    user.display = display;
    notifyListeners();
  }

  // Save Changes in DB
  // Update Changes
  void saveChanges() async {
    // Update User Profile in Firebase
    await firebaseUser.doc(user.id).set(UserProfileModel(
          email: user.email,
          name: user.name,
          phone: user.phone,
          address: user.address,
          city: user.city,
          display: user.display,
        ).toJson());
    print(user.id);
    print(user.email);
    print(user.name);
    print(user.address);
    print(user.city);
    print(user.phone);
  }

  // Add a new User
  void addUser() async {
    // Convert user to user model
    await firebaseUser.doc(user.id).set(
          UserProfileModel(
            email: user.email,
            name: user.name,
            phone: user.phone,
            address: user.address,
            city: user.city,
            display: user.display,
          ).toJson(),
        );
    notifyListeners();
  }

  void loadUserFromFirebase() async {
    await firebaseUser.doc(user.id).get().then((doc) {
      // Load User from Firebase to User Provider
      UserProfileModel userModel =
          UserProfileModel.fromJson(doc.data() as Map<String, dynamic>);
      user.name = userModel.name;
      user.address = userModel.address;
      user.city = userModel.city;
      user.phone = userModel.phone;
      user.display = userModel.display;
    });
    saveChanges();
    notifyListeners();
  }
}