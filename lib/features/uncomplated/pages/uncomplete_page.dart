

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:task_note/data/local/hive_helper.dart';
import 'package:task_note/features/complated/bloc/complete_bloc.dart';
import 'package:task_note/features/complated/bloc/complete_bloc.dart';
import 'package:task_note/features/complated/bloc/complete_bloc.dart';
import 'package:task_note/features/complated/bloc/complete_bloc.dart';
import 'package:task_note/features/complated/bloc/complete_bloc.dart';
import 'package:task_note/features/complated/widgets/note_item_complete.dart';
import 'package:task_note/features/main/bloc/main_bloc.dart';
import 'package:task_note/features/main/widgets/note_item.dart';
import 'package:task_note/features/uncomplated/bloc/uncomplete_bloc.dart';
import 'package:task_note/utils/constants/app_icons.dart';


class UnCompletePage extends StatefulWidget {
  const UnCompletePage({super.key});

  @override
  State<UnCompletePage> createState() => _UnCompletePageState();
}

class _UnCompletePageState extends State<UnCompletePage> {
  var isShow = false;
  var isLogOutShow = false;


  @override
  void initState() {
    super.initState();
    MyHiveHelper.init();
    MyHiveHelper.initNoteHive();
    BlocProvider.of<UnCompleteBloc>(context).add(GetUnCompleteNote());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnCompleteBloc, UnCompleteInitial>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xFFD5D6EE),
          appBar: AppBar(
            backgroundColor: Color(0xFF8C8EC9),
            title: Container(
              child: Row(
                children: [
                  SizedBox(width: 20,),
                  Text("UnCompleted Task",style: GoogleFonts.jost(fontSize:25,fontWeight:FontWeight.w600,color : Colors.white),)
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 24),
                Expanded(
                  child: Stack(
                    children: [
                      ListView.builder(
                        itemCount: state.list.length,
                        itemBuilder: (context, index) {
                          return NoteItemComplete(state.list[index].title,
                              state.list[index].detail);

                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
