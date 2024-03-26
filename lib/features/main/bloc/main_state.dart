part of 'main_bloc.dart';


class MainInitial {
  final List<NoteModel> list;

  MainInitial(this.list);

  MainInitial copyWith(List<NoteModel>? list) =>
      MainInitial(list?? this.list);
}
