import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_note/data/local/hive_helper.dart';
import 'package:task_note/data/model/note_model.dart';

part 'edit_event.dart';
part 'edit_state.dart';

class EditBloc extends Bloc<EditEvent, EditInitial> {
  EditBloc() : super(EditInitial(false)) {

    on<EditEvent>((event, emit) async{
      try{
        MyHiveHelper.editNote(event.noteModel);
      }catch(e){
        print(e);
      }
    });
  }
}
