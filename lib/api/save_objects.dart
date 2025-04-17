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

Future<String> getNote(String id) async {
  var prefs = await SharedPreferences.getInstance();
  var result = prefs.getString(id) ?? 'Error fetching data'; //Safe check.
  return result;
}

Future<List<String>> getNoteIDList() async {
  var prefs = await SharedPreferences.getInstance();
  var noteIDList = prefs.getStringList('noteIDList') ?? [];
  return noteIDList;
}
