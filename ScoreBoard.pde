#include <SPI.h>
#include <avr/interrupt.h>  
#include <avr/io.h>
#include <ShiftPWM.h>
#include <Wire.h>
#include <RTClib.h>
#include <EEPROM.h>



//define the button number mapping
//useful when the buttons are connected to 
//different inputs
#define LEFT_INCREASE_SCORE       1
#define RIGHT_INCREASE_SCORE      2
#define LEFT_DECREASE_SCORE       3
#define RIGHT_DECREASE_SCORE      4
#define HUCK_DIRECTION            5
#define END_ZONE                  6
#define RESET                     7
#define BATT_VOLTAGE              8
#define ROTARY_ENCODER            9

#define NULL                      0
#define LEFT_COLOR                1
#define RIGHT_COLOR               2 
#define TIME_SET                  6
#define TIMECAP_SET               3 

//endzone team
#define LEFT  0
#define RIGHT 1

//real time clock stuff
#define DS1307_I2C_ADDRESS 0x68  // This is the I2C address
byte second, minute, hour, dayOfWeek, dayOfMonth, month, year;
RTC_DS1307 RTC;


//mapping for the display digits




byte Left_Red_digitA = 22;
byte Left_Red_digitB = 19;
byte Left_Red_digitC = 10;
byte Left_Red_digitD = 13;
byte Left_Red_digitE = 4;
byte Left_Red_digitF = 7;
byte Left_Red_digitG = 16;
byte Left_Red_digitH = 1;
byte Left_Green_digitA = 21;
byte Left_Green_digitB = 18;
byte Left_Green_digitC = 9;
byte Left_Green_digitD = 14;
byte Left_Green_digitE = 5;
byte Left_Green_digitF = 6;
byte Left_Green_digitG = 17;
byte Left_Green_digitH = 2;
byte Left_Blue_digitA = 23;
byte Left_Blue_digitB = 20;
byte Left_Blue_digitC = 11;
byte Left_Blue_digitD = 12;
byte Left_Blue_digitE = 3;
byte Left_Blue_digitF = 8;
byte Left_Blue_digitG = 15;
byte Left_Blue_digitH = 0;

byte Right_Red_digitA = 43;
byte Right_Red_digitB = 46;
byte Right_Red_digitC = 52;
byte Right_Red_digitD = 58;
byte Right_Red_digitE = 55;
byte Right_Red_digitF = 40;
byte Right_Red_digitG = 49;
byte Right_Red_digitH = 61;
byte Right_Green_digitA = 44;
byte Right_Green_digitB = 47;
byte Right_Green_digitC = 53;
byte Right_Green_digitD = 59;
byte Right_Green_digitE = 54;
byte Right_Green_digitF = 63;
byte Right_Green_digitG = 50;
byte Right_Green_digitH = 60;
byte Right_Blue_digitA = 42;
byte Right_Blue_digitB = 45;
byte Right_Blue_digitC = 51;
byte Right_Blue_digitD = 57;
byte Right_Blue_digitE = 56;
byte Right_Blue_digitF = 41;
byte Right_Blue_digitG = 48;
byte Right_Blue_digitH = 62;

//playing field and frisbee
byte left_red_field = 26;
byte left_green_field = 27;
byte left_blue_field = 25;
byte left_red_huck = 29;
byte left_green_huck = 28;
byte left_blue_huck = 30;
byte red_frisbee = 32;
byte green_frisbee = 31;
byte blue_frisbee = 33;
byte right_red_huck = 35;
byte right_green_huck = 36;
byte right_blue_huck = 34;
byte right_red_field = 38;
byte right_green_field = 39;
byte right_blue_field = 37;

byte clock1_digit_1 = 87;
byte clock1_digit_2 = 86;
byte clock1_digit_3 = 85;
byte clock1_digit_4 = 84;
byte clock1_digitA = 67;
byte clock1_digitB = 69;
byte clock1_digitC = 66;
byte clock1_digitD = 71;
byte clock1_digitE = 70;
byte clock1_digitF = 64;
byte clock1_digitG = 68;
byte clock1_colon = 65;
byte clock2_digit_1 = 83;
byte clock2_digit_2 = 82;
byte clock2_digit_3 = 81;
byte clock2_digit_4 = 80;
byte clock2_digitA = 75;
byte clock2_digitB = 77;
byte clock2_digitC = 74;
byte clock2_digitD = 79;
byte clock2_digitE = 78;
byte clock2_digitF = 72;
byte clock2_digitG = 76;
byte clock2_colon = 73;
byte clockcontents[4] = {1, 2, 3, 4};
byte timecapcontents[4] = {0, 0, 0, 0};
byte blankclock[4] = {-1, -1, -1, -1};
long unixtime;
int timeminutes;
int timecapminutes;

int Left_Red = 255;
int Left_Green = 128;
int Left_Blue = 128;
int Right_Red = 128;
int Right_Green = 128;
int Right_Blue = 255;
int Left_Index = 500;
int Right_Index = 100;

byte Left_Score = 0;
byte Right_Score = 0;

int clockupdate = 0;
int timeupdate = 1000;
long lasttimeupdate = 0;
int testupdate = 5000;
long lasttestupdate = 0;
long lastclockupdate = 0;
boolean colonstate = 0;


long lastupdate = 0;
int counter = 0;
int counter1 = 48;
int counter2;
int bytes = 0;
const int ShiftPWM_latchPin=10;
const bool ShiftPWM_invertOutputs = 0;

unsigned char maxBrightness = 255;
unsigned char pwmFrequency = 75;
int numRegisters = 12;

//Button stuff
int button_change_flag = 0;
volatile int port_B = 15;
volatile int port_C = 15;
volatile int port_D = 15;
volatile long rotary_buffer = 0;
volatile int rotary_delta = 0;
byte rotary_flag = 0;
int rotary_buffer_delay = 200;
long last_rotary_buffer = 0;
int encoder_value = 0;
int temp_button = 0;
int left_up_button = 1;
int right_up_button = 1;
int button1 = 1;
int button2 = 1;
int button3 = 1;
int button4 = 1;
int button5 = 1;
int button6 = 1;
int button7 = 1;
int button8 = 1;
int button9 = 1;
int button_released = 0;

int rotary_encoder_mode = 0;
long rotary_encoder_timeout = 10000; //rotary encoder timeour
long rotary_encoder_reset = 0;
long rotary_encoder_down = 0;
int press_and_hold_delay = 3000; //3 seconds to press and hold.
long flash_timer = 0;
int flash_length = 100;
boolean flash_state = 0;


byte huck = LEFT;
byte endzone = LEFT;

int Battery_Voltage = 0;
float Battery_Factor = 1.33;
int Low_Battery_Cutoff = 975;

//delay stuff
int Battery_Delay = 10000;
int Battery_Display = 0;
long Battery_End = 0;

//eeprom save timing
int eeprom_save_delay = 30000;
long last_eeprom_save = 0;


void setup()
{
  //Inputs
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  pinMode(2, INPUT);
  pinMode(3, INPUT);
  pinMode(4, INPUT);
  pinMode(5, INPUT);
  pinMode(6, INPUT);
  pinMode(7, INPUT);
  pinMode(8, INPUT);
  pinMode(9, INPUT);
  pinMode(12, INPUT);
  digitalWrite(A0, HIGH);
  digitalWrite(A1, HIGH);
  digitalWrite(A2, HIGH);
  digitalWrite(A3, LOW);
  digitalWrite(2, HIGH);
  digitalWrite(3, HIGH);
  digitalWrite(4, HIGH);
  digitalWrite(5, HIGH);
  digitalWrite(6, HIGH);
  digitalWrite(7, HIGH);
  digitalWrite(8, HIGH);
  digitalWrite(9, HIGH);
  digitalWrite(12, HIGH);
   //Pin Change interrupts 
   //Setup a pinchange interrupt on PORTB pins 0 and 1, which is D8 and D9 on the mini
   //D8 = PORTB 0 = PCINT0
   //D9 = PORTB 1 = PCINT1
   //D7 = PORTD 7 = PCINT23
   //D6 = PORTD 6 = PCINT22
   //D5 = PORTD 5 = PCINT21
   //D4 = PORTD 4 = PCINT20
   //D3 = PORTD 3 = PCINT19
   //D2 = PORTD 2 = PCINT18
   //A0 = PORTC 0 = PCINT8
   
   //activate the Pin Change interupts to monitor all the pins required for the 9 buttons and the rotary encoder.
  PCMSK0 = _BV(PCINT1) | _BV(PCINT0); 
  PCMSK1 = _BV(PCINT14) | _BV(PCINT8) | _BV(PCINT9) | _BV(PCINT10);
  PCMSK2 = _BV(PCINT23) | _BV(PCINT22) | _BV(PCINT21) | _BV(PCINT20) | _BV(PCINT19) | _BV(PCINT18);
  PCICR |= _BV(PCIE0) | _BV(PCIE1) | _BV(PCIE2);// Enable interrupt control register
  
  pinMode(ShiftPWM_latchPin, OUTPUT);
  SPI.setBitOrder(LSBFIRST);
  SPI.setClockDivider(SPI_CLOCK_DIV4); 
  SPI.begin(); 
  
  ShiftPWM.SetAmountOfRegisters(numRegisters);
  ShiftPWM.Start(pwmFrequency,maxBrightness); 
  Serial.begin(115200); 
  ShiftPWM.SetAll(0);
  
  //RTC
  Wire.begin();
  RTC.begin();

  get_time();
  //current_unix_time = now.unixtime();
  //fade in the frisbee
  counter2 = 0;
  for (int i = 0; i<maxBrightness;i++) {
    ShiftPWM.SetAll(i);
    ShiftPWM.SetAll(i);
    ShiftPWM.SetAll(i);  
    delay(8);
  }

  //Get Data from the EEPROM
  GetData();
   
  update_clock1(clockcontents);
  update_clock2(timecapcontents);
  //setup the default team colours
  Colour_Picker(&Left_Red, &Left_Green, &Left_Blue, Left_Index);
  Colour_Picker(&Right_Red, &Right_Green, &Right_Blue, Right_Index);  
  update_7_segment();
  

  Serial.print("freeRAM: ");
  Serial.println(freeRAM(),DEC);
  

  
}


void loop() {

  if (millis()>last_eeprom_save) {
    //save data to the EEPROM
    SaveData();
    last_eeprom_save = millis() + eeprom_save_delay;
  }
    


  if (!Battery_Display) {// Display Time
    if (rotary_encoder_mode==TIME_SET) {
      set_clock(); //update the time based on the rotary encoder
    } else if (rotary_encoder_mode==TIMECAP_SET) { 
      //update the timecap
      colonstate = 0;
      set_timecap();
 
    } else {
      //Serial.println(millis());
      update_time();//display current time
    }
  } else { //Display the battery voltage
      clockcontents[0] = (int)Battery_Voltage/1000;
      clockcontents[1] = (int)(Battery_Voltage/100)%10;
      clockcontents[2] = (int)(Battery_Voltage/10)%10;
      clockcontents[3] = (int)Battery_Voltage%10;
      timecapcontents[0] = -1;
      timecapcontents[1] = -1;
      timecapcontents[2] = -1;
      timecapcontents[3] = -1;
      colonstate = 0;
      update_clock_display();
      if (millis()>Battery_End) {
        //go back to Clock Mode
        Battery_Display = 0;
      }
  }
  

 
  //reset the rotary encoder if it has timed out
  if (millis()>rotary_encoder_reset) {
    if (rotary_encoder_mode!=0) {
      SaveColour();
    }
    rotary_encoder_mode = 0;
   
  }
  
  //flash whatever is currently being controlled by the rotary encoder.
  if (rotary_encoder_mode == LEFT_COLOR) {
    //flash the left color
    if (flash_timer == 0)  {
      //turn the indication off for flash_length. 
      flash_timer = millis() + flash_length;
      Left_Red = 0;
      Left_Green = 0;
      Left_Blue = 0;
      update_7_segment();
    }
    if (millis()>flash_timer) {
      if (flash_state == 0) {
        flash_timer = millis() + (1000-flash_length);
        Colour_Picker(&Left_Red, &Left_Green, &Left_Blue, Left_Index);
        flash_state = 1;
      } else {
        flash_timer = 0;
        flash_state = 0;
      }      
    }      
  }
  if (rotary_encoder_mode == RIGHT_COLOR) {
    //flash the left color
    if (flash_timer == 0)  {
      //turn the indication off for flash_length. 
      flash_timer = millis() + flash_length;
      Right_Red = 0;
      Right_Green = 0;
      Right_Blue = 0;
      update_7_segment();
    }
    if (millis()>flash_timer) {
      if (flash_state == 0) {
        flash_timer = millis() + (1000-flash_length);
        Colour_Picker(&Right_Red, &Right_Green, &Right_Blue, Right_Index);
        flash_state = 1;
      } else {
        flash_timer = 0;
        flash_state = 0;
      }      
      
    }      
  }

  //use rotary_buffer_delay to slow shift out the rotary_buffer data and create rotary encoder output. 
  //the rotary_buffer is cleared any time that hte rotary encoder is pressed. 
  // this was because of the problem of the time always changing when ever you pressed the rotary encoder.
  if (millis() > last_rotary_buffer + rotary_buffer_delay) {
    // shift the next two bits out of the rotary buffer. use them to determine if the rotary encoder was spun
    rotary_flag = rotary_buffer>>30;
    if (rotary_flag == 2) {
      //clockwise rotation
      rotary_delta = 1;
    }else if (rotary_flag == 1) {
      rotary_delta = -1;
    }else {
      rotary_delta = 0;
    }
    rotary_buffer = rotary_buffer<<2;
    last_rotary_buffer = millis();  
    //Serial.println(rotary_buffer,BIN);  
    //Serial.println(rotary_delta);  
  }
    
  //check to see if the RESET or ROTARY ENCODER button is being pressed and held
  if (millis() > rotary_encoder_down) { 
    //the RESET button was pressed "Delay" seconds ago. 
    //Check to see if it is still pressed.
    if (button7 ==2) {
      //RESET still pressed. 
      //reset the board.
      //Serial.println("Reset the board");
      Left_Score = 0;
      Right_Score = 0;
      endzone = LEFT;
      huck = LEFT;
      update_7_segment;
    } else {
      //RESET was released too soon
      //do nothing
      //Serial.println("Do Nothing");
    }
    
    //we also could have got here if the rotary encoder button was pressed. 
    //check to see if it is still pressed. 
    if (button9 == 2) {
      //rotary encoder is still pressed. 
      //activate time set mode.
      //Serial.println("Time Set");
      rotary_encoder_mode = TIME_SET;
    } else {
      //Serial.println("Do Nothing");
    }
    rotary_encoder_down = 0xFFFF;
  }
    



  if(button_change_flag) {

    low_level_button_stuff();
  }
  update_7_segment();
}



//interrupt
ISR(PCINT0_vect) {
//  Serial.println("PCINT0 fired");
//  Serial.println((int)PINB);
  button_change_flag = 1;
  //port_B = 0x03 & PINB;
  port_B = PINB;
}

ISR(PCINT2_vect) {
//  Serial.println("PCINT2 fired");
//Serial.print("PinD ");
//  Serial.println((int)PIND);
  //port_D = 0xFC & PIND;
  port_D = PIND;
  button_change_flag = 1;
}

ISR(PCINT1_vect) {
  //variables for the rotary encoder
  static int8_t enc_states[] = {0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0};
  static uint8_t old_AB = 0;


 // Serial.println("PCINT1 fired");
//Serial.print("PinD: ");
//  Serial.println((int)PIND);
//Serial.print("PinC: ");
//  Serial.println((int)PINC);
  //port_D = 0xF8 & PIND;
  //port_C = 0x01 & PINC;
  port_D = PIND;
  port_C = PINC;
  button_change_flag = 1;
  
  
  //handle the rotary encoder
  /* returns change in encoder state (-1,0,1) */
  /**/
  old_AB <<= 2;                   //remember previous state
  old_AB |= ( PINC & 0x06 )>>1;  //add current state
  if (enc_states[(old_AB&0x0f)]==1) {
    //shift a "10" into rotary delta
    rotary_buffer = rotary_buffer<<2;
    rotary_buffer |= 2;
  } else if (enc_states[(old_AB&0x0f)]==-1) {
    //shift a "01" into rotary delta
    rotary_buffer = rotary_buffer<<2;
    rotary_buffer |= 3;
  } else {
    //shift a "00" into the rotary delta
    rotary_buffer = rotary_buffer<<2;
  }
    
  rotary_delta = (int)enc_states[(old_AB&0x0f)];
//  Serial.println(rotary_delta);
//  Serial.println((int)old_AB&0x0f);
}



unsigned long freeRAM() {
	uint8_t * heapptr, * stackptr;
	stackptr = (uint8_t *)malloc(4); // use stackptr temporarily
	heapptr = stackptr; // save value of heap pointer
	free(stackptr); // free up the memory again (sets stackptr to 0)
	stackptr = (uint8_t *)(SP); // save value of stack pointer
	return stackptr - heapptr;
}
