import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:mumbai_city/modal/essential_model.dart';
import 'package:mumbai_city/view/homepage.dart';

class EssentialPage extends StatefulWidget {
  const 
  EssentialPage({super.key});

  @override
  State<EssentialPage> createState() => _EssentialPageState();
}

class _EssentialPageState extends State<EssentialPage> {
    List <Essential>?getImages;
  void getEssential()async{
  try{
    var getImage= await http.get(Uri.parse("https://mapi.trycatchtech.com/v3/mumbai/public_services_categories_data_list"));
    if (getImage.statusCode==200){
      getImages=Essential.getImage(jsonDecode(getImage.body));
      setState(() {
        
      });
    }

  } catch(e){

  }
  }
  @override
  void initState() {
    getEssential();
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
          
            
            Text(" ESSENTIAL SERVICES  ",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
          ],
        ),
      ),
                  body: Container(
       decoration: BoxDecoration(
       gradient: LinearGradient(colors: 
                [
             Color.fromARGB(255, 37, 41, 41),
              Color.fromARGB(255, 240, 199, 240),
            ],
                
                )
              ),
              child: getImages==null ?Center(
                  child:Lottie.asset("assets/Animation - 1716967615661.json",
            fit:BoxFit.contain)):GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8),itemCount: getImages!.length,
        itemBuilder: (context,i){
               return Card(
                   shadowColor: Color.fromARGB(255, 168, 216, 238),
                  elevation: 2,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  
                      child: Container(
                      
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage("assets/back3.jpg"),fit: BoxFit.cover),
                      // gradient: LinearGradient(colors: [
                      //   const Color.fromARGB(255, 140, 152, 224),
                      //   Color.fromARGB(255, 247, 159, 159),
                        
                      // ],begin: Alignment.topLeft,
                      // end: Alignment.bottomRight
                      // )
                    ),
                   child: ListTile(
                    title: Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Name :-${getImages![i].catName??''}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700),),
                    )),
                    
                   ),
                  
                      )
    );
        }
            )
            )
    );
  }
}