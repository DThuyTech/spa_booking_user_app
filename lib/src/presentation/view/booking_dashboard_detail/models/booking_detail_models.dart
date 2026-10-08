class DetailServiceItem {
  final String name;
  final String duration;
  final String price;

  const DetailServiceItem({
    required this.name,
    required this.duration,
    required this.price,
  });
}

class DetailUserNoteItem {
  final String timestamp;
  final String note;

  const DetailUserNoteItem({required this.timestamp, required this.note});
}
