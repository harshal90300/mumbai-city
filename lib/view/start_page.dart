import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:mumbai_city/view/login_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  body: Container(
    width :double.infinity,
    height:MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
          Color(0xffff4590),
           Color.fromARGB(255, 190, 124, 235)
         
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      tileMode: TileMode.clamp
      )
      
    ),
    
    child: Center(
      child:Stack(
        children: [
          Positioned(
          top:20,
          left: 0,
          right: 0,
          child: Column(
            children: [
                            Text("WELCOME",style: TextStyle(color:const Color.fromARGB(255, 24, 25, 31),fontSize: 29),),
                            
                            SizedBox(height: 50,),

            
                CircleAvatar(
                  backgroundImage:AssetImage("assets/mumbai4.jpeg"),
                  radius: 100,
               )


            ],
          ),
           ),
           Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child:Padding(padding: EdgeInsets.all(40),
            child: GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginPage(),));
              },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors:[
                    Colors.indigo,
                    Colors.blueGrey
                  ]),
                  borderRadius: BorderRadius.all(Radius.circular(9))
                ),
                child: Center(
                  child: Row(
                    children:[ Padding(
                      padding: const EdgeInsets.only(left: 150.0),
                      child:
                      
                       Text("Get Started",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                      ),
                    ),
                    
                    SizedBox(width: 30,),

                    Lottie.asset("assets/forward.json")


                    ]
                  ),
                ),
              ),
              
            ),
            ),
             )
        ],
      )
    ),
  ),

    );
  }
}