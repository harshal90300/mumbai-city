import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:mumbai_city/modal/car_modal.dart';
import 'package:mumbai_city/view/homepage.dart';


class CarRent extends StatefulWidget {
  const CarRent({super.key});

  @override
  State<CarRent> createState() => _CarRentState();
}

class _CarRentState extends State<CarRent> {
  List <Car>?getImages;
  void getCar()async{
  try{
    var getImage= await http.get(Uri.parse("https://mapi.trycatchtech.com/v3/mumbai/cars_on_rent_data_list"));
    if (getImage.statusCode==200){
      getImages=Car.getImage(jsonDecode(getImage.body));
      setState(() {
        
      });
    }

  } catch(e){

  }
  }
  @override
  void initState() {
    getCar();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar:      AppBar(
        centerTitle: true,
        leading: IconButton.filled(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage()));} ,icon: Icon(Icons.arrow_back_outlined),color: Colors.white,focusColor: const Color.fromARGB(255, 241, 123, 86),splashColor:  Color.fromARGB(255, 241, 123, 86),),
        actions: [
       IconButton.filled(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage()));}, icon: Icon(Icons.home),color: Colors.white,focusColor: Color.fromARGB(255, 241, 123, 86) ,splashColor:  Color.fromARGB(255, 241, 123, 86),)
        ],
        backgroundColor: Color.fromARGB(255, 37, 41, 41),
        title: Text(" Rental Cars  ",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
      ),
            
             body:
             
             
             
              Container(
              
              decoration: BoxDecoration(
              //  image: DecorationImage(image: AssetImage("assets\car1.jpg"),),
                gradient: LinearGradient(colors: 
               [
             Color.fromARGB(255, 113, 234, 236),
               Color.fromARGB(255, 239, 105, 217),
             ],
                
               )
              ),
       child: getImages==null ? Center(
                    child:Lottie.asset("assets/Animation - 1716967615661.json",
                    repeat: true,
            fit:BoxFit.contain)
        
       ):GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 10,crossAxisSpacing: 10),itemCount: getImages!.length,
        itemBuilder: (context,i){
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),     
            child: Container(
                                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                       image: DecorationImage(image: AssetImage("assets/car1.jpg"),fit: BoxFit.cover)
                    ),
              child: ListTile(
                 
                    title: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                      alignment: Alignment.center,
                      width: 30,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: 
                        [
                           Color.fromARGB(255, 4, 39, 78),
                          Colors.black38
                        ]
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Car Name :- ${getImages![i].personName??''}',style: TextStyle(color: Colors.white),),
                      )),
                   ),
                subtitle: Column(
                  
                  children: [
                  SizedBox(
                    height: 15,
                  ),
                  
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Email Id :-${getImages![i].personEmail ??''}',style: TextStyle(color: Colors.white),
                      
                      ),
                    ),decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.black),
                        
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: 
                        [
                           Color.fromARGB(255, 113, 234, 236),
                          Colors.black
                        ]
                        )
                    ),
                    
                    ),
                  SizedBox(height: 15,),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.black),
                        
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: 
                        [
                          Color.fromARGB(255, 4, 39, 78),
                          Colors.black38
                        ]
                        )
                    ),
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Contact No :-  ${getImages![i].contactNumber ??''}',style: TextStyle(color: Colors.white),),
                  )),   
                    SizedBox(height: 270,),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.black),
                        
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: 
                        [
                          Color.fromARGB(255, 250, 100, 31),
                          Colors.black38
                        ]
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Car Type :-  ${getImages![i].carTypes??''}',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
                    )),
                           
                           
                  ]   
                      ),
                
                  
              
                         ),
            ) );
        })

             )
    );
  }
}