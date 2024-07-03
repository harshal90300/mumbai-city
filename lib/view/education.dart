import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mumbai_city/modal/education_modal.dart';

import 'package:http/http.dart' as http;
import 'package:mumbai_city/view/homepage.dart';

class EduactionPage extends StatefulWidget {
  const EduactionPage({super.key});

  @override
  State<EduactionPage> createState() => _EduactionPageState();
}

class _EduactionPageState extends State<EduactionPage> {
  List <Education>?getImages;
  void getEducation()async{
  try{
    var getImage= await http.get(Uri.parse("https://mapi.trycatchtech.com/v3/mumbai/education_data_list_by_category?category_id=1"));
    if (getImage.statusCode==200){
      getImages=Education.getImage(jsonDecode(getImage.body));
      setState(() {
        
      });
    }

  } catch(e){

  }
  }
  @override
  void initState() {
    getEducation();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
             


  appBar: AppBar(
        centerTitle: true,
        leading: IconButton.filled(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage()));} ,icon: Icon(Icons.arrow_back_outlined),color: Colors.white,focusColor: const Color.fromARGB(255, 241, 123, 86),splashColor:  Color.fromARGB(255, 241, 123, 86),),
        actions: [
       IconButton.filled(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage()));}, icon: Icon(Icons.home),color: Colors.white,focusColor: Color.fromARGB(255, 241, 123, 86) ,splashColor:  Color.fromARGB(255, 241, 123, 86),)
        ],
        backgroundColor: Color.fromARGB(255, 37, 41, 41),
        title: Text(" EDUCATION  ",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
      ),

             body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: 
                [
             Color.fromARGB(255, 37, 41, 41),
              Color.fromARGB(255, 61, 60, 61),
            ],
                
                )
              ),
       child: getImages==null ? Center(
                    child:Lottie.asset("assets/Animation - 1716967615661.json",
            fit:BoxFit.contain)
        
       ):GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 10,crossAxisSpacing: 10),itemCount: getImages!.length,
        itemBuilder: (context,i){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Card(
              
                shadowColor: Color.fromARGB(255, 168, 216, 238),
                  elevation: 10,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                      child: Container(
                    decoration: BoxDecoration(
                      
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                       image: DecorationImage(image: AssetImage("assets/education1.jpg"),fit: BoxFit.cover)
                    ),

                      // gradient: LinearGradient(colors: [
                      //   Colors.indigo,
                      //   const Color.fromARGB(255, 77, 74, 74),
                        
                      // ],begin: Alignment.topLeft,
                      // end: Alignment.bottomRight
                      // )
                    
                child: ListTile(
                
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(getImages![i].images??''),
                  ),
                  shape: Border.all(color: Colors.black),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(
                                                                                   decoration: BoxDecoration(
                                                 shape: BoxShape.rectangle,
                         borderRadius: BorderRadius.circular(2),
                                      gradient: LinearGradient(colors: [
                                        Colors.deepOrange,
                                        Color.fromARGB(255, 235, 197, 197)
                                      ]),
                         
                                             border: Border.all(color: Colors.black)
                                           ),
                         
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text('School Name :- ${
                                getImages![i].placeName!}',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                             ),
                           ),
                         ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                         decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                           borderRadius: BorderRadius.circular(2),
                        gradient: LinearGradient(colors: [
                          Colors.grey,
                          Color.fromARGB(255, 177, 204, 218)
                        ]),

                    border: Border.all(color: Colors.black)
                  ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Contact No :- ${getImages![i].contact}",style: TextStyle(color: Color.fromARGB(255, 12, 12, 12),fontWeight: FontWeight.bold,fontSize:19 ),),
                              )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                           borderRadius: BorderRadius.circular(2),
                              gradient: LinearGradient(colors: [
                                const Color.fromARGB(255, 178, 189, 57),
                              Color.fromARGB(255, 231, 241, 142)
                              ]),
                    border: Border.all(color: Colors.black)
                  ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Description :- ${getImages![i].description}",style: TextStyle(
                                  color: const Color.fromARGB(255, 22, 26, 27),fontSize: 15,fontWeight: FontWeight.w700
                                ),),
                              ),
                            ),
                            
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                      decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(2),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 102, 170, 226),
const Color.fromARGB(255, 194, 220, 241)
                    ]),

                    border: Border.all(color: Colors.black)
                  ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Website :- ${getImages![i].website}",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontSize: 18),),
                              )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(2),
                  gradient: LinearGradient(colors: [
                                                   Colors.grey,
                          Color.fromARGB(255, 177, 204, 218)
                  ]),

                    border: Border.all(color: Colors.black)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Address :- ${getImages![i].address}",style:  TextStyle(color: Color.fromARGB(255, 14, 42, 51),fontWeight: FontWeight.bold,fontSize: 18),
                                ),
                              ),
                            ),
                          )
                      ],
                                ),
                  ) )  
                ),
            ),
            )
          );
            
        })

             )
    );
  }
}