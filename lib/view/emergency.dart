import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:mumbai_city/modal/emergency_model.dart';
import 'package:mumbai_city/view/homepage.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({super.key});

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  
    List <Emergency>?getImages;
  void getEmergency()async{
  try{
    var getImage= await http.get(Uri.parse("https://mapi.trycatchtech.com/v3/mumbai/emergency_data_list"));
    if (getImage.statusCode==200){
      getImages=Emergency.getImage(jsonDecode(getImage.body));
      setState(() {
        
      });
    }

  } catch(e){

  }
  }
  @override
  void initState() {
    getEmergency();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
        centerTitle: true,
        leading: IconButton.filled(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage()));} ,icon: Icon(Icons.arrow_back_outlined),color: Colors.white,focusColor: const Color.fromARGB(255, 241, 123, 86),splashColor:  Color.fromARGB(255, 241, 123, 86),),
        actions: [
       IconButton.filled(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage()));}, icon: Icon(Icons.home),color: Colors.white,focusColor: Color.fromARGB(255, 241, 123, 86) ,splashColor:  Color.fromARGB(255, 241, 123, 86),)
        ],
        backgroundColor: Color.fromARGB(255, 37, 41, 41),
        title: Text(" EMERGENCY SERVICES  ",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
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
                  elevation: 10,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  
                      child: Container(
                    decoration: BoxDecoration(
                      
                      gradient: LinearGradient(colors: [
                        const Color.fromARGB(255, 140, 152, 224),
                        
                        Color.fromARGB(255, 247, 159, 159),
                        
                      ],begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                      )
                    ),
                   child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey,
                          border: Border.all(color: Colors.black87),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.topCenter,
                        child: Text('Name :-${getImages![i].title??''}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700),)),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,

                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Container(
                                                  alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle
                            
                          ),
                          child: Text('Numbers :- ${getImages![i].data??''}',style: TextStyle(color: Color.fromARGB(255, 15, 4, 4),fontSize: 18,fontWeight: FontWeight.w700),))
                      ),
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