void get_time() {
     int hours; 
     DateTime now = RTC.now();
     
     hours = (int)now.hour();
      if (hours>12) {
        hours = hours-12;
      }
    clockcontents[0] = hours/10;
    if (clockcontents[0] == 0) {
      clockcontents[0] = -1;
    }
    clockcontents[1] = hours%10;
    clockcontents[2] = now.minute()/10;
    clockcontents[3] = now.minute()%10;

    
}  


void calculate_timecap() {
//calculate a timecap that is 90 minutes in the future
//for use when the system is first powered.
  DateTime now = RTC.now();
  int timeminutes = now.minute() + now.hour()*60;
  timecapminutes = timeminutes +90;
  //Serial.println(timeminutes);
  timecapcontents[0] = timecapminutes/600;
  timecapcontents[1] = (timecapminutes%600)/60;
  timecapcontents[2] = ((timecapminutes%600)%60)/10;
  timecapcontents[3] = ((timecapminutes%600)%60)%10;
}

void update_clock1(byte contents[4]) {
  static int digit = 1;
  digitalWrite(ShiftPWM_latchPin, LOW);  
  int clockcounter = 0;
    ShiftPWM.SetOne(clock1_digitA, 0);
    ShiftPWM.SetOne(clock1_digitB, 0);
    ShiftPWM.SetOne(clock1_digitC, 0);
    ShiftPWM.SetOne(clock1_digitD, 0);
    ShiftPWM.SetOne(clock1_digitE, 0);
    ShiftPWM.SetOne(clock1_digitF, 0);
    ShiftPWM.SetOne(clock1_digitG, 0);
  if (digit == 1) {
    ShiftPWM.SetOne(clock1_digit_1, 0);
    ShiftPWM.SetOne(clock1_digit_2, maxBrightness);
    ShiftPWM.SetOne(clock1_digit_3, maxBrightness);
    ShiftPWM.SetOne(clock1_digit_4, maxBrightness);
    clockcounter = contents[0];
  } else if (digit == 2) {
    ShiftPWM.SetOne(clock1_digit_1, maxBrightness);
    ShiftPWM.SetOne(clock1_digit_2, 0);
    ShiftPWM.SetOne(clock1_digit_3, maxBrightness);
    ShiftPWM.SetOne(clock1_digit_4, maxBrightness);
    clockcounter = contents[1];    
  } else if (digit == 3) {
    ShiftPWM.SetOne(clock1_digit_1, maxBrightness);
    ShiftPWM.SetOne(clock1_digit_2, maxBrightness);
    ShiftPWM.SetOne(clock1_digit_3, 0);
    ShiftPWM.SetOne(clock1_digit_4, maxBrightness);
    clockcounter = contents[2];    
  } else if (digit == 4) {
    ShiftPWM.SetOne(clock1_digit_1, maxBrightness);
    ShiftPWM.SetOne(clock1_digit_2, maxBrightness);
    ShiftPWM.SetOne(clock1_digit_3, maxBrightness);
    ShiftPWM.SetOne(clock1_digit_4, 0);
    clockcounter = contents[3];    
    digit = 0;
  }
  digit++;
  
//ground the correct pins to make the number show up.
  switch(clockcounter) {
    case -1:
      //This case is for when we want to blank the clock.
        ShiftPWM.SetOne(clock1_digitA, 0);
        ShiftPWM.SetOne(clock1_digitB, 0);
        ShiftPWM.SetOne(clock1_digitC, 0);
        ShiftPWM.SetOne(clock1_digitD, 0);
        ShiftPWM.SetOne(clock1_digitE, 0);
        ShiftPWM.SetOne(clock1_digitF, 0);
        ShiftPWM.SetOne(clock1_digitG, 0);
    break;
    case 0:
      //0 = A B C D E F;
        ShiftPWM.SetOne(clock1_digitA, maxBrightness);
        ShiftPWM.SetOne(clock1_digitB, maxBrightness);
        ShiftPWM.SetOne(clock1_digitC, maxBrightness);
        ShiftPWM.SetOne(clock1_digitD, maxBrightness);
        ShiftPWM.SetOne(clock1_digitE, maxBrightness);
        ShiftPWM.SetOne(clock1_digitF, maxBrightness);
        ShiftPWM.SetOne(clock1_digitG, 0);
    break;
    case 1:
      //1 = B and C;
        ShiftPWM.SetOne(clock1_digitA, 0);
        ShiftPWM.SetOne(clock1_digitB, maxBrightness);
        ShiftPWM.SetOne(clock1_digitC, maxBrightness);
        ShiftPWM.SetOne(clock1_digitD, 0);
        ShiftPWM.SetOne(clock1_digitE, 0);
        ShiftPWM.SetOne(clock1_digitF, 0);
        ShiftPWM.SetOne(clock1_digitG, 0);
    break;
    case 2: 
      //2 = A B G E D
      ShiftPWM.SetOne(clock1_digitA, maxBrightness);      
      ShiftPWM.SetOne(clock1_digitB, maxBrightness);
      ShiftPWM.SetOne(clock1_digitC, 0);
      ShiftPWM.SetOne(clock1_digitD, maxBrightness);
      ShiftPWM.SetOne(clock1_digitE, maxBrightness);
      ShiftPWM.SetOne(clock1_digitF, 0);
      ShiftPWM.SetOne(clock1_digitG, maxBrightness);
    break;
    case 3: 
      //3 = ABGCD
      ShiftPWM.SetOne(clock1_digitA, maxBrightness);      
      ShiftPWM.SetOne(clock1_digitB, maxBrightness);
      ShiftPWM.SetOne(clock1_digitC, maxBrightness);
      ShiftPWM.SetOne(clock1_digitD, maxBrightness);
      ShiftPWM.SetOne(clock1_digitE, 0);
      ShiftPWM.SetOne(clock1_digitF, 0);
      ShiftPWM.SetOne(clock1_digitG, maxBrightness);
    break;
    case 4: 
      //4 = FGBC
      ShiftPWM.SetOne(clock1_digitA, 0);      
      ShiftPWM.SetOne(clock1_digitB, maxBrightness);
      ShiftPWM.SetOne(clock1_digitC, maxBrightness);
      ShiftPWM.SetOne(clock1_digitD, 0);
      ShiftPWM.SetOne(clock1_digitE, 0);
      ShiftPWM.SetOne(clock1_digitF, maxBrightness);
      ShiftPWM.SetOne(clock1_digitG, maxBrightness);
    break; 
    case 5: 
      //5 = AFGCD
      ShiftPWM.SetOne(clock1_digitA, maxBrightness);      
      ShiftPWM.SetOne(clock1_digitB, 0);
      ShiftPWM.SetOne(clock1_digitC, maxBrightness);
      ShiftPWM.SetOne(clock1_digitD, maxBrightness);
      ShiftPWM.SetOne(clock1_digitE, 0);
      ShiftPWM.SetOne(clock1_digitF, maxBrightness);
      ShiftPWM.SetOne(clock1_digitG, maxBrightness);
    break;
    case 6: 
      //6 = AFGCED
      ShiftPWM.SetOne(clock1_digitA, maxBrightness);      
      ShiftPWM.SetOne(clock1_digitB, 0);
      ShiftPWM.SetOne(clock1_digitC, maxBrightness);
      ShiftPWM.SetOne(clock1_digitD, maxBrightness);
      ShiftPWM.SetOne(clock1_digitE, maxBrightness);
      ShiftPWM.SetOne(clock1_digitF, maxBrightness);
      ShiftPWM.SetOne(clock1_digitG, maxBrightness);
    break;   
    case 7: 
      //7 = ABC
      ShiftPWM.SetOne(clock1_digitA, maxBrightness);      
      ShiftPWM.SetOne(clock1_digitB, maxBrightness);
      ShiftPWM.SetOne(clock1_digitC, maxBrightness);
      ShiftPWM.SetOne(clock1_digitD, 0);
      ShiftPWM.SetOne(clock1_digitE, 0);
      ShiftPWM.SetOne(clock1_digitF, 0);
      ShiftPWM.SetOne(clock1_digitG, 0);
    break; 
    case 8: 
      //8 = ABCDEFG
      ShiftPWM.SetOne(clock1_digitA, maxBrightness);      
      ShiftPWM.SetOne(clock1_digitB, maxBrightness);
      ShiftPWM.SetOne(clock1_digitC, maxBrightness);
      ShiftPWM.SetOne(clock1_digitD, maxBrightness);
      ShiftPWM.SetOne(clock1_digitE, maxBrightness);
      ShiftPWM.SetOne(clock1_digitF, maxBrightness);
      ShiftPWM.SetOne(clock1_digitG, maxBrightness);
    break;  
    case 9: 
      //8 = ABCDFG
      ShiftPWM.SetOne(clock1_digitA, maxBrightness);      
      ShiftPWM.SetOne(clock1_digitB, maxBrightness);
      ShiftPWM.SetOne(clock1_digitC, maxBrightness);
      ShiftPWM.SetOne(clock1_digitD, maxBrightness);
      ShiftPWM.SetOne(clock1_digitE, 0);
      ShiftPWM.SetOne(clock1_digitF, maxBrightness);
      ShiftPWM.SetOne(clock1_digitG, maxBrightness);
    break;     
  }  
  
  //update the colon
  if (colonstate) {
    ShiftPWM.SetOne(clock1_colon, maxBrightness);
  } else {
    ShiftPWM.SetOne(clock1_colon, 0);
  }
  digitalWrite(ShiftPWM_latchPin, HIGH);  
}


void update_clock2(byte contents[4]) {
  digitalWrite(ShiftPWM_latchPin, LOW);  
  static int digit = 1;
  int clockcounter = 0;
    ShiftPWM.SetOne(clock2_digitA, 0);
    ShiftPWM.SetOne(clock2_digitB, 0);
    ShiftPWM.SetOne(clock2_digitC, 0);
    ShiftPWM.SetOne(clock2_digitD, 0);
    ShiftPWM.SetOne(clock2_digitE, 0);
    ShiftPWM.SetOne(clock2_digitF, 0);
    ShiftPWM.SetOne(clock2_digitG, 0);
  if (digit == 1) {
    ShiftPWM.SetOne(clock2_digit_1, 0);
    ShiftPWM.SetOne(clock2_digit_2, maxBrightness);
    ShiftPWM.SetOne(clock2_digit_3, maxBrightness);
    ShiftPWM.SetOne(clock2_digit_4, maxBrightness);
    clockcounter = contents[0];
  } else if (digit == 2) {
    ShiftPWM.SetOne(clock2_digit_1, maxBrightness);
    ShiftPWM.SetOne(clock2_digit_2, 0);
    ShiftPWM.SetOne(clock2_digit_3, maxBrightness);
    ShiftPWM.SetOne(clock2_digit_4, maxBrightness);
    clockcounter = contents[1];    
  } else if (digit == 3) {
    ShiftPWM.SetOne(clock2_digit_1, maxBrightness);
    ShiftPWM.SetOne(clock2_digit_2, maxBrightness);
    ShiftPWM.SetOne(clock2_digit_3, 0);
    ShiftPWM.SetOne(clock2_digit_4, maxBrightness);
    clockcounter = contents[2];    
  } else if (digit == 4) {
    ShiftPWM.SetOne(clock2_digit_1, maxBrightness);
    ShiftPWM.SetOne(clock2_digit_2, maxBrightness);
    ShiftPWM.SetOne(clock2_digit_3, maxBrightness);
    ShiftPWM.SetOne(clock2_digit_4, 0);
    clockcounter = contents[3];    
    digit = 0;
  }
  digit++;
  
//ground the correct pins to make the number show up.
  switch(clockcounter) {
    case -1:
      //This case is for when we want to blank the clock.
        ShiftPWM.SetOne(clock2_digitA, 0);
        ShiftPWM.SetOne(clock2_digitB, 0);
        ShiftPWM.SetOne(clock2_digitC, 0);
        ShiftPWM.SetOne(clock2_digitD, 0);
        ShiftPWM.SetOne(clock2_digitE, 0);
        ShiftPWM.SetOne(clock2_digitF, 0);
        ShiftPWM.SetOne(clock2_digitG, 0);
    break;
    case 0:
      //0 = A B C D E F;
        ShiftPWM.SetOne(clock2_digitA, maxBrightness);
        ShiftPWM.SetOne(clock2_digitB, maxBrightness);
        ShiftPWM.SetOne(clock2_digitC, maxBrightness);
        ShiftPWM.SetOne(clock2_digitD, maxBrightness);
        ShiftPWM.SetOne(clock2_digitE, maxBrightness);
        ShiftPWM.SetOne(clock2_digitF, maxBrightness);
        ShiftPWM.SetOne(clock2_digitG, 0);
    break;
    case 1:
      //1 = B and C;
        ShiftPWM.SetOne(clock2_digitA, 0);
        ShiftPWM.SetOne(clock2_digitB, maxBrightness);
        ShiftPWM.SetOne(clock2_digitC, maxBrightness);
        ShiftPWM.SetOne(clock2_digitD, 0);
        ShiftPWM.SetOne(clock2_digitE, 0);
        ShiftPWM.SetOne(clock2_digitF, 0);
        ShiftPWM.SetOne(clock2_digitG, 0);
    break;
    case 2: 
      //2 = A B G E D
      ShiftPWM.SetOne(clock2_digitA, maxBrightness);      
      ShiftPWM.SetOne(clock2_digitB, maxBrightness);
      ShiftPWM.SetOne(clock2_digitC, 0);
      ShiftPWM.SetOne(clock2_digitD, maxBrightness);
      ShiftPWM.SetOne(clock2_digitE, maxBrightness);
      ShiftPWM.SetOne(clock2_digitF, 0);
      ShiftPWM.SetOne(clock2_digitG, maxBrightness);
    break;
    case 3: 
      //3 = ABGCD
      ShiftPWM.SetOne(clock2_digitA, maxBrightness);      
      ShiftPWM.SetOne(clock2_digitB, maxBrightness);
      ShiftPWM.SetOne(clock2_digitC, maxBrightness);
      ShiftPWM.SetOne(clock2_digitD, maxBrightness);
      ShiftPWM.SetOne(clock2_digitE, 0);
      ShiftPWM.SetOne(clock2_digitF, 0);
      ShiftPWM.SetOne(clock2_digitG, maxBrightness);
    break;
    case 4: 
      //4 = FGBC
      ShiftPWM.SetOne(clock2_digitA, 0);      
      ShiftPWM.SetOne(clock2_digitB, maxBrightness);
      ShiftPWM.SetOne(clock2_digitC, maxBrightness);
      ShiftPWM.SetOne(clock2_digitD, 0);
      ShiftPWM.SetOne(clock2_digitE, 0);
      ShiftPWM.SetOne(clock2_digitF, maxBrightness);
      ShiftPWM.SetOne(clock2_digitG, maxBrightness);
    break; 
    case 5: 
      //5 = AFGCD
      ShiftPWM.SetOne(clock2_digitA, maxBrightness);      
      ShiftPWM.SetOne(clock2_digitB, 0);
      ShiftPWM.SetOne(clock2_digitC, maxBrightness);
      ShiftPWM.SetOne(clock2_digitD, maxBrightness);
      ShiftPWM.SetOne(clock2_digitE, 0);
      ShiftPWM.SetOne(clock2_digitF, maxBrightness);
      ShiftPWM.SetOne(clock2_digitG, maxBrightness);
    break;
    case 6: 
      //6 = AFGCED
      ShiftPWM.SetOne(clock2_digitA, maxBrightness);      
      ShiftPWM.SetOne(clock2_digitB, 0);
      ShiftPWM.SetOne(clock2_digitC, maxBrightness);
      ShiftPWM.SetOne(clock2_digitD, maxBrightness);
      ShiftPWM.SetOne(clock2_digitE, maxBrightness);
      ShiftPWM.SetOne(clock2_digitF, maxBrightness);
      ShiftPWM.SetOne(clock2_digitG, maxBrightness);
    break;   
    case 7: 
      //7 = ABC
      ShiftPWM.SetOne(clock2_digitA, maxBrightness);      
      ShiftPWM.SetOne(clock2_digitB, maxBrightness);
      ShiftPWM.SetOne(clock2_digitC, maxBrightness);
      ShiftPWM.SetOne(clock2_digitD, 0);
      ShiftPWM.SetOne(clock2_digitE, 0);
      ShiftPWM.SetOne(clock2_digitF, 0);
      ShiftPWM.SetOne(clock2_digitG, 0);
    break; 
    case 8: 
      //8 = ABCDEFG
      ShiftPWM.SetOne(clock2_digitA, maxBrightness);      
      ShiftPWM.SetOne(clock2_digitB, maxBrightness);
      ShiftPWM.SetOne(clock2_digitC, maxBrightness);
      ShiftPWM.SetOne(clock2_digitD, maxBrightness);
      ShiftPWM.SetOne(clock2_digitE, maxBrightness);
      ShiftPWM.SetOne(clock2_digitF, maxBrightness);
      ShiftPWM.SetOne(clock2_digitG, maxBrightness);
    break;  
    case 9: 
      //8 = ABCDFG
      ShiftPWM.SetOne(clock2_digitA, maxBrightness);      
      ShiftPWM.SetOne(clock2_digitB, maxBrightness);
      ShiftPWM.SetOne(clock2_digitC, maxBrightness);
      ShiftPWM.SetOne(clock2_digitD, maxBrightness);
      ShiftPWM.SetOne(clock2_digitE, 0);
      ShiftPWM.SetOne(clock2_digitF, maxBrightness);
      ShiftPWM.SetOne(clock2_digitG, maxBrightness);
    break;     
  }  
  //update the colon
  if (colonstate) {
    ShiftPWM.SetOne(clock2_colon, maxBrightness);
  } else {
    ShiftPWM.SetOne(clock2_colon, 0);
  }
  digitalWrite(ShiftPWM_latchPin, HIGH);  



}


