class Dictionary {
  int? id;
  String? word;
  String? mean;

  Dictionary({this.id, this.word, this.mean});

  factory Dictionary.fromMap(Map<String, dynamic> data) {
    return Dictionary(
      id: data['id'],
      word: data['tu'],
      mean: data['nghia']);
  }
}
