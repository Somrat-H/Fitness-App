
import 'package:fitness_app/model/model.dart';
import 'package:fitness_app/screen/exercise_count.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class DetailsPage extends StatefulWidget {
  int? index;
  Model? model;
  DetailsPage({Key? key, this.index, this.model}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {


  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.black54),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(Icons.arrow_back_ios),
                        ),
                      ),
                    ),
                    Text("Training Jourenys", style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black45
             
                    ),),
                    const CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(Icons.menu, color: Colors.white,)),
                  ],
                ),
             ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height ,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black54
                      // image: DecorationImage(
                      //     fit: BoxFit.fill,
                      //     image: NetworkImage(
                      //       "${widget.model!.exercises![widget.index!].thumbnail}",
                      //     ))
                      ),
                  child: Column(
                    
                    children: [
                     
                      Container(
                        height: MediaQuery.of(context).size.height * 0.30,
                        decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
               image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          "${widget.model!.exercises![widget.index!].thumbnail}",
                        ))
                        ),
                      
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text("${widget.model!.exercises![widget.index!].title}", style: GoogleFonts.roboto(
                                fontSize: 35,
                                color: Colors.white
                              ), ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.green.shade400,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(Icons.timer_outlined),
                                    Text('16 min', style: GoogleFonts.roboto(),),
                                  ],
                                ),
                              ),
                      
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SleekCircularSlider(
                                onChange: (e) {
                                  value = e.toInt();
                                },
                                innerWidget: (e) {
                                  return Center(
                                    child: Text(
                                      value.toString(),
                                      style: const TextStyle(color: Colors.white, fontSize: 35),
                                    ),
                                  );
                                },
                                appearance: CircularSliderAppearance(
                                    customWidths: CustomSliderWidths(progressBarWidth: 10)),
                                min: 1,
                                max: 100,
                                initialValue: 5,
                              ),
                            ),
                            InkWell(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ExerciseCount(
                            index: widget.index,
                            model: widget.model,
                            second: value,
                                  
                                              )));
                                              
                                              
                                            },
                                            child: Container(
                                              height: 60,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                                              ),
                                              child: Center(child: Text('Get Start', style: GoogleFonts.roboto(
                                                fontSize: 20
                                              ),)),
                                            ),
                                          ),
                          ],
                        ),
                      ),
                      
                    ],
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

