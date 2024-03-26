

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_note/data/model/note_model.dart';

class MyHiveHelper {

  static Future<void> initNoteHive() async {
    await Hive.openBox<NoteModel>("note");
  }

  static Future<void> init() async {
    final dir = await getApplicationCacheDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(NoteModelAdapter());
    await initNoteHive();
  }

  static Future<bool> addNote(NoteModel noteModel) async {
    try {
      final box = Hive.box<NoteModel>("note");
      box.add(noteModel);
      return true;
    } on HiveError catch (e) {
      return false;
    }
  }

  static Future<List<NoteModel>> getAllCompleteNotes() async {
    final box = Hive.box<NoteModel>("note");
    List<NoteModel> completeNotes = [];

    for (int i = 0; i < box.length; i++) {
      NoteModel noteModel = box.getAt(i)!;
      if (noteModel.isComplete) {
        completeNotes.add(noteModel);
      }
    }

    return completeNotes;
  }


  static Future<List<NoteModel>> getAllUnCompleteNotes() async {
    final box = Hive.box<NoteModel>("note");
    List<NoteModel> unCompleteNotes = [];

    for (int i = 0; i < box.length; i++) {
      NoteModel noteModel = box.getAt(i)!;
      if (!noteModel.isComplete) {
        unCompleteNotes.add(noteModel);
      }
    }

    return unCompleteNotes;
  }


  static Future<bool> editNote(NoteModel noteModel) async {
    try {
      final box = Hive.box<NoteModel>("note");
      if (box.containsKey(noteModel.key)) {
        await box.put(noteModel.key, noteModel);
        return true;
      } else {
        throw HiveError('This object is currently not in a box.');
      }
    } on HiveError catch (e) {
      print("$e       ||  ##############################");
      return false;
    }
  }

  static Future<List<NoteModel>> getAllNotes() async {
    final box = Hive.box<NoteModel>("note");
    return box.values.cast<NoteModel>().toList();
  }


  static Future<bool> deleteNote(NoteModel noteModel) async {
    try {
      final box = Hive.box<NoteModel>("note");
      await box.delete(noteModel.key);
      return true;
    } on HiveError catch (e) {
      return false;
    }
  }

  static Future<bool> deleteCompleteNote(NoteModel noteModel) async {
    try {
      final box = Hive.box<NoteModel>("complete_note");
      await box.delete(noteModel.key);
      return true;
    } on HiveError catch (e) {
      return false;
    }
  }
}

