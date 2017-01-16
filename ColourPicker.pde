void Colour_Picker(int *Red, int *Green, int *Blue, int index) {
 //pick the blue colour
 if ((0<=index)                && (index < maxBrightness) ||
    (2*maxBrightness<= index) && (index < 3*maxBrightness) ||
    (4*maxBrightness<= index) && (index < 5*maxBrightness)) {
      *Blue = maxBrightness - index%maxBrightness;
 } else if 
    ((maxBrightness<=index) && (index < 2*maxBrightness) ||
    (3*maxBrightness<=index) && (index < 4*maxBrightness) ||
    (5*maxBrightness<=index) && (index <6*maxBrightness)) {
      *Blue = index%maxBrightness;
 } else if
    ((6*maxBrightness<=index) && (index <7*maxBrightness)) {
      *Blue = maxBrightness;
 }
    
 if ((0<=index)               && (index < maxBrightness) ||
     (4*maxBrightness<=index) && (index < 5*maxBrightness)) {
       *Green = index%maxBrightness;
     } else if
       ((2*maxBrightness<=index) && (index < 3*maxBrightness) ||
        (6*maxBrightness<=index) && (index < 7*maxBrightness)) {
       *Green = maxBrightness - index%maxBrightness;
        } else if 
       ((maxBrightness<=index) && (index < 2*maxBrightness) ||
        (5*maxBrightness<=index) && (index <6*maxBrightness)) {
       *Green = maxBrightness;
        } else if
       ((3*maxBrightness<=index) && (index < 4*maxBrightness)) {
         *Green = 0;
       }
       
  if ((0<=index) && (index < 2*maxBrightness)) {
      *Red = 0;
  } else if
    ((3*maxBrightness<=index) && (index<6*maxBrightness)) {  
      *Red = maxBrightness;
  } else if
    ((2*maxBrightness<=index) && (index<3*maxBrightness)) {
      *Red = index%maxBrightness;
    } else if
    ((6*maxBrightness<=index) && (index<7*maxBrightness)) {
      *Red = maxBrightness - index%maxBrightness;
    }
     
     
   
    

    
    
      
  
  
  
  
  
  
  
}
