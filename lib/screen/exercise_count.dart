import 'dart:async';
import 'package:fitness_app/model/model.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

import 'details_page.dart';
class ExerciseCount extends StatefulWidget {
  int ?second;
  int ?index;
  Model ?model;
  ExerciseCount({super.key, this.index, this.model, this.second});

  @override
  State<ExerciseCount> createState() => _ExerciseCountState();
}



class _ExerciseCountState extends State<ExerciseCount> {
  // int timer = 1;
  int startTime = 1;
  bool isDone = false;
   showDia(){
    return showDialog(context: context, builder: (_){
      return AlertDialog(
        title: Row(
          children: [
             Text('Your Task Completed', style: GoogleFonts.roboto(),),
            const Icon(Icons.done),
          ],
        ),
        actions: [
          MaterialButton(
            color: Colors.blue.shade200,
            child:  Text('Exit', style: GoogleFonts.roboto(),),
            onPressed: (){
            Navigator.pop(context);
            Navigator.pop(context);

          }),
          
           MaterialButton(
             color: Colors.blue.shade200,
            child:  Text('Aonter set', style: GoogleFonts.roboto(),),
            onPressed: (){
       count();
     Navigator.pop(context);

          })
        ],
      );
    });
  }
  count(){
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(timer.tick-1==widget.second){
        print("doneeeeeeeeeeeeeeeeeeeeeeeee");
        timer.cancel();
         showDia();
           setState(() {
             
        });

      }
      
      else{
        setState(() {
          startTime=timer.tick;
        });

      }
      
    });
   
  }

  @override
  void initState() {
      count();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Your Excercise', style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black45,
                  )),
                  const Icon(Icons.add),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.shade200,
                      offset: const Offset(0, 0),
                      blurRadius: .5,
                      blurStyle: BlurStyle.outer
                    )
                  ],
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("${widget.model!.exercises![widget.index!].gif}")
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.timer_outlined, size: 35,),
                  const SizedBox(
                    width: 20,
                  ),
                   Text('Timer', style: GoogleFonts.roboto(
                    
                    fontSize: 45,
                  ),),
                 
                 
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             Text(startTime.toString(), style:  GoogleFonts.roboto(
              fontSize: 60,
             ),),
          ],
        ),
      )
    );
  }
}