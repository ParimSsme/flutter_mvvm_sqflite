import 'package:flutter/material.dart';

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
            child: Image.asset(
              "assets/images/water1.jpg",
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            width: 200,
            padding: EdgeInsets.symmetric(horizontal: 8),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                    },
                    child:Image.asset("assets/images/subtraction.png",width: 30,height: 30,)),
                Text(
                  "1",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown),
                ),
                GestureDetector(
                    onTap: () {
                    },
                    child:Image.asset("assets/images/add.png",width: 30,height: 30,)),
              ],
            ),
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