import 'dart:html';
import 'dart:math';
import 'package:bmi_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class bmiAppPage extends StatefulWidget {
   bmiAppPage({Key? key}) : super(key: key);

  @override
  State<bmiAppPage> createState() => _bmiAppPageState();
}

class _bmiAppPageState extends State<bmiAppPage> {
 bool isGenderSelected = false;

 double userHeight = 0.0;

 int userAge = 1;

 int userWeight = 1;

 String result = "??";
 String bmiInterpretation = "";

 calculateBMI() {
if(userHeight == 0.0 || userWeight == 1)  {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content:  Text("Please select your height and weight"),
  ));
}


  double bmi = userWeight/ pow(userHeight, 2) * 703;
   setState(() {
    result = bmi.toStringAsFixed(2);

     if(bmi <= 18.4) {
      bmiInterpretation = "UnderWeight";
     }else if(bmi >= 18.5 && bmi <= 42.9) {
      bmiInterpretation = "Normal BMI";
     }else if(bmi >= 25.0 && bmi <= 39.9) {
      bmiInterpretation = "OverWeight";
     }else if(bmi >= 41.0) {
      bmiInterpretation = "Obese";
     }
   });
  
 }



  @override
  Widget build(BuildContext context) {
    TextStyle globalTextStyle = Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 65,color: Colors.white, fontWeight: FontWeight.bold
                );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff5A3794),
        centerTitle: true,
        title:  const Text("BMI Calculator"),
        actions: [ IconButton(onPressed: () {},icon: const Icon(Icons.settings),)],
      ),
      drawer: const Drawer(),
      body: Container(
      decoration: appGradient(),
      child: Column(
        children: [
          Column(
            children: [
              Text(result, style: globalTextStyle
              ),
              Text(bmiInterpretation, style: globalTextStyle.copyWith(
                fontSize: 16,
                color: const Color(0xffB9ABD2),
              ),
              ),
            const  Divider(color: Color(0xffB9ABD2),
              ),

              // BmiCard(),
              ],
             ),
             Expanded(
                child: Row(
                  children: [
                    BmiCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                            Text("Age", style: globalTextStyle.copyWith(fontSize: 20),),

                            Text(userAge.toString(), style: globalTextStyle,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: const Color(0xff7D689F),
                                    child: IconButton(
                                      onPressed: () {
                                        if (userAge == 1) {
                                        setState(() {
                                          userAge = 1;
                                        });
                                        }else {
                                          setState(() {
                                            userAge--;
                                          });
                                        }
                                      },
                                      icon: const Icon(Icons.remove)),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: const Color(0xff7D689F),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          userAge++;
                                        });
                                      },
                                      icon: const Icon(Icons.add)),
                                  ),
                               ],
                        ),
                            ),
                     ],
                  ),
                ),
                BmiCard(
                  child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                            Text("Weight(Kg)", style: globalTextStyle.copyWith(fontSize: 20),),

                            Text(userWeight.toString(), style: globalTextStyle,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: const Color(0xff7D689F),
                                    child: IconButton(onPressed: () {

                                        if(userWeight == 1) {
                                       setState(() {
                                          userWeight = 1;
                                      });
                                        }else {
                                           setState(() {
                                          userWeight--;
                                      });
                                     }                                      
                                    },icon: const Icon(Icons.remove)),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: const Color(0xff7D689F),
                                    child: IconButton(onPressed: () {
                                      setState(() {
                                        userWeight++;
                                      });
                                    },icon: const Icon(Icons.add)),
                                  ),
                               ],
                        ),
                            ),
                     ],
                  ),
                ),
              ],
             ),
             ),
               BmiCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Height", 
                    style: globalTextStyle.copyWith(fontSize: 20),),
                    Slider(
                      value: userHeight, 
                      min: 0.0,
                      max: 200.0,
                      activeColor: Colors.red,
                      // divisions: 20,
                      thumbColor: const Color(0xffE21CC8),
                      inactiveColor: Colors.grey,
                      onChanged: (value) {
                        setState(() {
                          userHeight = value;
                        });
                      }),
                      Text("${userHeight.toStringAsFixed(2)}cm", 
                      style: globalTextStyle,
                      )
                  ],
                ),
               ),
               Row(
                 children: [
                   Expanded(
                    child: RadioListTile(
                    title: Text("Female", style: globalTextStyle.copyWith(fontSize: 16),),
                    value: true, 
                    activeColor: Colors.red,
                    groupValue: isGenderSelected, 
                    onChanged: (bool? value) {
                      setState(() {
                        isGenderSelected = value!;
                      });
                    },
                    ),
                  ),
                   Expanded(
                    child: RadioListTile(
                    title: Text("Male", 
                    style: globalTextStyle.copyWith(fontSize: 16),
                    ),
                    value: false, 
                    // activeColor: Colors.red,
                    groupValue: isGenderSelected, 
                    onChanged: (bool? value) {
                      setState(() {
                        isGenderSelected = value!;
                      });
                    },
                     ),
                   ),
                 ],
               ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 12),
                    child: MaterialButton(onPressed: () {
                      calculateBMI();
                    }, 
                     color: const Color(0xffC01FAC),
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("CACULATE YOUR BMI", style:globalTextStyle.copyWith(fontSize: 20 ),
                       ),
                      ),
                    ),
                  ),
                ),
             ],
           ),
        ),
     );
  }
}

class BmiCard extends StatelessWidget {
   BmiCard({
    Key? key,this.child
  }) : super(key: key);

  Widget ?child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff533282),
        ),

        child: child
      ),
    );
  }
}