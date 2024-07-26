import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:theproject1/journalentry.dart';

import 'auth_service.dart';

class DatabaseService {
  final _fire = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  create(JournalEntry journalEntry) {
    //final User? currentUser = _auth.currentUser;
    try {
      _fire.collection("journalEntries").add({
        "dateTIme": Timestamp.fromDate(journalEntry.dateTime),
        "content": journalEntry.content,
        "userID": journalEntry.userID
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<JournalEntry>> getJournalEntriesByDate(DateTime selectedDate) async {
    final User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      final DateTime startDate = DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
      final DateTime endDate = startDate.add(const Duration(days: 1));

      final query = _fire
        .collection("journalEntries")
        .where('userID', isEqualTo: currentUser.uid)
        .where('dateTime', isGreaterThanOrEqualTo: Timestamp.fromDate(startDate))
        .where('dateTime', isLessThan: Timestamp.fromDate(endDate));

      final querySnapshot = await query.get();

      final entries = querySnapshot.docs.map((doc) => JournalEntry( dateTime: Timestamp.fromDate(doc['dateTime']).toDate(), content: doc['content'], userID: doc['userID'], )).toList();

      return entries;
    } else {
      print("No user is currently logged in!");
      return [];
    }
  }
}