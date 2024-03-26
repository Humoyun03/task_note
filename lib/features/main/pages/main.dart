

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:task_note/data/local/hive_helper.dart';
import 'package:task_note/features/main/bloc/main_bloc.dart';
import 'package:task_note/features/main/widgets/note_item.dart';
import 'package:task_note/utils/constants/app_icons.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var isShow = false;
  var isLogOutShow = false;


  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.pushNamed(context, 'main');
          break;
        case 1:
          Navigator.pushNamed(context, 'unComplete');
          break;
        case 2:
          Navigator.pushNamed(context, 'complete');
          break;
      }
    });
  }
  @override
  void initState() {
    super.initState();
    MyHiveHelper.init();
    MyHiveHelper.initNoteHive();
    BlocProvider.of<MainBloc>(context).add(GetAllNote());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainInitial>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xFFD5D6EE),
          // appBar: AppBar(
          //   title: Expanded(
          //
          //   ),
          // ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Color(0xFF8C8EC9),
            selectedFontSize: 15,
            selectedLabelStyle: GoogleFonts.jost(fontSize: 12, color: Color(0xFF8C8EC9)),
            unselectedLabelStyle: GoogleFonts.jost(fontSize: 12, color: Colors.grey),
            unselectedFontSize: 15,
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(AppIcons.allNote),
                label: "All",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppIcons.unComplete),
                label: "UnCompleted",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppIcons.complete),
                label: "Completed",
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                 Container(
                  color: Color(0xFF8C8EC9),
                  height: 56,
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TODO APP',
                          style: GoogleFonts.jost(
                            color:  Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Image.asset(AppIcons.calendar, height: 50,)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Stack(
                    children: [
                      ListView.builder(
                        itemCount: state.list.length,
                        itemBuilder: (context, index) {
                          return NoteItem(state.list[index].title,
                              state.list[index].detail, () {
                            BlocProvider.of<MainBloc>(context)
                                .add(DeleteNote(state.list[index]));
                          }, () {
                            BlocProvider.of<MainBloc>(context).add(
                                MoveToEdit(
                                    context,
                                    state.list[index]));
                          },(){
                                BlocProvider.of<MainBloc>(context).add(CompleteNote(state.list[index]));
                              });
                        },
                      ),
                      Positioned(
                          bottom: 17,
                          right: 17,
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(33))),
                            child: InkWell(
                              onTap: () {
                                BlocProvider.of<MainBloc>(context)
                                    .add(MoveToAdd(context));
                              },
                              child: Container(
                                width: 66,
                                height: 66,
                                clipBehavior: Clip.antiAlias,
                                decoration: const ShapeDecoration(
                                    color: Color(0xFF8C8EC9), shape: OvalBorder()),
                                child: const Center(


                                  child:   Icon(Icons.add, color: Colors.white,)

                                ),
                              ),
                            ),
                          )),
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
