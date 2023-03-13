class ItemModel {
  ItemModel({
    required this.title,
    required this.imgUrl,
    required this.realeasedata,
    required this.id,
  });

  final String title;
  final String imgUrl;
  final DateTime realeasedata;
  final String id;

  String daysleft() {
    return realeasedata.difference(DateTime.now()).inDays.toString();
  }
}
