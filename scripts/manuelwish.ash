script "manwish.ash";
notify dapanda;
since r18238;

string __manuelwish_version = "0.6";

//You can set what you want to use for copies.
//Consult Script and genie wish are enabled by default (if you have the skill)
//If you do not have the genie not make sure to enable pocket wish

//count to make sure you only fight one monster from the faxbot
int wishnumber = 0;

//use consult script for copying monsters
boolean consultccs = true;

//buy pocket wish or use geniewishes
boolean buypocketwish = false;
boolean usepocketwish = false;

//use spookyPutty or raindoh to fight copies 
boolean spkyputty = false;
boolean raindohbox = false;

//Use Cameras to fight
boolean camera4d = false;
boolean crapcamera = false;

//Alpine Painting, +1Printing, IceSculpting

boolean painting = false;
boolean printing = false;
boolean sculpting = false;

//Needed adventures to use all types of copying. Highly suggested 13 for all
int advcopyday = 13;

void main() {

//Makes sure you have enough adventures to use all copies
if(my_adventures() <= advcopyday) {
	abort("Don't have at least " + advcopyday +"	adventures to fight ALL copying methods!");
}

//makes sure you can fight
if(get_property("_genieFightsUsed") > 2){
	abort("Can't use anymore wishes to fight!");
}

//Choose not to fight because won't buy wishes
if( item_amount( $item[pocket wish] ) < 1 && buypocketwish == false && get_property("_genieWishesUsed") > 2 ){
 abort("You chose not to fight because you won't buy wishes");
}

//Choose not to fight because won't use pocket wishes
if( usepocketwish == false && get_property("_genieWishesUsed") > 2 ){
 abort("You chose not to fight because you won't use pocket wishes");
}

//purchase pocket wishes
if( item_amount( $item[pocket wish] ) < 1 && buypocketwish == true ){
cli_execute("buy pocket wish");
}

//find missing factoids
cli_execute("checkmanuel");

//sets combat
if( consultccs == true ){
set_property("battleAction", "custom combat script");
set_property("customCombatScript", "WishCopy");
}

//Puts items in your closet
while( item_amount($item[Spooky Putty sheet]) > 0 && spkyputty == false){
  put_closet(1, $item[Spooky Putty sheet]);
  print("Put Spooky Putty sheet into your closet!","blue");
}
while( item_amount($item[Rain-Doh black box]) > 0 && raindohbox == false){
  put_closet(1, $item[Rain-Doh black box]);
  print("Put Rain-Doh black box into your closet!","blue");
}
while( item_amount($item[print screen button]) > 0 && printing == false){
  put_closet(1, $item[print screen button]);
  print("Put print screen button(s) into your closet!","blue");
}
while( item_amount($item[4-d camera]) > 0 && camera4d == false){
  put_closet(1, $item[4-d camera]);
  print("Put 4-d camera(s) into your closet!","blue");
}
while( item_amount($item[crappy camera]) > 0 && crapcamera == false){
  put_closet(1, $item[crappy camera]);
  print("Put crappy camera(s) into your closet!","blue");
}
while( item_amount($item[unfinished ice sculpture]) > 0 && sculpting == false){
  put_closet(1, $item[unfinished ice sculpture]);
  print("Put unfinished ice sculpture(s) into your closet!","blue");
}
while( item_amount($item[alpine watercolor set]) > 0 && painting == false){
  put_closet(1, $item[alpine watercolor set]);
  print("Put alpine watercolor set(s) into your closet!","blue");
}

//Only allows for one print screen button
while( item_amount($item[print screen button]) > 1 ){
  put_closet(1, $item[print screen button]);
  print("Put print screen button(s) into your closet!","blue");
}

//throws chat up so that checking the fax will work properly
cli_execute("chat");

//Wishing to fight a monster
boolean copyformm() {

    foreach monstermanuel in $monsters[] {
        if (can_faxbot(monstermanuel) && monster_factoids_available(monstermanuel,true) < 3 && wishnumber.to_int() < 1) {
			print("Monster to Fight: "+monstermanuel,"red");
			if(wishnumber < 1){
			wishnumber = wishnumber + 1;
			}
            cli_execute("genie monster "+monstermanuel);
			visit_url("main.php");
			run_combat();
        }
    }
    return true;
}

//Genie Wish Combat
copyformm();
cli_execute("checkmanuel");

//confirms the factoids of the last monster fought to make sure you are not wasting copies on that monster
string monsterwish = last_monster();
print(monsterwish);

foreach monstermanuel in $monsters[] {
        if(monsterwish == monstermanuel){

while(get_property("spookyPuttyMonster") != "" && spkyputty == true && monster_factoids_available(monstermanuel,true) < 3){
cli_execute("use spooky putty monster");
cli_execute("checkmanuel");
}

while(get_property("rainDohMonster") != "" && raindohbox == true && monster_factoids_available(monstermanuel,true) < 3){
cli_execute("use Rain-Doh box full of monster");
cli_execute("checkmanuel");
}

while(get_property("cameraMonster") != "" && camera4d == true && monster_factoids_available(monstermanuel,true) < 3){
cli_execute("use shaking 4-d camera");
cli_execute("checkmanuel");
}

while(get_property("crappyCameraMonster") != "" && crapcamera == true && monster_factoids_available(monstermanuel,true) < 3){
cli_execute("use shaking crappy camera");
cli_execute("checkmanuel");
}

while(get_property("screencappedMonster") != "" && printing == true && monster_factoids_available(monstermanuel,true) < 3){
cli_execute("use screencapped monster");
cli_execute("checkmanuel");
}

while(get_property("iceSculptureMonster") != "" && sculpting == true && monster_factoids_available(monstermanuel,true) < 3){
cli_execute("use ice sculpture");
cli_execute("checkmanuel");
}

//This will run even if you have another monster in there (not the copied one)
while(get_property("chateauMonster") != "" && painting == true && get_property("_chateauMonsterFought") != true && monster_factoids_available(monstermanuel,true) < 3){
buffer page = visit_url("place.php?whichplace=chateau&action=chateau_painting");
page = run_combat();
cli_execute("checkmanuel");
}
		}
	}


set_property("customCombatScript", "Default");

//uses your last copy if you have one
if(get_property("spookyPuttyMonster") != "" && spkyputty == true){
cli_execute("use spooky putty monster");
}

if(get_property("rainDohMonster") != "" && raindohbox == true){
cli_execute("use Rain-Doh box full of monster");
}

if(get_property("cameraMonster") != "" && camera4d == true){
cli_execute("use shaking 4-d camera");
}

if(get_property("crappyCameraMonster") != "" && crapcamera == true){
cli_execute("use shaking crappy camera");
}

if(get_property("screencappedMonster") != "" && printing == true){
cli_execute("use screencapped monster");
}

if(get_property("iceSculptureMonster") != "" && sculpting == true){
cli_execute("use ice sculpture");
}

//This will run even if you have another monster in there (not the copied one)
if(get_property("chateauMonster") != "" && painting == true && get_property("_chateauMonsterFought") != true){
buffer page = visit_url("place.php?whichplace=chateau&action=chateau_painting");
page = run_combat();
}


//Pulls items in your cloest out
foreach copyitems in $items[
		Spooky Putty sheet,
		Rain-Doh black box,
		print screen button,
		4-d camera,
		crappy camera,
		unfinished ice sculpture,
		alpine watercolor set
]
{
while( closet_amount( copyitems ) > 0){
  take_closet(1, copyitems);
  print("Here is "+copyitems+" from your closet!","green");
} //foreach item end
}

string monsterwishlast = get_property("lastEncounter");
print("You got factoids for: "+monsterwishlast+"! Congratulations!","green");

}
