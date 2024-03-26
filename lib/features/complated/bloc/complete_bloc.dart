

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task_note/data/local/hive_helper.dart';
import 'package:task_note/data/model/note_model.dart';

part 'complete_event.dart';
part 'complete_state.dart';

class CompleteBloc extends Bloc<CompleteEvent, CompleteInitial> {
  CompleteBloc() : super(CompleteInitial(List.empty())) {
    on<BackToMain>((event, emit) {
      Navigator.pop(event.context);
    });

    on<GetCompleteNote>((event, emit) async {
      emit(state.copyWith(await MyHiveHelper.getAllCompleteNotes()));
    }
    );
  }
}
