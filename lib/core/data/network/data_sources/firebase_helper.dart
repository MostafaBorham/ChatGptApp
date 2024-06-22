import 'package:chat_gpt_app/core/errors/exceptions.dart';
import 'package:chat_gpt_app/domains/entities/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseHelper {
  static final firestoreDatabase = FirebaseFirestore.instance;

  static Future<String> addDataToCollection(
      {required String collection,
      Map<String, dynamic>? data,
      String? docId}) async {
    final colRef = firestoreDatabase.collection(collection);
    if (docId != null) {
      await colRef.doc(docId).set(data ?? {});
      return docId;
    } else {
      final docRef = await colRef.add(data ?? {});
      return docRef.id;
    }
  }

  static Future<void> updateData(
      {required String collection,
      required String docId,
      Map<String, dynamic>? data}) async {
    await firestoreDatabase.collection(collection).doc(docId).set(data ?? {});
  }

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      fetchAllDocsData({
    required String collection,
    required int page,
    required int pageSize,
    required String fieldOrder,
    bool descendingOrder = false,
  }) async {
    if(page<1){
      throw InvalidPageNumberException();
    }
    final limit = page * pageSize;
    final pageStartIndex=(--page)*pageSize;
    print('LIMIT= $limit');
    print('PageStartIndex= $pageStartIndex');
    final querySnapshot = await firestoreDatabase
        .collection(collection)
        .orderBy(fieldOrder, descending: descendingOrder)
        .limit(limit)
        .get();

    return querySnapshot.docs.sublist(pageStartIndex);
  }

  static Future<void> deleteAllCollectionDocs({
    required String collection,
  }) async {
    await firestoreDatabase.collection(collection).get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  static Future<void> deleteSingleCollectionDoc(
      {required String collection, required String docId}) async {
    await firestoreDatabase.collection(collection).doc(docId).delete();
  }
}
