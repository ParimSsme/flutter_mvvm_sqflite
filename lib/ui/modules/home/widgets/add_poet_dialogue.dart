import 'package:flutter/material.dart';
import 'package:sqflite_mvvm_design/ui/widgets/app_text_field.dart';

Dialog AddPoetDialogue() {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
//this right here
    child: Container(
      height: 350.0,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            child: Icon(Icons.person),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          ),
          AppTextField(
              hint: "Enter name",
              onSubmit: (val){}
          ),
          AppTextField(
              hint: "Enter info",
              onSubmit: (val){}
          ),
          Expanded(child: Container()),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 12, right: 6),
                  child: MaterialButton(
                    onPressed: ()=>{},
                    color: Colors.brown,
                    child: Text(
                      "CANCEL",
                      style: TextStyle(fontSize: 12, color: Colors.brown),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 6, right: 12),
                  child: MaterialButton(
                    onPressed: ()=>{},
                    color: Colors.brown,
                    child: Text(
                      "OK",
                      style: TextStyle(fontSize: 12, color: Colors.brown),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}