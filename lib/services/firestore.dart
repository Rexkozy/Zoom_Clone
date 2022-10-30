import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingsHistory => _firestore
      .collection('participants')
      .doc(_auth.currentUser!.uid)
      .collection('meetings')
      .snapshots();

  Future<void> addToMeeting(String meetingName) async {
    try {
      await _firestore
          .collection('participants')
          .doc(_auth.currentUser!.uid)
          .collection('meetings')
          .add({
        'meetingName': meetingName,
        'createdAt': DateTime.now().millisecondsSinceEpoch,
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
