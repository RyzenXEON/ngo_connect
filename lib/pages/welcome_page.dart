import 'package:flutter/material.dart';
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(4, 224, 92, 1),
            Color.fromRGBO(207, 249, 227, 1)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              const SizedBox(height: 300.0),

              //app name
              const Text(
                "NGO - CONNECT",
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              //sub title
              const Text(
                'Empower.Connect.Impact',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),

              //bottom rounded box
              const SizedBox(height: 200.0),


              //bottom sheet
              Container(
                alignment: Alignment.bottomCenter,
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, top: 25, right: 50,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  
                      //welcome msg
                      const Text("Be a part of the change you want to see in the world",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      //spacer
                      
                      const SizedBox(height: 30.0),

                      //getstarted button
                      ElevatedButton(
                        onPressed: () {
                          //remove the below line for showing the get started page
                          //Navigator.pop(context);
                          Navigator.pushNamed(context, '/login');
                          
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(4, 224, 92, 1),
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          
                          
                        ),
                        child: 
                        const Text(
                          'GET STARTED',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),

                        ),
                        
                      ),
                    ],
                  
                  ),
                ),
              ),


              
            ],
          ),
        ),
      ),
 );
  }
}