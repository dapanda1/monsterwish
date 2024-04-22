# monsterwish
I made a rough script for finding missing factoids with a Genie Wish. It will fight one monster and use any copying abilities you have to get the rest of the factoids. It can run a bit slow as it has to check the manuel after every combat to make sure it doesn't have 3 factoids yet.<br>
<br>
Things that can be done:<br>
-You can set variables to 'true' inside "manuelwish.ash" to pick which coping item to use after a fight. If you have the value set to 'false' for the item it will closet that item and pull it out after combat.<br>
-Consulting CCS script "fullmonstercopy.ash" has digitize set to FALSE so if you are just going for factoids and want to use other copies, it won't add that copy of the monster to your combat queue.<br>
-The Consult Script for the CCS "fullmonstercopy.ash" will use any copying abilities you have, so if you are wanting to limit the use you can set the True or False flag in "manuelwish.ash". This will place items in your closet until after all copying is done.<br>
-Combat script now checks class and uses the skill from your class that is the uncapped attack, except for the skill "Saucegeyser" which will always run as the last option<br>
---If you don't have the skill for your class or "Saucegeyser" it will just attack with your weapon<br>
-Checks to make sure you do not have three factoids before using a copy. As you gain the copy before you gain the factoid in that last fight, the script then uses that last copy with your default combat CCS at the end of the script.<br>
-Makes sure you have enough adventures for copying, the default is 13. This should cover one of every copy and all the putty/doh copies.<br>
<br>
Current Issues:<br>
-The biggest issue is that it only wishes for things from the fax network. So if you can't wish for it but it is in the fax network, it will NOT error, it just won't wish. To get around this you have to get the monster from the Fax network, the script will not skip it. I have a feature request open that would help with this: http://kolmafia.us/showthread.php?22160-Genie-wish-to-notify-on-failure<br>
-May not check to see if you don't have any monsters to fight for factoids (e.g. your monster manuel is full). If you can't find a monster in the fax network to fight, it shouldn't try to summon something. I don't have a full manuel so I can't test it.<br>
------DO NOT ADVENTURE WITH THE PANTS: "papier-m?churidars" OR ANYTHING ELSE THAT "IMPROVES THINGS"------<br><br>

Updates for the Future:<br>
-Pull a complete list of wishable monsters, not just from the fax network. *See above<br>
-Have combat for monsters that are immune to spells or basic attacks (or need combat items)<br>
-Will check total adventures left vs copying amounts and use the correct amount of copies.<br>
<br>
<br>
THIS IS A WORK IN PROGRESS USE AT YOUR OWN RISK. IF EASYFAX IS DOWN, IT MOST LIKELY WON'T WORK<br>
<br>
Should be fixed:<br>
-Fixed an issue where it would automatically buy pocketwishes<br>
-If this is the first time you have used that copying mechanism this run it will not automatically fight the copy. (the preferences file is empty so it doesn't have a value to use) (at least if it is spooky putty)
