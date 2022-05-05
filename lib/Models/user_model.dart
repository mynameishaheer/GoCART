// For Authentication Firebase
class UserAuth {
  final String id;
  final String email;
  String name;
  String photoUrl;

  UserAuth({
    required this.id,
    required this.email,
    this.name = '',
    this.photoUrl = '',
  });
}

// User Profile for UI
class UserProfile {
  final String id;
  final String email;
  String name;
  String phone;
  String address;
  String city;
  String display;
  List<String> addressIDs;
  List<String> cardIDs;
  List<String> wishListIDs;

  UserProfile({
    required this.id,
    required this.email,
    this.name = '',
    this.phone = '',
    this.address = '',
    this.city = '',
    this.display = 'https://img.icons8.com/bubbles/50/000000/user.png',
    this.addressIDs = const [""],
    this.cardIDs = const [""],
    this.wishListIDs = const [""],
  });
}

// Model for Firebase
class UserProfileModel {
  final String email;
  final String name;
  final String phone;
  final String address;
  final String city;
  final String display;
  final List<String> addresses;
  final List<String> cards;
  final List<String> wishListIDs;

  UserProfileModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.address,
    required this.city,
    required this.display,
    required this.addresses,
    required this.cards,
    required this.wishListIDs,
  });

  static fromJson(Map<String, dynamic> json) {
    var firebase_data = [];

    // Convert List<dynamic> to List<String> for addresses
    firebase_data = json['addressIDs'] ?? [];
    var adressids = firebase_data as List<dynamic>;
    List<String> addressIDs = [];
    for (var id in adressids) addressIDs.add(id.toString().trim());

    // Convert List<dynamic> to List<String> for cards
    firebase_data = json['cardIDs'] ?? [];
    var cardids = firebase_data as List<dynamic>;
    List<String> cardIDs = [];
    for (var id in cardids) cardIDs.add(id.toString().trim());

    // Convert List<dynamic> to List<String> for wishlist
    firebase_data = json['wishlistIDs'] ?? [];
    var favids = firebase_data as List<dynamic>;
    List<String> favIDs = [];
    for (var id in favids) favIDs.add(id.toString().trim());

    return UserProfileModel(
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
      display: json['display'],
      addresses: addressIDs,
      cards: cardIDs,
      wishListIDs: favIDs,
    );
  }

  toJson() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'address': address,
      'city': city,
      'display': display,
      'addressIDs': addresses,
      'cardIDs': cards,
      'wishlistIDs': wishListIDs,
    };
  }
}
