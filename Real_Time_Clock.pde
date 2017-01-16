void update_time() {
      //DateTime now = RTC.now();
      if (timecapminutes>720) timecapminutes-=720;
        timecapcontents[0] = timecapminutes/600;
      if (timecapcontents[0] == 0) timecapcontents[0] = -1;
      timecapcontents[1] = (timecapminutes%600)/60;
      timecapcontents[2] = ((timecapminutes%600)%60)/10;
      timecapcontents[3] = ((timecapminutes%600)%60)%10;  
      if (millis() - lasttimeupdate > timeupdate) {
        get_time();
        //current_unix_time = now.unixtime();
        //Serial.println(current_unix_time);
        colonstate = !colonstate;
        lasttimeupdate = millis();
        Battery_Voltage = (float)analogRead(A3) * Battery_Factor;
        //check if the battery is getting low
        if (Battery_Voltage<=Low_Battery_Cutoff) {
          //shutdown the program
          Low_Batt();
        }
        //Serial.println(Battery_Voltage);
      }

  update_clock_display();
}

void Low_Batt() {
  //turn off the display
  ShiftPWM.SetAll(0);
  //enter an endless loop;
  while(1) {
  }
}


void set_clock() {
  
  //Serial.println(flash_state);
  if (flash_state == 0) {
   //this is the first time we've entered here.
   DateTime now = RTC.now();
   unixtime = now.unixtime();
   //Serial.print("Time seconds: ");
   //Serial.println(unixtime);
   flash_state = 1;
  }
  if (flash_state == 1) {
   //calculate the new clock contents. 
   timeminutes = unixtime%86400/60;
   Serial.print("Time Minutes: ");
   Serial.println(timeminutes);
   clockcontents[0] = timeminutes/600;
   clockcontents[1] = (timeminutes%600)/60;
   clockcontents[2] = ((timeminutes%600)%60)/10;
   clockcontents[3] = ((timeminutes%600)%60)%10;
   timecapcontents[0] = -1;
   timecapcontents[1] = -1;
   timecapcontents[2] = -1;
   timecapcontents[3] = -1;
   //Serial.println(timeminutes*60);
   //send the new time to the RTC.
   RTC.adjust(DateTime(unixtime));
  }
  
  update_clock_display();
}


void set_timecap() {
  clockcontents[0] = -1;
  clockcontents[1] = -1;
  clockcontents[2] = -1;
  clockcontents[3] = -1;
  timecapcontents[0] = timecapminutes/600;
  timecapcontents[1] = (timecapminutes%600)/60;
  timecapcontents[2] = ((timecapminutes%600)%60)/10;
  timecapcontents[3] = ((timecapminutes%600)%60)%10;
  update_clock_display();
  
}

void update_clock_display() {
     if (millis()-lastclockupdate > clockupdate) {
      update_clock1(clockcontents);
      update_clock2(timecapcontents);
      lastclockupdate = millis();
    } 
  
}


