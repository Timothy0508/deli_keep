import 'dart:convert';

///The data structure to store notes.
///
/// `const Note({
///     required this.id,
///     required this.title,
///     required this.body,
///     this.date,
///     this.stared,
///   });`
///
/// Use [Note.fromJson] to read notes from json.
/// Use [toString] to convert [Note] into json format string.
class Note {
  final String title;

  final String body;

  final DateTime? date;

  final bool? stared;

  final String id;

  const Note({
    required this.id,
    required this.title,
    required this.body,
    this.date,
    this.stared,
  });

  @override
  String toString() {
    Map map = {
      'id': id,
      'title': title,
      'body': body,
      'date': date,
      'stared': stared,
    };

    return jsonEncode(map);
  }

  factory Note.fromJson(String json) {
    try {
      Map data = jsonDecode(json);
      return Note(
        id: data['id'],
        title: data['title'],
        body: data['body'],
        date: data['date'],
        stared: data['stared'],
      );
    } catch (e) {
      throw Exception('Error on decoding json data. On error: $e');
    }
  }
}
