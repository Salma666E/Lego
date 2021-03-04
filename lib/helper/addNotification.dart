import 'package:cloud_firestore/cloud_firestore.dart';

Firestore firestore = Firestore.instance;

Future<int> getBagArrayLength(String documentId) async {
  DocumentSnapshot snapshot =
      await firestore.collection('bags').document(documentId).get();
  return snapshot.data['productsIDs'].length;
}
Future<List<String>> getWishListArray(String documentId) async {

  DocumentSnapshot snapshot =
      await firestore.collection('wishlist').document(documentId).get();
  List<String> productsIDs = List.from(snapshot.data['productsIDs']);
  print('productsIDs: ' + productsIDs.toString());
  return productsIDs;
}

// Future getWishListArray(String documentId) async {
//   var documents =
//       (await Firestore.instance.collection('wishlist').getDocuments())
//           .documents;
//   print("productsIDs:  " + documents[0].data['productsIDs'].toString());
//   // wishList = documents[0].data['productsIDs'] as List<String>;
//   return List.from(documents[0].data['productsIDs'].map((x) => x.toString()));
// }
