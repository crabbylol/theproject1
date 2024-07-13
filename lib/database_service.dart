import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:theproject1/journalentry.dart';

import 'auth_service.dart';

class DatabaseService {
  final _fire = FirebaseFirestore.instance;
  final _auth = AuthService();

  create(JournalEntry journalEntry ) {
    try {
      _fire.collection("journalEntries").add({
        "dateTIme": Timestamp.fromDate(journalEntry.dateTime),
        "content": journalEntry.content,
        "userID": _auth.getCurrentUser().uid
      });
    } catch (e) {
      print(e.toString());
    }
  }
}