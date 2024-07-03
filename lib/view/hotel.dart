import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mumbai_city/modal/hotel_modal.dart';

import 'package:http/http.dart' as http;
import 'package:mumbai_city/view/homepage.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
    List <Hotel>?getImages;
  void getHotel()async{
  try{
    var getImage= await http.get(Uri.parse("https://mapi.trycatchtech.com/v3/mumbai/hotels_data_list_by_category?category_id=3"));
    if (getImage.statusCode==200){
      getImages=Hotel.getImage(jsonDecode(getImage.body));
      setState(() {
        
      });
    }

  } catch(e){

  }
  }
  @override
  void initState() {
    getHotel();
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
        
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            
            Text(" HOTEL  ",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
          ],
        ),
      ),
             body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: 
                [
             Color.fromARGB(255,62,59,54),
              Color.fromARGB(255,62,59,54),
            ],
                
                )
              ),
       child: getImages==null ? Center(
                    child:Lottie.asset("assets/Animation - 1716967615661.json",
            fit:BoxFit.contain)
        
       ):GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 10,crossAxisSpacing: 10),itemCount: getImages!.length,
        itemBuilder: (context,i){
          return Card(
                           child: Container(
                                 decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage("assets/hotel2.jpg"),fit: BoxFit.cover),
                                 ),
                             child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 ListTile(
                                                 
                                                   title: Padding(  
                                                     padding: const EdgeInsets.all(8.0),
                                                     child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.white,),
                                                        borderRadius: BorderRadius.circular(10)
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Name :- ${getImages![i].placeName}",style: TextStyle(color: Colors.white,fontSize: 19),),
                                                      )),
                                                   ),
                                                       
                                                  
                                                   subtitle: Padding(
                                                     padding: const EdgeInsets.all(8.0),
                                                     child: Container(
                                                                                                 decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.white,),
                                                        borderRadius: BorderRadius.circular(10),
                                                        shape: BoxShape.rectangle
                                                      ),
                                                      child: Text("Contact Number :- ${getImages![i].contact}",style: TextStyle(color: Colors.white,fontSize: 18),))
                                                   )
                                 ),
                               ],
                             ),
                           )
          );
        })

             )
    );
  }
}