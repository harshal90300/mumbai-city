import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:mumbai_city/modal/travel_modal.dart';
import 'package:mumbai_city/view/homepage.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  List <Travel>?getImaged;
  void getTravel()async{
  try{
    var getImage= await http.get(Uri.parse("https://mapi.trycatchtech.com/v3/mumbai/tourist_data_list_by_category?id=1"));
    if (getImage.statusCode==200){
      getImaged=Travel.getImage(jsonDecode(getImage.body));
      setState(() {
        
      });
    }

  } catch(e){

  }
  }
  @override
  void initState() {
    getTravel();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        leading: IconButton.filled(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage()));} ,icon: Icon(Icons.arrow_back_outlined),color: Colors.white,focusColor: const Color.fromARGB(255, 241, 123, 86),splashColor:  Color.fromARGB(255, 241, 123, 86),),
        actions: [
       IconButton.filled(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage()));}, icon: Icon(Icons.home),color: Colors.white,focusColor: Color.fromARGB(255, 241, 123, 86) ,splashColor:  Color.fromARGB(255, 241, 123, 86),)
        ],
        backgroundColor: Color.fromARGB(255, 37, 41, 41),
        title: Text(" Travel Booking  ",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
      ),
        body: Container(
       decoration: BoxDecoration(
       gradient: LinearGradient(colors: 
                [
             Color.fromARGB(255, 113, 234, 236),
              Color.fromARGB(255, 239, 105, 217),
            ],
                
                )
              ),
       child: getImaged==null ? Center(
                    child:Lottie.asset("assets/Animation - 1716967615661.json",
            fit:BoxFit.contain)
        
       ):GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 10,crossAxisSpacing: 10),itemCount: getImaged!.length,
        itemBuilder: (context,i){
          return Card(
            elevation: 8,
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),   
              
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/travel.jpg"),fit: BoxFit.cover)
              ),
              child: Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: ListTile(
                    title: Image.network(getImaged![i].images??''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      SizedBox(
                        height: 1,
                      ),
                      
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Place Name:-${getImaged![i].placeName ??''}',style: TextStyle(fontWeight: FontWeight.bold),
                          
                          ),
                        ),decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                          color:  Color.fromARGB(255, 241, 167, 124),
                            
                          border: Border.all(color: Colors.black)
                        ),
                        
                        ),
                      SizedBox(height: 15,),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 171, 243, 149),
                        ),
                        child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Contact :-  ${getImaged![i].website ??''}',style: TextStyle(fontWeight: FontWeight.bold),),
                      )),
                      SizedBox(height: 15,),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 228, 166, 228),
                          border: Border.all(color: Colors.black)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Description :-  ${getImaged![i].description??''}',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
                        )),
                      SizedBox(height: 6,),
                      Container(
                        decoration: BoxDecoration(
                          color:Color.fromARGB(255, 171, 243, 149),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('website:-  ${getImaged![i].website??''}',style: TextStyle(fontWeight: FontWeight.w700),),
                        )),
                      SizedBox(height: 5),
                      Container(
                        decoration: BoxDecoration(
                          color:  Color.fromARGB(255, 241, 167, 124),
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Address:-  ${getImaged![i].address??''}',style: TextStyle(fontWeight: FontWeight.w500),),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            )   
            );
        })

             )
    );
  }
}