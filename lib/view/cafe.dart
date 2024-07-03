import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mumbai_city/modal/cafe_modal.dart';
import 'package:http/http.dart' as http;
import 'package:mumbai_city/view/homepage.dart';

class CafePage extends StatefulWidget {
  const CafePage({super.key});

  @override
  State<CafePage> createState() => _CafePageState();
}

class _CafePageState extends State<CafePage> {
    List <Cafe>?getImages;
  void getBank()async{
  try{
    var getImage= await http.get(Uri.parse("https://mapi.trycatchtech.com/v3/mumbai/food_drink_data_list_by_category?category_id=1"));
    if (getImage.statusCode==200){
      getImages=Cafe.getImage(jsonDecode(getImage.body));
      setState(() {
        
      });
    }

  } catch(e){

  }
  }
  @override
  void initState() {
    getBank();
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
        title: Text(" CAFE BAR  ",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
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
              child:getImages==null? Center(
                child: Lottie.asset("assets/Animation - 1716967615661.json"),
              ) :GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 10,crossAxisSpacing: 10),itemCount: getImages!.length, itemBuilder:(context,i){

                return Card(
                  shadowColor: Color.fromARGB(255, 168, 216, 238),
                  elevation: 7,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 114, 132, 233),
                        const Color.fromARGB(255, 235, 110, 110),
                        
                      ],begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                      )
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 80,
                              backgroundImage: NetworkImage( "https://mapi.trycatchtech.com/uploads/mumbai/1698661770_download (6).jpeg")
                            ),
                            SizedBox(width: 20,
                            ),
                            Container(
                                                              decoration:BoxDecoration(
                                                      shape: BoxShape.rectangle,
                                                  borderRadius: BorderRadius.circular(10),
                                                gradient: LinearGradient(colors: 
                                                [
                                                  Colors.grey,
                                                  Colors.greenAccent
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight
                                                ),
                              
                                                  border: Border.all(color: Colors.black)
                                ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Name :- ${getImages![i].placeName??''}',style: TextStyle(color:Colors.black,fontSize: 17,fontWeight: FontWeight.w600),),
                              ))
                          ],
                        ),
                        SizedBox(
                          height: 10,

                        ),
                        
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration:BoxDecoration(
                                                      shape: BoxShape.rectangle,
                                                  borderRadius: BorderRadius.circular(10),
                                                  color:  Color.fromARGB(255, 248, 181, 92),
                              
                                                  border: Border.all(color: Colors.black)
                                ),
                                
                                                  child:  Padding(
                                                    padding: const EdgeInsets.all(12.0),
                                                    child: Text(getImages![i].description??'',style:TextStyle(color:Colors.black,fontSize: 17,fontWeight: FontWeight.w600)),
                                                  )),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                                                    decoration:BoxDecoration(
                                                    shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      color:  Color.fromARGB(255, 123, 220, 233),
                    
                      border: Border.all(color: Colors.black)
                              ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Address :- ${getImages![i].address??''}',style:TextStyle(color:Colors.black,fontSize: 17,fontWeight: FontWeight.w600)
                          ),
                        ),
                      )
                      ],
                    ),
                  ),
                );
              } )
        ),   
    );
  }
}