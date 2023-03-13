import 'package:cantwait28/models/item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemRepository {
  Stream<List<ItemModel>> getItemsStream() {
    return FirebaseFirestore.instance
        .collection('items')
        .orderBy('release_date')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return ItemModel(
          id: doc.id,
          title: doc['title'],
          imgUrl: doc['image_url'],
          realeasedata: (doc['release_date'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }

  Future<void> delete({required String id}) async {
    await FirebaseFirestore.instance.collection('items').doc(id).delete();
  }
}
