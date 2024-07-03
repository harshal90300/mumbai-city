import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mumbai_city/modal/shopping_modal.dart';
import 'package:http/http.dart' as http;

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
   List <Shopping>?getShop;
  void getShopping()async{
  try{
    var getImage= await http.get(Uri.parse("https://mapi.trycatchtech.com/v3/mumbai/shopping_categories_data_list"));
    if (getImage.statusCode==200){
      getShop=Shopping.getShop(jsonDecode(getImage.body));
      setState(() {
        
      });
    }

  } catch(e){

  }
  }
  @override
    void initState() {
    getShopping();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar: AppBar(
  title: Text("Shopping Page"),
),
body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: 
                [
             Color.fromARGB(255, 97, 246, 248),
              Color.fromARGB(255, 133, 227, 255),
            ],
                
                )
              ),
       child: getShop==null ? Center(
                    child:Lottie.asset("assets/Animation - 1716967615661.json",
            fit:BoxFit.contain)
        
       ):GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 10,crossAxisSpacing: 10),itemCount: getShop!.length,
        itemBuilder: (context,i){
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),     
          
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))), child: Center(child: Text(getShop![i].catName!,style: TextStyle(color: Colors.black,fontSize: 19),)),
            height: 250,
            width: 250,
           ) );
        })

             )
    );
  }
}