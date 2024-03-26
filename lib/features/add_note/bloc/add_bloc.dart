import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_note/data/local/hive_helper.dart';
import 'package:task_note/data/model/note_model.dart';

part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {

  AddBloc() : super(AddInitial()) {
    on<AddEvent>((event, emit) {
      try{
        MyHiveHelper.addNote(NoteModel(false, event.title, event.detail));
      }catch(e){
        print(e);
      }
    });
  }
}
