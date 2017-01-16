void low_level_button_stuff() {

    //Button 1
    button1 = 0x03 & ((button1<<1) | ((port_B & 0x02)>>1));
    button2 = 0x03 & ((button2<<1) | ((port_B & 0x01)));
    button3 = 0x03 & ((button3<<1) | ((port_D & 0x80)>>7));
    button4 = 0x03 & ((button4<<1) | ((port_C & 0x01)));
    button5 = 0x03 & ((button5<<1) | ((port_D & 0x20)>>5));
    button6 = 0x03 & ((button6<<1) | ((port_D & 0x40)>>6));
    button7 = 0x03 & ((button7<<1) | ((port_D & 0x08)>>3));
    button8 = 0x03 & ((button8<<1) | ((port_D & 0x10)>>4));
    button9 = 0x03 & ((button9<<1) | ((port_D & 0x04)>>2));

//    Serial.println("Buttons:");
//    Serial.println(button1);
//    Serial.println(button2);
//    Serial.println(button3);
//    Serial.println(button4);
//    Serial.println(button5);
//    Serial.println(button6);
//    Serial.println(button7);
//    Serial.println(button8);
//    Serial.println(button9);
//    Serial.println(" ");

//check which button was pressed
    if (button1 == 1) button_released = 1;
    else if (button2 == 1) button_released = 2;
    else if (button3 == 1) button_released = 3;
    else if (button4 == 1) button_released = 4;
    else if (button5 == 1) button_released = 5;
    else if (button6 == 1) button_released = 6;
    else if (button7 == 2) button_released = 7;//button 7 is RESET. Press and Hold, not active on release.
    else if (button8 == 1) button_released = 8; 
    else if (button9 == 1) button_released = 9;
    else button_released = 0;
//    Serial.print("Button Released: ");
//    Serial.println(button_released);
    
    //start the timer when the rotary encoder is pressed.
    //to check for the rotary encoder press and hold.
    if (button9 == 2) {
      //rotary_encoder is pressed
      rotary_encoder_down = millis() + press_and_hold_delay;
    }
    
    //handle the button press
    button_handler();
    
    //check if the rotary encoder moved
    if (rotary_delta != 0) {
      //the rotary encoder was turned
      encoder_handler();
      //add some time to the timeout if needed
      if (rotary_encoder_reset<millis() + 1000) {
        rotary_encoder_reset +=5000;
      }
    }
    button_change_flag = 0;
  }  
  
  
  
  
  
  


void button_handler() {
 switch (button_released) {
   case LEFT_INCREASE_SCORE:
    //increase the left team score
    Left_Score++;
    if (Left_Score==20) Left_Score = 0;
    //un comment the if statement below when you go back to outdoor ultimate
    endzone = !endzone;
    if (huck != LEFT) {
      huck = !huck;
    }
    SaveScore();
    update_7_segment(); 
   break;
   case RIGHT_INCREASE_SCORE:
     //increase the right team score
     Right_Score++;
     //un comment the if statement below when you go back to outdoor ultimate
     endzone = !endzone;
     if (huck != RIGHT) {
       huck = !huck;
     }
     if (Right_Score==20) Right_Score = 0;
     SaveScore();
     update_7_segment();
   break;
   case LEFT_DECREASE_SCORE:
     //decrease the left team score
     if (Left_Score>0) {
       Left_Score--;
     } else {
       Left_Score = 0;
     }
     update_7_segment;
   break;
   case RIGHT_DECREASE_SCORE:
     //decrease the right team score
     if (Right_Score>0) {
       Right_Score--;
     } else {
       Right_Score = 0;
     }
     update_7_segment;
   break;
   case END_ZONE:
     //toggle the end zone colours
     endzone = !endzone;
     update_7_segment;
   break;
   case HUCK_DIRECTION:
     //toggle the huck direction
     huck = !huck;
     update_7_segment;
   break;
   case BATT_VOLTAGE:
     //display the battery voltage for a few seconds.
     Battery_Display = 1;
     //pick the time to finish displaying the battery.
     Battery_End = millis() + Battery_Delay;
   break;
   case ROTARY_ENCODER:
     if (rotary_encoder_mode != TIME_SET) {
       //the rotary encoder button was pushed
       rotary_encoder_mode++;
       update_7_segment();
       if (rotary_encoder_mode>TIMECAP_SET) rotary_encoder_mode = NULL;
       //Serial.println(rotary_encoder_mode);
       flash_timer = 0;
       flash_state = 0;
       //calculate the time when the rotary encoder should timeout
       rotary_encoder_reset = millis() + rotary_encoder_timeout;
        //turn on both colors:
       Colour_Picker(&Left_Red, &Left_Green, &Left_Blue, Left_Index);
       Colour_Picker(&Right_Red, &Right_Green, &Right_Blue, Right_Index);     
       //Serial.println(rotary_encoder_mode);
       SaveColour();
     }
   break;
   case RESET:
     //The reset button was pressed (not released)
     //mark the time.
     rotary_encoder_down = millis() + press_and_hold_delay;
     Serial.println("Button Press Marked");

   break;
 }  
} 
 
 void encoder_handler() {
   switch (rotary_encoder_mode) {
     case NULL:
     //rotary encoder should do nothing
     break;
     case LEFT_COLOR:
       Left_Index += 10*rotary_delta;
       if (Left_Index<0) Left_Index = 7*maxBrightness;
       if (Left_Index>7*maxBrightness) Left_Index = 0;
       Colour_Picker(&Left_Red, &Left_Green, &Left_Blue, Left_Index);
       update_7_segment();
     break;
     case RIGHT_COLOR:
       Right_Index += 10*rotary_delta;
       if (Right_Index<0) Right_Index = 7*maxBrightness;
       if (Right_Index>7*maxBrightness) Right_Index = 0;
       Colour_Picker(&Right_Red, &Right_Green, &Right_Blue, Right_Index);
       update_7_segment();
     break;
     case TIME_SET:
       unixtime += rotary_delta*60;
     break;
     case TIMECAP_SET:
       timecapminutes += rotary_delta;
     break;
       
   }
}
  
  
  
  
  
  
  
  
  
  
  

