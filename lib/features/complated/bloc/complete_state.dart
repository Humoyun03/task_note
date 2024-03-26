part of 'complete_bloc.dart';

class CompleteInitial {
  final List<NoteModel> list;

  CompleteInitial(this.list);

  CompleteInitial copyWith(List<NoteModel>? list) =>
      CompleteInitial(list?? this.list);
}
