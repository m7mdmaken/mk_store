import 'package:cloud_firestore/cloud_firestore.dart';
import '/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    required String documentId,
  }) async {
    if (data.isNotEmpty) {
      await db.collection(path).doc(documentId).set(data);
    } else {
      await db.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? queryParams,
  }) async {
    // If query parameters are provided, build and execute the query on the collection.
    if (queryParams != null) {
      Query query = db.collection(path);
      queryParams.forEach((key, value) {
        if (key == 'limit' && value is int) {
          query = query.limit(value);
        } else if (key == 'orderBy' && value is String) {
          bool descending = queryParams['descending'] == true;
          query = query.orderBy(value, descending: descending);
        }
      });
      final querySnapshot = await query.get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    }

    // If a documentId is provided, return that single document's data.
    if (documentId != null) {
      final doc = await db.collection(path).doc(documentId).get();
      if (doc.exists) {
        return doc.data();
      } else {
        throw Exception('Document not found');
      }
    }

    // Otherwise return all documents in the collection.
    final snapshot = await db.collection(path).get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<bool> isDocumentExists({
    required String path,
    required String documentId,
  }) async {
    final doc = await db.collection(path).doc(documentId).get();
    return doc.exists;
  }
}
