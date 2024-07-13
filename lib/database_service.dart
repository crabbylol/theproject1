import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:theproject1/journalentry.dart';

import 'auth_service.dart';

class DatabaseService {
  final _fire = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  create(JournalEntry journalEntry ) {
    final User? currentUser = _auth.currentUser;

    try {
      _fire.collection("journalEntries").add({
        "dateTIme": Timestamp.fromDate(journalEntry.dateTime),
        "content": journalEntry.content,
        "userID": currentUser.uid
      });
    } catch (e) {
      print(e.toString());
    }
  }
}