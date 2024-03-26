


import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject{
  @HiveField(0)
  bool isComplete;
  @HiveField(1)
  String title;
  @HiveField(2)
  String detail;

  NoteModel(this.isComplete, this.title, this.detail);
}
