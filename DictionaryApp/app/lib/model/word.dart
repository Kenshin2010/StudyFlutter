class Word {
  int? id;
  String? word;
  String? mean;

  Word({this.id, this.word, this.mean});

  factory Word.fromMap(Map<String, dynamic> data) {
    return Word(
      id: data['id'],
      word: data['tu'],
      mean: data['nghia']);
  }

  factory Word.fromMap2(Map<String, dynamic> data) {
    return Word(
        id: data['id'],
        word: data['word'],
        mean: data['mean']);
  }

  toMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id!;
    mapping['word'] = word!;
    mapping['mean'] = mean!;
    return mapping;
  }
}
