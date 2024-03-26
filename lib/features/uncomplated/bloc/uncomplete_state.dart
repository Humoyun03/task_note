part of 'uncomplete_bloc.dart';

class UnCompleteInitial {
  final List<NoteModel> list;

  UnCompleteInitial(this.list);

  UnCompleteInitial copyWith(List<NoteModel>? list) =>
      UnCompleteInitial(list?? this.list);
}
