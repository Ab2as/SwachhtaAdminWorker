import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  String name;
  String gender;
  String address;
  String pincode;
  String department;

  Profile(
      {required this.name,
      required this.gender,
      required this.address,
      required this.pincode,
      required this.department});

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "address": address,
        "pincode": pincode,
        "department": department,
      };

  static Profile fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Profile(
        name: snapshot['name'],
        gender: snapshot['gender'],
        address: snapshot['address'],
        pincode: snapshot['pincode'],
        department: snapshot['department']);
  }
}
