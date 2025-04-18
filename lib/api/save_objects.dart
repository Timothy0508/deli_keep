import "package:shared_preferences/shared_preferences.dart";

import '../models/note.dart';

void saveNote(Note note) async {
  var prefs = await SharedPreferences.getInstance();
  await prefs.setString(note.id, note.toString());
  List<String> noteIDList = [];
  noteIDList = await getNoteIDList();
  noteIDList.add(note.id);
  prefs.setStringList('noteIDList', noteIDList);
}

Future<Note> getNote(String id) async {
  var prefs = await SharedPreferences.getInstance();
  var result = prefs.getString(id) ?? 'Error fetching data'; //Safe check.
  return Note.fromJson(result);
}

Future<List<String>> getNoteIDList() async {
  var prefs = await SharedPreferences.getInstance();
  var noteIDList = prefs.getStringList('noteIDList') ?? [];
  return noteIDList;
}

Future<List<Note>> getALlNotes() async {
  var prefs = await SharedPreferences.getInstance();
  List<String> noteIDList = await getNoteIDList();
  List<Note> notes = List.generate(
    noteIDList.length,
    (i) => Note.fromJson(prefs.getString(noteIDList[i]) ?? ""),
  );
  return notes;
}
