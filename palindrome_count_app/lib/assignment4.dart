//import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:math';

class Assignment4 extends StatefulWidget{
  const Assignment4({super.key});
  
  @override
  State<Assignment4> createState() => _Assignment4State();
}

class _Assignment4State extends State<Assignment4>{
  int armCount = 0;
  int count = 0;
  int strongCount = 0;
  int reverseNum = 0;
  List<int>numberList = [145, 225, 1, 121, 234, 153, 40585, 1, 225, 121, 234, 999, 153, 1, 225, 153, 1634];

  // Palindrome Number

  void countPallindrome(){
    count = 0;

    for (int i = 0; i < numberList.length; i++){
      int temp = numberList[i].abs();
      int reverseNum = 0;

      while(temp != 0){
        reverseNum = reverseNum * 10 + temp % 10;
        temp = temp ~/ 10;
      }

      if (reverseNum == numberList[i].abs()){
      count++;

      }
    }
  }

// Armstrong Number

   void isArmStrong() { 
    armCount = 0;

    for(int i = 0; i < numberList.length; i++) {
      int temp = numberList[i].abs();
      int temp2 = numberList[i].abs();
      int numberOfDigits = 0;

      while(temp != 0) {
        temp = temp ~/ 10;
        numberOfDigits++;
      }

      var currentDigit;
      dynamic sum = 0;
      
      while(temp2 > 0) {
        currentDigit = temp2 % 10;
        sum = sum + pow(currentDigit,numberOfDigits);
        temp2 = temp2 ~/ 10;
      }

      if(sum == numberList[i].abs()) {
        armCount++;
      }
    }
  }

// Strong Number 

  void countStrong() {
    strongCount = 0;
    int sum = 0;

    for(int i = 0; i < numberList.length; i++) {
      sum = 0;
      int rem = 0;
      int temp = numberList[i].abs();
      
      while(temp != 0) {
        rem = temp % 10;
        int fact = 1;
        
        for(int i = 1; i <= rem; i++) {
          fact = fact * i;
        }
        
        sum = sum + fact;
        temp = temp ~/ 10;
      }
      
      if(sum == numberList[i].abs()) {
        strongCount++;
      }
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment4"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            
               children: [
                  Text("Count of Palindrome Number: $count",
                   textAlign: TextAlign.center,
                   style: TextStyle(fontSize: 25),      
                  ),

                  ElevatedButton(onPressed: (){
                    countPallindrome();
                    setState((){}); 
                  }, 
                   child: const Text("Pallindrome Count"),
                   ),

                   const SizedBox(
                    height: 70,
                   ),
                   
                  Text("Count of Armstrong Number: $armCount",
                   textAlign: TextAlign.center,
                   style: TextStyle(fontSize: 25), 
                  ),

                  ElevatedButton(onPressed: () { 
                    isArmStrong();
                    setState((){}); 
                  }, child: const Text("Armstrong Count"),
                  ),

                   const SizedBox(
                    height: 70,
                   ),

                  Text("Count of Strong Number: $strongCount",
                   textAlign: TextAlign.center,
                   style: TextStyle(fontSize: 25), 
                  ),

                   ElevatedButton(onPressed: () {
                    countStrong();
                    setState((){}); 
                   }, child: const Text("Strong Count"),
                   ),

                   const SizedBox(
                    height: 70,
                   ),
               ],
            ),

          ],
        ),
        
      )
    );
  }
}