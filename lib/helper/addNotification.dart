import 'package:cloud_firestore/cloud_firestore.dart';

Firestore firestore = Firestore.instance;

Future<int> getBagArrayLength(String documentId) async {
  DocumentSnapshot snapshot =
      await firestore.collection('bags').document(documentId).get();
  return snapshot.data['productsIDs'].length;
}

Future<int> getWishListArrayLength(String documentId) async {
  DocumentSnapshot snapshot =
      await firestore.collection('bwishlistags').document(documentId).get();
  return snapshot.data['productsIDs'].length;
}
