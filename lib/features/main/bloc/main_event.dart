part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}


class MoveToAdd extends MainEvent{
  final BuildContext context;
  MoveToAdd(this.context);
}

class MoveToEdit extends MainEvent{
  final BuildContext context;
  final NoteModel noteModel ;

  MoveToEdit(this.context , this.noteModel);
}

class DeleteNote extends MainEvent{
  final NoteModel noteModel;
  DeleteNote(this.noteModel);
}
class CompleteNote extends MainEvent{
  final NoteModel noteModel;
  CompleteNote(this.noteModel);
}
class GetAllNote extends MainEvent{}
