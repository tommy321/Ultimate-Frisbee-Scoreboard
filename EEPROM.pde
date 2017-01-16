void SaveData() {
  //Serial.println("Saving EEPROM now");
  //saves the following data to the EEPROM. 
  
  //get the current time
  DateTime now = RTC.now();
  long unixtime = now.unixtime();
  //the current unix time
  //(long)
  //Serial.print("Unixtime: ");
  //Serial.println(unixtime);
  EEPROM.write(0, unixtime>>24);
  EEPROM.write(1, unixtime>>16&0xff);
  EEPROM.write(2, unixtime>>8&0xff);
  EEPROM.write(3, unixtime&0xff);
 //timecap
  EEPROM.write(12, timecapminutes>>8);
  EEPROM.write(13, timecapminutes&0xff);
}

void SaveScore() {
  //left score
  //(byte)
  EEPROM.write(4,Left_Score);
  //right score
  //(byte)
  EEPROM.write(5,Right_Score);
  //huck direction
  //(byte)
  EEPROM.write(10, huck);
  //endzone
  //(byte)
  EEPROM.write(11, endzone);
}

void SaveColour() {
  //left colour
  //(int)
  EEPROM.write(6, Left_Index>>8);
  EEPROM.write(7, Left_Index&0xff);
  
  //right color
  //(int)
  EEPROM.write(8, Right_Index>>8);
  EEPROM.write(9, Right_Index&0xff);
  

}
  
void GetData() {
  
  //get the saved Unixtime
  byte byte1 = 0;
  byte byte2 = 0;
  byte byte3 = 0;
  byte byte4 = 0;
  
  byte1 = EEPROM.read(0);
  byte2 = EEPROM.read(1);
  byte3 = EEPROM.read(2);
  byte4 = EEPROM.read(3);
  
  long unixtime =  0;
  unixtime |= (long)byte1<<24;
  unixtime |= (long)byte2<<16;
  unixtime |= (long)byte3<<8; 
  unixtime |= (long)byte4;
  Serial.print("Last time saved: ");
  Serial.println(unixtime);
  
  //figure out how long the scoreboard has been off. 
  DateTime now = RTC.now();
  long offtime = now.unixtime() - unixtime;
  Serial.print("The scoreboard has been off for: ");
  Serial.println(offtime);
  
  if(offtime>=3600){// the scoreboard has been off an hour
    //reset the values
    Serial.println("Resetting the board");
    Left_Score = 0;
    Right_Score = 0;
    Left_Index = 1;
    Right_Index = 1;
    huck = LEFT;
    endzone = LEFT;
    //calculate a timecap 90 minutes into the future
    calculate_timecap();
  }else { //the scoreboard has been off for less than an hour. 
    //load the values from the EEPROM.
    Serial.println("Loading values from memory");    
    Left_Score = EEPROM.read(4);
    Right_Score = EEPROM.read(5);
    Left_Index = EEPROM.read(6)<<8 | EEPROM.read(7);
    Right_Index = EEPROM.read(8)<<8 | EEPROM.read(9);
    huck = EEPROM.read(10);
    endzone = EEPROM.read(11);
    timecapminutes = EEPROM.read(12)<<8 | EEPROM.read(13);
  }
}
