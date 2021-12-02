class Todo extends Comparable {
  int? id;
  String? description;
  DateTime dateTime = DateTime.now();

  Todo({required this.description});

  Todo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    description = map['description'];
    dateTime = DateTime.tryParse(map['dateTime']) ?? DateTime.now();
  }

  Todo.toTest({this.id, required this.dateTime, this.description});

  Map<String, dynamic> toMap() {
    return {
      "description": description,
      "dateTime": dateTime.toString(),
    };
  }

  @override
  int compareTo(other) {
    return other.dateTime.compareTo(dateTime);
  }
}
