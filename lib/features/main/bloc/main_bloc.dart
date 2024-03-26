import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_note/data/local/hive_helper.dart';
import 'package:task_note/data/model/note_model.dart';
import 'package:task_note/features/edit_note/bloc/edit_bloc.dart';
import 'package:task_note/features/edit_note/pages/edit_note.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainInitial> {
  MainBloc() : super(MainInitial(List.empty())) {

    on<MoveToAdd>((event, emit) {
      Navigator.pushNamed(event.context, 'add');
    });

    on<MoveToEdit>((event, emit) {
      Navigator.push(
          event.context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => EditBloc(),
                    child: EditNoteScreen(NoteModel(event.noteModel.isComplete,event.noteModel.title ?? "", event.noteModel.detail?? "")),
                  )));
    });
    on<CompleteNote>((event, emit) async {
      event.noteModel.isComplete = true;
      await event.noteModel.save();
      emit(state.copyWith(await MyHiveHelper.getAllNotes()));
    });
    on<DeleteNote>((event, emit) async {
      MyHiveHelper.deleteNote(event.noteModel);
      emit(state.copyWith(await MyHiveHelper.getAllNotes()));
    });
    on<GetAllNote>((event, emit) async {
      emit(state.copyWith(await MyHiveHelper.getAllNotes()));
    }
    );
  }
}
