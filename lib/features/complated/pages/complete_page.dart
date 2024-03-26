

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
import 'package:task_note/utils/constants/app_icons.dart';


class CompletePage extends StatefulWidget {
  const CompletePage({super.key});

  @override
  State<CompletePage> createState() => _CompletePageState();
}

class _CompletePageState extends State<CompletePage> {
  var isShow = false;
  var isLogOutShow = false;


  @override
  void initState() {
    super.initState();
    MyHiveHelper.init();
    MyHiveHelper.initNoteHive();
    BlocProvider.of<CompleteBloc>(context).add(GetCompleteNote());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompleteBloc, CompleteInitial>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xFFD5D6EE),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFF8C8EC9),
            title: Container(
              child: Row(
                children: [
                  Icon(Icons.arrow_back_outlined,color: Colors.white,),
                  SizedBox(width: 20,),
                  Text("Completed Task",style: GoogleFonts.jost(fontSize:25,fontWeight:FontWeight.w600,color : Colors.white),)
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
                      BlocBuilder<CompleteBloc, CompleteInitial>(
                        builder: (context, state) {
                          return ListView.builder(
                            itemCount: state.list.length,
                            itemBuilder: (context, index) {
                              return NoteItemComplete(state.list[index].title, state.list[index].detail);
                            },
                          );
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
