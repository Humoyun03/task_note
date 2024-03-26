
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_note/data/model/note_model.dart';
import 'package:task_note/data/model/note_model.dart';
import 'package:task_note/features/add_note/bloc/add_bloc.dart';
import 'package:task_note/features/edit_note/bloc/edit_bloc.dart';
import 'package:task_note/features/edit_note/widgets/InputText.dart';


class AddNoteScreen extends StatefulWidget {
  // AddNoteScreen(String name, String phone, {super.key});


  AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

var _controllerTitle = TextEditingController();
var _controllerDetail = TextEditingController();

class _AddNoteScreenState extends State<AddNoteScreen> {




  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF8C8EC9),
        title: Container(
          child: Row(
            children: [

              Icon(Icons.arrow_back_outlined,color: Colors.white,),
              SizedBox(width: 20,),
              Text("Add Task",style: GoogleFonts.jost(fontSize:25,fontWeight:FontWeight.w600,color : Colors.white),)
            ],
          ),
        ),
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
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
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

                    if (_controllerDetail.text.length >= 1 &&
                        _controllerTitle.text.length >= 1) {
                      BlocProvider.of<AddBloc>(context).add(AddEvent(_controllerTitle.text,  _controllerDetail.text));
                      _controllerTitle.clear();
                      _controllerDetail.clear();
                      Navigator.of(context).pushNamedAndRemoveUntil('main', (route) => false);
                    } else {

                    }
                  },
                  child: Text(
                    'Add',
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
      ),
    );
  }
}
