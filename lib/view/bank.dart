import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mumbai_city/modal/bank_modal.dart';
import 'package:http/http.dart' as http;
import 'package:mumbai_city/view/homepage.dart';


class BankPage extends StatefulWidget {
  const BankPage({super.key});

  @override
  State<BankPage> createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  List <Bank>?getImages;
  void getBank()async{
  try{
    var getImage= await http.get(Uri.parse("https://mapi.trycatchtech.com/v3/mumbai/atm_and_banks_data_list_by_category?category_id=5"));
    if (getImage.statusCode==200){
      getImages=Bank.getImage(jsonDecode(getImage.body));
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
        title: Text(" AXIS BANK  ",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
      ),
         body: Container(
       decoration: BoxDecoration(
       gradient: LinearGradient(colors: 
                [
             Color.fromARGB(255, 58, 100, 100),
              Color.fromARGB(255, 117, 70, 109),
            ],
                
                )
              ),
       child: getImages==null ? Center(
                    child:Lottie.asset("assets/Animation - 1716967615661.json",
            fit:BoxFit.contain)
        
       ):GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 10,crossAxisSpacing: 10),itemCount: getImages!.length,
        itemBuilder: (context,i){
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Card(
              
              elevation: 8,
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),    
               
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/bank1.jpg"),fit: BoxFit.cover),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ListTile(
                  title: Image.network(getImages![i].images??''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    SizedBox(
                      
                    ),
                    
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Place Name :- ${getImages![i].placeName ??''}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                        
                        ),
                      ),decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                      
                    gradient: LinearGradient(colors: [
                      Colors.red,
                      Color.fromARGB(255, 228, 152, 152)
                    ]),
                            
                        border: Border.all(color: Colors.black)
                      ),
                      
                      ),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 231, 142, 25),
                    const Color.fromARGB(255, 243, 201, 139)
                  ])
                      ),
                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Contact :-  ${getImages![i].contact ??''}',style: TextStyle(fontWeight: FontWeight.bold),),
                    )),
                      SizedBox(height: 5,),
                      Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(colors: [
                          Colors.blueGrey,
                          const Color.fromARGB(255, 149, 195, 233)
                        ]),
                        border: Border.all(color: Colors.black)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Description :-  ${getImages![i].description??''}',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),),
                      )),
                    SizedBox(height: 6,),
                    Container(
                      decoration: BoxDecoration(
gradient: LinearGradient(colors: [
                            Colors.blueGrey,
                          const Color.fromARGB(255, 149, 195, 233)

]),                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('website:-  ${getImages![i].website??''}',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),),
                      )),
                    SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.red,
                      Color.fromARGB(255, 228, 152, 152)
                    ]),
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Address:-  ${getImages![i].address??''}',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
                      ))
                    ],
                  ),
                ),
              )   
              ),
          );
        })

             )
    );
  }
}