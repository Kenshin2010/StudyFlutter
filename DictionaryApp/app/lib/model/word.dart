class Word {
  int? id;
  String? word;
  String? mean;
  int? isSaved;

  Word({this.id, this.word, this.mean, this.isSaved});

  factory Word.fromMap(Map<String, dynamic> data) {
    return Word(
        id: data['id'],
        word: data['tu'],
        mean: data['nghia'],
        isSaved: data['isSaved']
    );
  }

  toMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id!;
    mapping['tu'] = word!;
    mapping['nghia'] = mean!;
    mapping['isSaved'] = isSaved!;
    return mapping;
  }
}
