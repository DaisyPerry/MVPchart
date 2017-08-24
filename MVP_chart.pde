
String [][] nbaData = { // Columns go across, rows go down.  Each is numbered starting from 0
//          0      1             2              3     4    5       6        7        8       9   10   11    12    13    14   15     16   17     18   19    20   
/* 0 */  { "Rank","PlayerFname","PlayerLname", "Age","Tm","First","PtsWon","PtsMax","Share","G","MP","PTS","TRB","AST","STL","BLK","FG%","3P%","FT%","WS","WS/48" },
/* 1 */  { "1","Stephen","Curry","26","GSW","100.0","1198.0","1300","0.922","80","32.7","23.8","4.3","7.7","2.0","0.2",".487",".443",".914","15.7",".288" },
/* 2 */  { "2","James","Harden","25","HOU","25.0","936.0","1300","0.720","81","36.8","27.4","5.7","7.0","1.9","0.7",".440",".375",".868","16.4",".265" },
/* 3 */  { "3","LeBron","James","30","CLE","5.0","552.0","1300","0.425","69","36.1","25.3","6.0","7.4","1.6","0.7",".488",".354",".710","10.4",".199" },
/* 4 */  { "4","Russell","Westbrook","26","OKC","0.0","352.0","1300","0.271","67","34.4","28.1","7.3","8.6","2.1","0.2",".426",".299",".835","10.6",".222" },
/* 5 */  { "5","Anthony","Davis","21","NOP","0.0","203.0","1300","0.156","68","36.1","24.4","10.2","2.2","1.5","2.9",".535",".083",".805","14.0",".274" },
/* 6 */  { "6","Chris","Paul","29","LAC","0.0","124.0","1300","0.095","82","34.8","19.1","4.6","10.2","1.9","0.2",".485",".398",".900","16.1",".270" },
/* 7 */  { "7","LaMarcus","Aldridge","29","POR","0.0","6.0","1300","0.005","71","35.4","23.4","10.2","1.7","0.7","1.0",".466",".352",".845","8.6",".165" },
/* 8 */  { "9T","Marc","Gasol","30","MEM","0.0","3.0","1300","0.002","81","33.2","17.4","7.8","3.8","0.9","1.6",".494",".176",".795","10.2",".182" },
/* 9 */  { "9T","Blake","Griffin","25","LAC","0.0","3.0","1300","0.002","67","35.2","21.9","7.6","5.3","0.9","0.5",".502",".400",".728","9.0",".183" },
/* 10 */ { "12T","Tim","Duncan","38","SAS","0.0","1.0","1300","0.001","77","28.9","13.9","9.1","3.0","0.8","2.0",".512",".286",".740","9.6",".207" },
/* 11 */ { "12T","Kawhi","Leonard","23","SAS","0.0","1.0","1300","0.001","64","31.8","16.5","7.2","2.5","2.3","0.8",".479",".349",".802","8.6",".204" },
/* 12 */ { "12T","Klay","Thompson","24","GSW","0.0","1.0","1300","0.001","77","31.9","21.7","3.2","2.9","1.1","0.8",".463",".439",".879","8.8",".172" }
} ;

//**** Set Display Window width (500) and height (500) 
int high = 500 ;
int wide = 500 ;
int grid = 50; //sets grid lines at 50 px apart in both directions.

// labels the X (horizontal axis)
void labelXAxis ( String title )
{
    text ( title, (wide / 2) - ( title.length () / 2 ), 25 ) ;
    
} // end labelXAxis ( )

// labels the Y (vertical axis)
void labelYAxis ( String title )
{
  pushMatrix();
  translate(10,high/2);
  rotate(HALF_PI);
  text(title,0,-5);
  popMatrix(); 
} // end labelYAxis ( )

void setup ( )
{
  size ( 500, 500 ) ;
  background (0) ; //black background
  noLoop ( ) ;
  
  // X & Y axis titles
  labelXAxis ( "Age" ) ;
  labelYAxis ( "FT%" ) ;
 
 //creates a grid for customization (7)
 
  for (int i = 0; i < width; i+=grid) {
    line (i, 0, i, height);
    stroke(50);
  }; //end y lines
  
  for (int i = 0; i < height; i+=grid) {
    line (0, i, width, i);
  }; //end x lines

  for ( int row = 1 ; row < 13 ; row++ )
  {
    //(1) gets the columns of nbaData for row i. 
    float age = float (nbaData[row][3]); 
    float FT = float (nbaData[row][18]);
    float x = map(age, 16, 40, 10, 480);
    float y = map(FT, .65, 1, 10, 425 );
    ellipse(x, y, 5, 5); //(4)
    text(nbaData[row][1], x-15, y+15);
    fill(255,70,50);
    println("NAME: " + nbaData[row][1] + ", AGE: " + nbaData[row][3] + ", FREE THROW %: " + nbaData[row][18]); //(5)
  };    // end for
 
  
  //I honestly don't know why Stephen Curry's name is in white when all the others are orange,
  //but I felt like it was appropriate to have his name stand out, so I left it that way. 


}; // end setup ()
