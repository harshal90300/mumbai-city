import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mumbai_city/view/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String ? UserName;
  void getUserName()  async {
  
    SharedPreferences prefs = await SharedPreferences.getInstance();

    UserName = prefs.getString("username");

    setState(() {});

  }
  @override
  void initState(){
    getUserName();
    Future.delayed(Duration(seconds: 6),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage()));
    }
    );
    super .initState();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.transparent,

      body: Stack(
        
        children: [
         
       

          Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(image: AssetImage("assets/Mumbai - City of Dreams.jpg",
            //   ),
            //   fit: BoxFit.fill)
            // ),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: 
              [
                                          Color.fromARGB(255, 109, 105, 105),
                          Color.fromARGB(255, 63, 72, 77)
              ])
            ),
            
          ),
          Center(
          
            child: Padding(
              padding: const EdgeInsets.only(bottom: 150.0), 
              child: TextButton(
                
                onPressed: (){}, child: Text(" Mumbai City App",style: TextStyle(color: Colors.grey,fontSize: 25,fontWeight: FontWeight.normal),),
                
                
                ),
            ),
          ),
          Container(
            color: Colors.transparent,
            child: Lottie.asset("assets/Animation - 1713425251099.json",
            backgroundLoading: true,
            fit: BoxFit.fill
            ),
          ),
        ],
      ),
    );
  }
}

