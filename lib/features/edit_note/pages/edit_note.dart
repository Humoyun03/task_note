
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_note/data/local/hive_helper.dart';
import 'package:task_note/data/model/note_model.dart';
import 'package:task_note/data/model/note_model.dart';
import 'package:task_note/features/edit_note/bloc/edit_bloc.dart';
import 'package:task_note/features/edit_note/widgets/InputText.dart';


class EditNoteScreen extends StatefulWidget {
  // EditNoteScreen(String name, String phone, {super.key});
  NoteModel noteModel ;

  EditNoteScreen(this.noteModel);

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState(noteModel);
}

var _controllerTitle = TextEditingController();
var _controllerDetail = TextEditingController();

class _EditNoteScreenState extends State<EditNoteScreen> {

  NoteModel noteModel ;

  _EditNoteScreenState(this.noteModel);
  @override
  void initState() {
    _controllerDetail.text = noteModel.detail;
    _controllerTitle.text = noteModel.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8C8EC9),
        actions: [

        ],
        title:Row(
          children: [
            SizedBox(width: 20,),
            Text("Edit Task",style: GoogleFonts.jost(fontSize:25,fontWeight:FontWeight.w600, color : Colors.white),)
          ],
        ) ,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 34),
            InputText("Title", TextInputType.text, _controllerTitle, "",20),
            const SizedBox(height: 24),
            InputText(
                "Details", TextInputType.text, _controllerDetail, "",45),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width/2-40,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF8C8EC9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: InkWell(
                      onTap: () async {

                        widget.noteModel.title = _controllerTitle.text;
                        widget.noteModel.detail = _controllerDetail.text;


                        BlocProvider.of<EditBloc>(context).add(EditEvent((NoteModel(false,_controllerTitle.text,_controllerDetail.text))));
                        Navigator.of(context).pushNamedAndRemoveUntil('main', (route) => false);

                      },
                      child: Text(
                        'Update',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width/2-40,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF8C8EC9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: InkWell(
                      onTap: () async {
                          Navigator.of(context).pushNamedAndRemoveUntil('main', (route) => false);
                      },
                      child: Text(
                        'Cancel',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
