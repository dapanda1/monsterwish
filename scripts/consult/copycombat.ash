boolean Lunging = have_skill( $skill[ Lunging Thrust-Smack ] );
boolean Zydeco = have_skill( $skill[ Cone of Zydeco ] );
boolean Refrain = have_skill( $skill[ Bawdy Refrain ] );
boolean Kneebutt = have_skill( $skill[ Kneebutt ] );
boolean Shank = have_skill( $skill[ Disco Shank ] );
boolean Saucegeyser = have_skill( $skill[ Saucegeyser ] );
boolean Pastalord = have_skill( $skill[ Weapon of the Pastalord ] );


void main( int initround, string foe, string page )
{
//weapon based on class
if (my_class() == $class[seal clubber]){
	if ( Lunging ) visit_url( "fight.php?action=skill&whichskill=1005" );
}

if (my_class() == $class[turtle tamer]){
	if ( Kneebutt ) visit_url( "fight.php?action=skill&whichskill=2015" );
}

if (my_class() == $class[pastamancer]){
	if ( Pastalord ) visit_url( "fight.php?action=skill&whichskill=3008" );
}

if (my_class() == $class[disco bandit]){
	if ( Shank ) visit_url( "fight.php?action=skill&whichskill=5035" );
}

if (my_class() == $class[accordion thief]){
	if ( Refrain ) visit_url( "fight.php?action=skill&whichskill=6037" );
    if ( Zydeco ) visit_url( "fight.php?action=skill&whichskill=6040" );
}

	if ( Saucegeyser ) visit_url( "fight.php?action=skill&whichskill=4012" );

}