import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mumbai_city/modal/bus_model.dart';
import 'package:http/http.dart' as http;
import 'package:mumbai_city/view/homepage.dart';


class BusPage extends StatefulWidget {
  const BusPage({super.key});

  @override
  State<BusPage> createState() => _BusPageState();
}

class _BusPageState extends State<BusPage> {

    List <Bus>?getImages;
  void getBus()async{
  try{
    var getImage= await http.get(Uri.parse("https://mapi.trycatchtech.com/v3/mumbai/bus_schedule_data_list"));
    if (getImage.statusCode==200){
      getImages=Bus.getImage(jsonDecode(getImage.body));
      setState(() {
        
      });
    }

  } catch(e){

  }
  }
  @override
  void initState() {
    getBus();
    // TODO: implement initState
    super.initState();
  }
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold (
       
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton.filled(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage()));} ,icon: Icon(Icons.arrow_back_outlined),color: Colors.white,focusColor: const Color.fromARGB(255, 241, 123, 86),splashColor:  Color.fromARGB(255, 241, 123, 86),),
        actions: [
       IconButton.filled(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage()));}, icon: Icon(Icons.home),color: Colors.white,focusColor: Color.fromARGB(255, 241, 123, 86) ,splashColor:  Color.fromARGB(255, 241, 123, 86),)
        ],
        backgroundColor: Color.fromARGB(255, 37, 41, 41),
        title: Text(" M Indicator  ",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
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
              child: getImages==null ?Center(
                  child:Lottie.asset("assets/Animation - 1716967615661.json",
            fit:BoxFit.contain)):GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8),itemCount: getImages!.length,
        itemBuilder: (context,i){
               return Card(
                   shadowColor: Color.fromARGB(255, 168, 216, 238),
                  elevation: 8,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                      child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.indigo,
                        const Color.fromARGB(255, 77, 74, 74),
                        
                      ],begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                      )
                    ),
                      child: Container(
                               decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage("assets/best1.jpg"),fit: BoxFit.cover),
                               ),
                        child: ListTile(
                          
                           title: Container(
                                  decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.black),
                        
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: 
                        [
                           Color.fromARGB(255, 113, 234, 236),
                                              const Color.fromARGB(255, 236, 225, 225)
                        ]
                        )
                                            ),
                                  
                            child: Text('BUS ROUTE :- ${getImages![i].title??''}',style:  TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),)
                            
                            ),
                            
                            
                            
                          subtitle: Container(
                            
                                               
                                                              decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                                      border: Border.all(color: Colors.black),
                                                      
                                                      borderRadius: BorderRadius.circular(10),
                                                      gradient: LinearGradient(colors: 
                                                      [
                           Color.fromARGB(255, 113, 234, 236),
                          const Color.fromARGB(255, 236, 225, 225)
                                                      ]
                                                      )
                                            ),
                                            
                            child: Text('Bus Timing :-${getImages![i].data??''}',style:  TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),)),
                        ),
                      ),
               )
               
              );

        }
              )
          


        )

    );
  }
}