void update_7_segment() {
  int left_ones = Left_Score%10;
  int right_ones = Right_Score%10;
  //ground the correct pins to make the number show up.
  digitalWrite(ShiftPWM_latchPin, LOW);
  switch(left_ones) {
    case 0:
      //0 = A B C D E F;
        ShiftPWM.SetOne(Left_Red_digitA, Left_Red);
        ShiftPWM.SetOne(Left_Red_digitB, Left_Red);
        ShiftPWM.SetOne(Left_Red_digitC, Left_Red);
        ShiftPWM.SetOne(Left_Red_digitD, Left_Red);
        ShiftPWM.SetOne(Left_Red_digitE, Left_Red);
        ShiftPWM.SetOne(Left_Red_digitF, Left_Red);
        ShiftPWM.SetOne(Left_Red_digitG, 0);
        ShiftPWM.SetOne(Left_Green_digitA, Left_Green);
        ShiftPWM.SetOne(Left_Green_digitB, Left_Green);
        ShiftPWM.SetOne(Left_Green_digitC, Left_Green);
        ShiftPWM.SetOne(Left_Green_digitD, Left_Green);
        ShiftPWM.SetOne(Left_Green_digitE, Left_Green);
        ShiftPWM.SetOne(Left_Green_digitF, Left_Green);
        ShiftPWM.SetOne(Left_Green_digitG, 0);
        ShiftPWM.SetOne(Left_Blue_digitA, Left_Blue);
        ShiftPWM.SetOne(Left_Blue_digitB, Left_Blue);
        ShiftPWM.SetOne(Left_Blue_digitC, Left_Blue);
        ShiftPWM.SetOne(Left_Blue_digitD, Left_Blue);
        ShiftPWM.SetOne(Left_Blue_digitE, Left_Blue);
        ShiftPWM.SetOne(Left_Blue_digitF, Left_Blue);
        ShiftPWM.SetOne(Left_Blue_digitG, 0);
              ShiftPWM.SetOne(Left_Red_digitH, 0);
      ShiftPWM.SetOne(Left_Green_digitH, 0);
      ShiftPWM.SetOne(Left_Blue_digitH, 0);
    break;
    case 1:
      //1 = B and C;
        ShiftPWM.SetOne(Left_Red_digitA, 0);
        ShiftPWM.SetOne(Left_Red_digitB, Left_Red);
        ShiftPWM.SetOne(Left_Red_digitC, Left_Red);
        ShiftPWM.SetOne(Left_Red_digitD, 0);
        ShiftPWM.SetOne(Left_Red_digitE, 0);
        ShiftPWM.SetOne(Left_Red_digitF, 0);
        ShiftPWM.SetOne(Left_Red_digitG, 0);
        ShiftPWM.SetOne(Left_Green_digitA, 0);
        ShiftPWM.SetOne(Left_Green_digitB, Left_Green);
        ShiftPWM.SetOne(Left_Green_digitC, Left_Green);
        ShiftPWM.SetOne(Left_Green_digitD, 0);
        ShiftPWM.SetOne(Left_Green_digitE, 0);
        ShiftPWM.SetOne(Left_Green_digitF, 0);
        ShiftPWM.SetOne(Left_Green_digitG, 0);  
        ShiftPWM.SetOne(Left_Blue_digitA, 0);
        ShiftPWM.SetOne(Left_Blue_digitB, Left_Blue);
        ShiftPWM.SetOne(Left_Blue_digitC, Left_Blue);
        ShiftPWM.SetOne(Left_Blue_digitD, 0);
        ShiftPWM.SetOne(Left_Blue_digitE, 0);
        ShiftPWM.SetOne(Left_Blue_digitF, 0);
        ShiftPWM.SetOne(Left_Blue_digitG, 0);
        ShiftPWM.SetOne(Left_Red_digitH, 0);
      ShiftPWM.SetOne(Left_Green_digitH, 0);
      ShiftPWM.SetOne(Left_Blue_digitH, 0);      
    break;
    case 2: 
      //2 = A B G E D
      ShiftPWM.SetOne(Left_Red_digitA, Left_Red);      
      ShiftPWM.SetOne(Left_Red_digitB, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitC, 0);
      ShiftPWM.SetOne(Left_Red_digitD, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitE, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitF, 0);
      ShiftPWM.SetOne(Left_Red_digitG, Left_Red);
      ShiftPWM.SetOne(Left_Green_digitA, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitB, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitC, 0);
      ShiftPWM.SetOne(Left_Green_digitD, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitE, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitF, 0);
      ShiftPWM.SetOne(Left_Green_digitG, Left_Green); 
      ShiftPWM.SetOne(Left_Blue_digitA, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitB, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitC, 0);
      ShiftPWM.SetOne(Left_Blue_digitD, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitE, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitF, 0);
      ShiftPWM.SetOne(Left_Blue_digitG, Left_Blue);
       ShiftPWM.SetOne(Left_Red_digitH, 0);
      ShiftPWM.SetOne(Left_Green_digitH, 0);
      ShiftPWM.SetOne(Left_Blue_digitH, 0);     
    break;
    case 3: 
      //3 = ABGCD
      ShiftPWM.SetOne(Left_Red_digitA, Left_Red);      
      ShiftPWM.SetOne(Left_Red_digitB, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitC, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitD, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitE, 0);
      ShiftPWM.SetOne(Left_Red_digitF, 0);
      ShiftPWM.SetOne(Left_Red_digitG, Left_Red);
      ShiftPWM.SetOne(Left_Green_digitA, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitB, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitC, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitD, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitE, 0);
      ShiftPWM.SetOne(Left_Green_digitF, 0);
      ShiftPWM.SetOne(Left_Green_digitG, Left_Green); 
      ShiftPWM.SetOne(Left_Blue_digitA, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitB, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitC, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitD, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitE, 0);
      ShiftPWM.SetOne(Left_Blue_digitF, 0);
      ShiftPWM.SetOne(Left_Blue_digitG, Left_Blue);
       ShiftPWM.SetOne(Left_Red_digitH, 0);
      ShiftPWM.SetOne(Left_Green_digitH, 0);
      ShiftPWM.SetOne(Left_Blue_digitH, 0);     
    break;
    case 4: 
      //4 = FGBC
      ShiftPWM.SetOne(Left_Red_digitA, 0);      
      ShiftPWM.SetOne(Left_Red_digitB, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitC, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitD, 0);
      ShiftPWM.SetOne(Left_Red_digitE, 0);
      ShiftPWM.SetOne(Left_Red_digitF, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitG, Left_Red);
      ShiftPWM.SetOne(Left_Green_digitA, 0);
      ShiftPWM.SetOne(Left_Green_digitB, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitC, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitD, 0);
      ShiftPWM.SetOne(Left_Green_digitE, 0);
      ShiftPWM.SetOne(Left_Green_digitF, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitG, Left_Green);  
      ShiftPWM.SetOne(Left_Blue_digitA, 0);
      ShiftPWM.SetOne(Left_Blue_digitB, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitC, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitD, 0);
      ShiftPWM.SetOne(Left_Blue_digitE, 0);
      ShiftPWM.SetOne(Left_Blue_digitF, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitG, Left_Blue);
      ShiftPWM.SetOne(Left_Red_digitH, 0);
      ShiftPWM.SetOne(Left_Green_digitH, 0);
      ShiftPWM.SetOne(Left_Blue_digitH, 0);      
    break; 
    case 5: 
      //5 = AFGCD
      ShiftPWM.SetOne(Left_Red_digitA, Left_Red);      
      ShiftPWM.SetOne(Left_Red_digitB, 0);
      ShiftPWM.SetOne(Left_Red_digitC, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitD, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitE, 0);
      ShiftPWM.SetOne(Left_Red_digitF, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitG, Left_Red);
      ShiftPWM.SetOne(Left_Green_digitA, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitB, 0);
      ShiftPWM.SetOne(Left_Green_digitC, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitD, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitE, 0);
      ShiftPWM.SetOne(Left_Green_digitF, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitG, Left_Green);   
      ShiftPWM.SetOne(Left_Blue_digitA, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitB, 0);
      ShiftPWM.SetOne(Left_Blue_digitC, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitD, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitE, 0);
      ShiftPWM.SetOne(Left_Blue_digitF, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitG, Left_Blue);
         ShiftPWM.SetOne(Left_Red_digitH, 0);
      ShiftPWM.SetOne(Left_Green_digitH, 0);
      ShiftPWM.SetOne(Left_Blue_digitH, 0);   
    break;
    case 6: 
      //6 = AFGCED
      ShiftPWM.SetOne(Left_Red_digitA, Left_Red);      
      ShiftPWM.SetOne(Left_Red_digitB, 0);
      ShiftPWM.SetOne(Left_Red_digitC, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitD, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitE, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitF, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitG, Left_Red);
      ShiftPWM.SetOne(Left_Green_digitA, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitB, 0);
      ShiftPWM.SetOne(Left_Green_digitC, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitD, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitE, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitF, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitG, Left_Green); 
      ShiftPWM.SetOne(Left_Blue_digitA, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitB, 0);
      ShiftPWM.SetOne(Left_Blue_digitC, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitD, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitE, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitF, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitG, Left_Blue);
       ShiftPWM.SetOne(Left_Red_digitH, 0);
      ShiftPWM.SetOne(Left_Green_digitH, 0);
      ShiftPWM.SetOne(Left_Blue_digitH, 0);     
    break;   
    case 7: 
      //7 = ABC
      ShiftPWM.SetOne(Left_Red_digitA, Left_Red);      
      ShiftPWM.SetOne(Left_Red_digitB, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitC, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitD, 0);
      ShiftPWM.SetOne(Left_Red_digitE, 0);
      ShiftPWM.SetOne(Left_Red_digitF, 0);
      ShiftPWM.SetOne(Left_Red_digitG, 0);
      ShiftPWM.SetOne(Left_Green_digitA, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitB, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitC, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitD, 0);
      ShiftPWM.SetOne(Left_Green_digitE, 0);
      ShiftPWM.SetOne(Left_Green_digitF, 0);
      ShiftPWM.SetOne(Left_Green_digitG, 0);
      ShiftPWM.SetOne(Left_Blue_digitA, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitB, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitC, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitD, 0);
      ShiftPWM.SetOne(Left_Blue_digitE, 0);
      ShiftPWM.SetOne(Left_Blue_digitF, 0);
      ShiftPWM.SetOne(Left_Blue_digitG, 0);
      ShiftPWM.SetOne(Left_Red_digitH, 0);
      ShiftPWM.SetOne(Left_Green_digitH, 0);
      ShiftPWM.SetOne(Left_Blue_digitH, 0);      
    break; 
    case 8: 
      //8 = ABCDEFG
      ShiftPWM.SetOne(Left_Red_digitA, Left_Red);      
      ShiftPWM.SetOne(Left_Red_digitB, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitC, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitD, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitE, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitF, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitG, Left_Red);
      ShiftPWM.SetOne(Left_Green_digitA, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitB, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitC, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitD, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitE, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitF, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitG, Left_Green);
      ShiftPWM.SetOne(Left_Blue_digitA, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitB, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitC, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitD, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitE, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitF, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitG, Left_Blue);
      ShiftPWM.SetOne(Left_Red_digitH, 0);
      ShiftPWM.SetOne(Left_Green_digitH, 0);
      ShiftPWM.SetOne(Left_Blue_digitH, 0);      
    break;  
    case 9: 
      //8 = ABCDFG
      ShiftPWM.SetOne(Left_Red_digitA, Left_Red);      
      ShiftPWM.SetOne(Left_Red_digitB, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitC, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitD, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitE, 0);
      ShiftPWM.SetOne(Left_Red_digitF, Left_Red);
      ShiftPWM.SetOne(Left_Red_digitG, Left_Red);
      ShiftPWM.SetOne(Left_Green_digitA, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitB, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitC, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitD, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitE, 0);
      ShiftPWM.SetOne(Left_Green_digitF, Left_Green);
      ShiftPWM.SetOne(Left_Green_digitG, Left_Green);
      ShiftPWM.SetOne(Left_Blue_digitA, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitB, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitC, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitD, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitE, 0);
      ShiftPWM.SetOne(Left_Blue_digitF, Left_Blue);
      ShiftPWM.SetOne(Left_Blue_digitG, Left_Blue);           
      ShiftPWM.SetOne(Left_Red_digitH, 0);
      ShiftPWM.SetOne(Left_Green_digitH, 0);
      ShiftPWM.SetOne(Left_Blue_digitH, 0);
    break;
  }
  if (Left_Score>9){
    //turn on the "10"s digit:
      ShiftPWM.SetOne(Left_Red_digitH, Left_Red);
      ShiftPWM.SetOne(Left_Green_digitH, Left_Green);
      ShiftPWM.SetOne(Left_Blue_digitH, Left_Blue);
  }
  
  //ground the correct pins to make the number show up.
  switch(right_ones) {
    case 0:
      //0 = A B C D E F;
        ShiftPWM.SetOne(Right_Red_digitA, Right_Red);
        ShiftPWM.SetOne(Right_Red_digitB, Right_Red);
        ShiftPWM.SetOne(Right_Red_digitC, Right_Red);
        ShiftPWM.SetOne(Right_Red_digitD, Right_Red);
        ShiftPWM.SetOne(Right_Red_digitE, Right_Red);
        ShiftPWM.SetOne(Right_Red_digitF, Right_Red);
        ShiftPWM.SetOne(Right_Red_digitG, 0);
        ShiftPWM.SetOne(Right_Green_digitA, Right_Green);
        ShiftPWM.SetOne(Right_Green_digitB, Right_Green);
        ShiftPWM.SetOne(Right_Green_digitC, Right_Green);
        ShiftPWM.SetOne(Right_Green_digitD, Right_Green);
        ShiftPWM.SetOne(Right_Green_digitE, Right_Green);
        ShiftPWM.SetOne(Right_Green_digitF, Right_Green);
        ShiftPWM.SetOne(Right_Green_digitG, 0);
        ShiftPWM.SetOne(Right_Blue_digitA, Right_Blue);
        ShiftPWM.SetOne(Right_Blue_digitB, Right_Blue);
        ShiftPWM.SetOne(Right_Blue_digitC, Right_Blue);
        ShiftPWM.SetOne(Right_Blue_digitD, Right_Blue);
        ShiftPWM.SetOne(Right_Blue_digitE, Right_Blue);
        ShiftPWM.SetOne(Right_Blue_digitF, Right_Blue);
        ShiftPWM.SetOne(Right_Blue_digitG, 0);
              ShiftPWM.SetOne(Right_Red_digitH, 0);
      ShiftPWM.SetOne(Right_Green_digitH, 0);
      ShiftPWM.SetOne(Right_Blue_digitH, 0);
    break;
    case 1:
      //1 = B and C;
        ShiftPWM.SetOne(Right_Red_digitA, 0);
        ShiftPWM.SetOne(Right_Red_digitB, Right_Red);
        ShiftPWM.SetOne(Right_Red_digitC, Right_Red);
        ShiftPWM.SetOne(Right_Red_digitD, 0);
        ShiftPWM.SetOne(Right_Red_digitE, 0);
        ShiftPWM.SetOne(Right_Red_digitF, 0);
        ShiftPWM.SetOne(Right_Red_digitG, 0);
        ShiftPWM.SetOne(Right_Green_digitA, 0);
        ShiftPWM.SetOne(Right_Green_digitB, Right_Green);
        ShiftPWM.SetOne(Right_Green_digitC, Right_Green);
        ShiftPWM.SetOne(Right_Green_digitD, 0);
        ShiftPWM.SetOne(Right_Green_digitE, 0);
        ShiftPWM.SetOne(Right_Green_digitF, 0);
        ShiftPWM.SetOne(Right_Green_digitG, 0);  
        ShiftPWM.SetOne(Right_Blue_digitA, 0);
        ShiftPWM.SetOne(Right_Blue_digitB, Right_Blue);
        ShiftPWM.SetOne(Right_Blue_digitC, Right_Blue);
        ShiftPWM.SetOne(Right_Blue_digitD, 0);
        ShiftPWM.SetOne(Right_Blue_digitE, 0);
        ShiftPWM.SetOne(Right_Blue_digitF, 0);
        ShiftPWM.SetOne(Right_Blue_digitG, 0);
        ShiftPWM.SetOne(Right_Red_digitH, 0);
      ShiftPWM.SetOne(Right_Green_digitH, 0);
      ShiftPWM.SetOne(Right_Blue_digitH, 0);      
    break;
    case 2: 
      //2 = A B G E D
      ShiftPWM.SetOne(Right_Red_digitA, Right_Red);      
      ShiftPWM.SetOne(Right_Red_digitB, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitC, 0);
      ShiftPWM.SetOne(Right_Red_digitD, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitE, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitF, 0);
      ShiftPWM.SetOne(Right_Red_digitG, Right_Red);
      ShiftPWM.SetOne(Right_Green_digitA, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitB, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitC, 0);
      ShiftPWM.SetOne(Right_Green_digitD, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitE, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitF, 0);
      ShiftPWM.SetOne(Right_Green_digitG, Right_Green); 
      ShiftPWM.SetOne(Right_Blue_digitA, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitB, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitC, 0);
      ShiftPWM.SetOne(Right_Blue_digitD, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitE, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitF, 0);
      ShiftPWM.SetOne(Right_Blue_digitG, Right_Blue);
       ShiftPWM.SetOne(Right_Red_digitH, 0);
      ShiftPWM.SetOne(Right_Green_digitH, 0);
      ShiftPWM.SetOne(Right_Blue_digitH, 0);     
    break;
    case 3: 
      //3 = ABGCD
      ShiftPWM.SetOne(Right_Red_digitA, Right_Red);      
      ShiftPWM.SetOne(Right_Red_digitB, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitC, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitD, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitE, 0);
      ShiftPWM.SetOne(Right_Red_digitF, 0);
      ShiftPWM.SetOne(Right_Red_digitG, Right_Red);
      ShiftPWM.SetOne(Right_Green_digitA, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitB, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitC, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitD, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitE, 0);
      ShiftPWM.SetOne(Right_Green_digitF, 0);
      ShiftPWM.SetOne(Right_Green_digitG, Right_Green); 
      ShiftPWM.SetOne(Right_Blue_digitA, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitB, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitC, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitD, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitE, 0);
      ShiftPWM.SetOne(Right_Blue_digitF, 0);
      ShiftPWM.SetOne(Right_Blue_digitG, Right_Blue);
       ShiftPWM.SetOne(Right_Red_digitH, 0);
      ShiftPWM.SetOne(Right_Green_digitH, 0);
      ShiftPWM.SetOne(Right_Blue_digitH, 0);     
    break;
    case 4: 
      //4 = FGBC
      ShiftPWM.SetOne(Right_Red_digitA, 0);      
      ShiftPWM.SetOne(Right_Red_digitB, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitC, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitD, 0);
      ShiftPWM.SetOne(Right_Red_digitE, 0);
      ShiftPWM.SetOne(Right_Red_digitF, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitG, Right_Red);
      ShiftPWM.SetOne(Right_Green_digitA, 0);
      ShiftPWM.SetOne(Right_Green_digitB, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitC, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitD, 0);
      ShiftPWM.SetOne(Right_Green_digitE, 0);
      ShiftPWM.SetOne(Right_Green_digitF, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitG, Right_Green);  
      ShiftPWM.SetOne(Right_Blue_digitA, 0);
      ShiftPWM.SetOne(Right_Blue_digitB, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitC, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitD, 0);
      ShiftPWM.SetOne(Right_Blue_digitE, 0);
      ShiftPWM.SetOne(Right_Blue_digitF, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitG, Right_Blue);
      ShiftPWM.SetOne(Right_Red_digitH, 0);
      ShiftPWM.SetOne(Right_Green_digitH, 0);
      ShiftPWM.SetOne(Right_Blue_digitH, 0);      
    break; 
    case 5: 
      //5 = AFGCD
      ShiftPWM.SetOne(Right_Red_digitA, Right_Red);      
      ShiftPWM.SetOne(Right_Red_digitB, 0);
      ShiftPWM.SetOne(Right_Red_digitC, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitD, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitE, 0);
      ShiftPWM.SetOne(Right_Red_digitF, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitG, Right_Red);
      ShiftPWM.SetOne(Right_Green_digitA, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitB, 0);
      ShiftPWM.SetOne(Right_Green_digitC, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitD, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitE, 0);
      ShiftPWM.SetOne(Right_Green_digitF, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitG, Right_Green);   
      ShiftPWM.SetOne(Right_Blue_digitA, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitB, 0);
      ShiftPWM.SetOne(Right_Blue_digitC, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitD, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitE, 0);
      ShiftPWM.SetOne(Right_Blue_digitF, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitG, Right_Blue);
         ShiftPWM.SetOne(Right_Red_digitH, 0);
      ShiftPWM.SetOne(Right_Green_digitH, 0);
      ShiftPWM.SetOne(Right_Blue_digitH, 0);   
    break;
    case 6: 
      //6 = AFGCED
      ShiftPWM.SetOne(Right_Red_digitA, Right_Red);      
      ShiftPWM.SetOne(Right_Red_digitB, 0);
      ShiftPWM.SetOne(Right_Red_digitC, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitD, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitE, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitF, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitG, Right_Red);
      ShiftPWM.SetOne(Right_Green_digitA, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitB, 0);
      ShiftPWM.SetOne(Right_Green_digitC, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitD, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitE, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitF, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitG, Right_Green); 
      ShiftPWM.SetOne(Right_Blue_digitA, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitB, 0);
      ShiftPWM.SetOne(Right_Blue_digitC, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitD, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitE, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitF, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitG, Right_Blue);
       ShiftPWM.SetOne(Right_Red_digitH, 0);
      ShiftPWM.SetOne(Right_Green_digitH, 0);
      ShiftPWM.SetOne(Right_Blue_digitH, 0);     
    break;   
    case 7: 
      //7 = ABC
      ShiftPWM.SetOne(Right_Red_digitA, Right_Red);      
      ShiftPWM.SetOne(Right_Red_digitB, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitC, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitD, 0);
      ShiftPWM.SetOne(Right_Red_digitE, 0);
      ShiftPWM.SetOne(Right_Red_digitF, 0);
      ShiftPWM.SetOne(Right_Red_digitG, 0);
      ShiftPWM.SetOne(Right_Green_digitA, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitB, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitC, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitD, 0);
      ShiftPWM.SetOne(Right_Green_digitE, 0);
      ShiftPWM.SetOne(Right_Green_digitF, 0);
      ShiftPWM.SetOne(Right_Green_digitG, 0);
      ShiftPWM.SetOne(Right_Blue_digitA, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitB, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitC, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitD, 0);
      ShiftPWM.SetOne(Right_Blue_digitE, 0);
      ShiftPWM.SetOne(Right_Blue_digitF, 0);
      ShiftPWM.SetOne(Right_Blue_digitG, 0);
      ShiftPWM.SetOne(Right_Red_digitH, 0);
      ShiftPWM.SetOne(Right_Green_digitH, 0);
      ShiftPWM.SetOne(Right_Blue_digitH, 0);      
    break; 
    case 8: 
      //8 = ABCDEFG
      ShiftPWM.SetOne(Right_Red_digitA, Right_Red);      
      ShiftPWM.SetOne(Right_Red_digitB, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitC, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitD, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitE, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitF, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitG, Right_Red);
      ShiftPWM.SetOne(Right_Green_digitA, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitB, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitC, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitD, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitE, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitF, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitG, Right_Green);
      ShiftPWM.SetOne(Right_Blue_digitA, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitB, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitC, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitD, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitE, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitF, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitG, Right_Blue);
      ShiftPWM.SetOne(Right_Red_digitH, 0);
      ShiftPWM.SetOne(Right_Green_digitH, 0);
      ShiftPWM.SetOne(Right_Blue_digitH, 0);      
    break;  
    case 9: 
      //8 = ABCDFG
      ShiftPWM.SetOne(Right_Red_digitA, Right_Red);      
      ShiftPWM.SetOne(Right_Red_digitB, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitC, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitD, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitE, 0);
      ShiftPWM.SetOne(Right_Red_digitF, Right_Red);
      ShiftPWM.SetOne(Right_Red_digitG, Right_Red);
      ShiftPWM.SetOne(Right_Green_digitA, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitB, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitC, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitD, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitE, 0);
      ShiftPWM.SetOne(Right_Green_digitF, Right_Green);
      ShiftPWM.SetOne(Right_Green_digitG, Right_Green);
      ShiftPWM.SetOne(Right_Blue_digitA, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitB, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitC, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitD, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitE, 0);
      ShiftPWM.SetOne(Right_Blue_digitF, Right_Blue);
      ShiftPWM.SetOne(Right_Blue_digitG, Right_Blue);           
      ShiftPWM.SetOne(Right_Red_digitH, 0);
      ShiftPWM.SetOne(Right_Green_digitH, 0);
      ShiftPWM.SetOne(Right_Blue_digitH, 0);
    break;
  }
  if (Right_Score>9){
    //turn on the "10"s digit:
      ShiftPWM.SetOne(Right_Red_digitH, Right_Red);
      ShiftPWM.SetOne(Right_Green_digitH, Right_Green);
      ShiftPWM.SetOne(Right_Blue_digitH, Right_Blue);
  }
  
  //handle the endzone
  if (endzone == LEFT) {
    ShiftPWM.SetOne(left_red_field, Left_Red);
    ShiftPWM.SetOne(left_green_field, Left_Green);
    ShiftPWM.SetOne(left_blue_field, Left_Blue);
    ShiftPWM.SetOne(right_red_field, Right_Red);
    ShiftPWM.SetOne(right_green_field, Right_Green);
    ShiftPWM.SetOne(right_blue_field, Right_Blue);
  } else {
ShiftPWM.SetOne(left_red_field, Left_Red);
    ShiftPWM.SetOne(right_red_field, Left_Red);
    ShiftPWM.SetOne(right_green_field, Left_Green);
    ShiftPWM.SetOne(right_blue_field, Left_Blue);
    ShiftPWM.SetOne(left_red_field, Right_Red);
    ShiftPWM.SetOne(left_green_field, Right_Green);
    ShiftPWM.SetOne(left_blue_field, Right_Blue);    
  }
  
  //handle the huck direction
  if (huck == LEFT & endzone == LEFT) {
    ShiftPWM.SetOne(left_red_huck, Left_Red);
    ShiftPWM.SetOne(left_green_huck, Left_Green);
    ShiftPWM.SetOne(left_blue_huck, Left_Blue);
    ShiftPWM.SetOne(right_red_huck, 0);
    ShiftPWM.SetOne(right_green_huck, 0);
    ShiftPWM.SetOne(right_blue_huck, 0);
  } else if (huck == LEFT & endzone == RIGHT) {
    ShiftPWM.SetOne(left_red_huck, 0);
    ShiftPWM.SetOne(left_green_huck, 0);
    ShiftPWM.SetOne(left_blue_huck, 0);
    ShiftPWM.SetOne(right_red_huck, Left_Red);
    ShiftPWM.SetOne(right_green_huck, Left_Green);
    ShiftPWM.SetOne(right_blue_huck, Left_Blue);
  } else if (huck == RIGHT & endzone == LEFT) {
    ShiftPWM.SetOne(left_red_huck, 0);
    ShiftPWM.SetOne(left_green_huck, 0);
    ShiftPWM.SetOne(left_blue_huck, 0);
    ShiftPWM.SetOne(right_red_huck, Right_Red);
    ShiftPWM.SetOne(right_green_huck, Right_Green);
    ShiftPWM.SetOne(right_blue_huck, Right_Blue);
  } else if (huck == RIGHT & endzone == RIGHT) {
    ShiftPWM.SetOne(left_red_huck, Right_Red);
    ShiftPWM.SetOne(left_green_huck, Right_Green);
    ShiftPWM.SetOne(left_blue_huck, Right_Blue);
    ShiftPWM.SetOne(right_red_huck, 0);
    ShiftPWM.SetOne(right_green_huck, 0);
    ShiftPWM.SetOne(right_blue_huck, 0);
  }
  digitalWrite(ShiftPWM_latchPin, HIGH);  
  
  
}
