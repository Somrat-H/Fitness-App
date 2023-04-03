import 'dart:async';
import 'dart:convert';
import 'package:fitness_app/model/model.dart';
import 'package:fitness_app/screen/details_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Model? model;
  // List<Exercises> myList= [];
  Future<Model> getData() async {
    var response = await http.get(Uri.parse(
        "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json?fbclid=IwAR2dcq-xBH13wH4pKR7VYlEy3NMWcU9cL5ySVNtCyvY9YiTNNQI54x-kT-M"));
    var reponseDate = jsonDecode(response.body);
    model = Model.fromJson(reponseDate);
    // print(reponseDate);
    return model!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        backgroundColor: const Color(0xffFBFCFF),
        body: SafeArea(
      child: Column(
        children: [
         Padding(
           padding: const EdgeInsets.all(12.0),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text('Fitness App', style: GoogleFonts.roboto(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w700,
               ),),
               const Icon(Icons.filter_list_outlined, size: 30,),
             ],
           ),
         ),
         Padding(
           padding: const EdgeInsets.only(left: 14),
           child: Align(
            alignment: Alignment.topLeft,
             child: Text('Live with healthy life', style: GoogleFonts.roboto(
              fontSize: 18,
              color: Colors.black45
             ),),
           ),
         ),
         const SizedBox(
          height: 20,
         ),
         Expanded(
           child: FutureBuilder<Model>(
              future: getData(),
              builder: (context, snapshot) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: model!.exercises!.length,
                    // itemCount: 3,
                    itemBuilder: ((context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => DetailsPage(
                                          index: index,
                                          model: model,
                                        ))));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                               color: Colors.white,
                               boxShadow: [
                                BoxShadow(
                                  color: Colors.deepPurple.shade100,
                                  offset: const Offset(0, 1),
                                  blurRadius: .5,
                                ),
                                BoxShadow(
                                  color: Colors.deepPurple.shade50,
                                  offset: const Offset(0, 0),
                                  blurRadius: .10,
                                )
                               ],
                                  borderRadius:  BorderRadius.circular(15),
                                  // image: DecorationImage(
                                  //     fit: BoxFit.fill,
                                  //     image: NetworkImage(
                                  //         "${snapshot.data!.exercises![index].thumbnail}"))
                                  ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                         
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${snapshot.data!.exercises![index].title}",
                                              maxLines: 2,
                                             textDirection: TextDirection.ltr,
                                              
                                              style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Text('10 Mintues', style: GoogleFonts.roboto(
                                                  color: Colors.black45,
                                                  
                                                ),),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Icon(Icons.timer_outlined),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                     
                                      height: 140,
                                      width: 160,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            "${snapshot.data!.exercises![index].thumbnail}"))
                              
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )));
              }),
         ),
        ]
      ),
    ));
  }
}
