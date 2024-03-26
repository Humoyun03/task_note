

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task_note/data/local/hive_helper.dart';
import 'package:task_note/data/model/note_model.dart';

part 'uncomplete_event.dart';
part 'uncomplete_state.dart';

class UnCompleteBloc extends Bloc<UnCompleteEvent, UnCompleteInitial> {
  UnCompleteBloc() : super(UnCompleteInitial(List.empty())) {
    on<BackToMain>((event, emit) {
      Navigator.pop(event.context);
    });

    on<GetUnCompleteNote>((event, emit) async {
      emit(state.copyWith(await MyHiveHelper.getAllUnCompleteNotes()));
    }
    );
  }
}
