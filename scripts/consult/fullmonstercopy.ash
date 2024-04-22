boolean funk = have_skill( $skill[ Ambidextrous Funkslinging ] );
boolean putty = item_amount( $item[ Spooky Putty monster ] ) == 0 && item_amount( $item[ Spooky Putty sheet ] ) > 0 && get_property( "spookyPuttyCopiesMade" ).to_int() < 5;
boolean raindoh = item_amount( $item[ Rain-Doh box full of monster ] ) == 0 && item_amount( $item[ Rain-Doh black box ] ) > 0 && get_property( "_raindohCopiesMade" ).to_int() == 0;
boolean camera = item_amount( $item[ shaking 4-d camera ] ) == 0 && item_amount( $item[ 4-d camera ] ) > 0 && !get_property( "_cameraUsed" ).to_boolean();
boolean ice = item_amount( $item[ ice sculpture ] ) == 0 && item_amount( $item[ unfinished ice sculpture ] ) > 0 && get_property( "_iceSculptureUsed" ).to_boolean();
boolean print = item_amount( $item[ screencapped monster ] ) == 0 && item_amount( $item[ print screen button ] ) > 0 && get_property( "screencappedMonster" ).to_boolean();
boolean paint = item_amount( $item[ alpine watercolor set ] ) == 1 && get_property( "chateauAvailable" ).to_boolean(); 
boolean crappy = item_amount( $item[ shaking crappy camera ] ) == 0 && item_amount( $item[ crappy camera ] ) > 0 && !get_property( "_crappyCameraUsed" ).to_boolean();
boolean arrow = my_familiar() == $familiar[ Obtuse Angel ] && get_property( "_badlyRomanticArrows" ).to_int() == 0;
boolean wink = my_familiar() == $familiar[ Reanimated Reanimator ] && get_property( "_badlyRomanticArrows" ).to_int() == 0;
boolean digitize = have_skill( $skill[ Digitize ] ) && get_property("_sourceTerminalDigitizeUses") < 3;


boolean usedigitize = false;
boolean usewinkarrow = false;

void main( int initround, string foe, string page )
{
	if( usewinkarrow == true ){
   		if ( arrow ) visit_url( "fight.php?action=skill&whichskill=7108" );
		if ( wink ) visit_url( "fight.php?action=skill&whichskill=7168" );
	}
	if( usedigitize == true ){
		if ( digitize ) visit_url( "fight.php?action=skill&whichskill=7274" );
	}
	
    string macro;
    if ( putty ) macro += "use 3665;";
    if ( camera ) macro += "use 4169;";
    if ( raindoh ) macro += "use 5563;";
	if ( ice ) macro += "use 7079;";
	if ( print ) macro += "use 9022;";
	if ( paint ) macro += "use 8033;";
	if ( crappy ) macro += "use 7173;";

    if ( macro != "" ) visit_url( "fight.php?action=macro&macrotext=" + url_encode( macro ), true, true );
}
