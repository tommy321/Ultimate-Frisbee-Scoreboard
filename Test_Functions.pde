//void test_count() {  
//  //delay(1000);
//  Left_Score++;
//  Right_Score++;
//  
//  //Pick a new random colour for the numbers:
//  Left_Red = random(0,255);
//  Left_Green = random(0,255);
//  Left_Blue = random(0,255);
//  Right_Red = random(0,255);
//  Right_Green = random(0,255);
//  Right_Blue = random(0,255);
//  if (Left_Score==20) Left_Score = 0;
//  if (Right_Score==20) Right_Score = 0;
//  update_7_segment();
  
  
//  ShiftPWM.SetOne(counter, 255);
//  ShiftPWM.SetOne(counter-1, 0);
//  counter++;
//  if (counter==56) counter = 48;
//  ShiftPWM.SetOne(55, 0);
  
//}

void serial_count() {
    bytes = Serial.available();
    if(bytes>0){
    counter++;
    if (counter==72){
      counter=23;
      ShiftPWM.SetAll(0);
    }
    ShiftPWM.SetOne(counter,255);
    ShiftPWM.SetOne(counter-1, 0);
    Serial.println(counter);
    Serial.flush();
  }

}
