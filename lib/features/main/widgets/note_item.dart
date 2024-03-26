import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_note/utils/constants/app_icons.dart';

Widget NoteItem(String title, String desc, void Function() onDelete, void Function() onEdit, void Function() onComplete) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title.toUpperCase(),
                  style: GoogleFonts.nunito(
                    color: Color(0xFF9FA1D7),
                    fontSize: 14,

                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                Opacity(
                  opacity: 0.50,
                  child: Text(
                    desc.toUpperCase(),
                    style: GoogleFonts.nunito(
                      color: const Color(0xFF333333),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
               behavior:  HitTestBehavior.opaque,
                onTap: (){
                  onEdit();
                },
                child: Image.asset(AppIcons.pencil)),
            SizedBox(width: 20,),
            GestureDetector(
                behavior:  HitTestBehavior.opaque,
                onTap: (){
                  onDelete();
                },
                child: Image.asset(AppIcons.trash)),
            SizedBox(width: 20,),
            GestureDetector(
                behavior:  HitTestBehavior.opaque,
                onTap: (){
                  onComplete();
                },
                child: Image.asset(AppIcons.checkCircle)),
            SizedBox(width: 20,),
          ],
        ),
      ),
    ),
  );
}