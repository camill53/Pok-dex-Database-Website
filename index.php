<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>CSE 412 Group 11 Pokédex</title>
</head>
<body>
    <div class="container">
        <div class="welcomeText">
            <p>Welcome to group's 11</p>
        </div>
        <div class="PokédexOutline">
            <div class="Pokédex">
                <div class="screenOutlines">
                    <div class="promptScreen">
                    <form action="index.php" method="GET">
			<label for="pokemon_name" class="label"> Pokemon Name:</label>
			<input type="text" class="textInput" name="pokemon_name">

			<label for="pokedex_number"> Pokedex Number:</label>
			<input type="number" class="textInput" name="pokedex_number">

			<label for="pokemon_generation"> Pokemon Generation:</label>
			<input type="number" class="textInput" name="pokemon_generation">

			<label for="pokemon_type"> Pokemon Type:</label>
			<input type="text" class="textInput" name="pokemon_type">

			<label for="region"> Region Origin :</label>
			<input type="text" class="textInput" name="region">
			    
		    	<label for="pokemon_ability">Pokemon Ability:</label>
			<input type="text" class="textInput" name="pokemon_ability">
	
			<input type="submit" class="submit" style="margin-left: 40%" value="Submit">	
			</form>
                    </div> 
                    <div class="dispayScreen">

                    <?php
                             // this line connects to the local postgres DB, just add your credentials -->
                            $db = pg_connect("host=localhost port=5432 dbname=Pokemon user=postgres password=password");


                             // this is just an if statement to check if the DB connection is successful -->
                            if(!$db) {
                            echo "Unable to connect to Pokedex. Please contact Professor Oak.\n";
                            } 

                            $checkothers = true;
							$checkothersTwo = true;
							$checkregion = false;
							$typeExists = false;
							$FromSubString = "";
							$WhereSubString = "";
							
							// If pokemon name is entered, then ignore all other inputs
							if($_GET[pokemon_name] != ""){
								$req =  pg_query($db, "SELECT name, pokemon.pokedexnum, regionname, region.generation, normcolor, shinycolor FROM Pokemon NATURAL JOIN fromregion NATURAL JOIN region WHERE Pokemon.name = '$_GET[pokemon_name]'");
								echo "<br>";
								$checkothers = false;
								$checkothersTwo = false;
								if(!$req && $_GET[pokedex_number] != "")
									$checkothersTwo = true;
								else if(!$req && $_GET[pokedex_number] == "")
									$checkothers = true;	
							}

							if($_GET[pokedex_number] == "")
								$checkothersTwo = false;

							if($_GET[pokedex_number] != "" && checkothersTwo){
								$req = pg_query($db, "SELECT name, pokemon.pokedexnum, regionname, region.generation, normcolor, shinycolor FROM Pokemon NATURAL JOIN fromregion NATURAL JOIN region WHERE Pokemon.Pokedexnum = $_GET[pokedex_number]");
								$checkothers = false;
								//echo "SELECT name, pokemon.pokedexnum, regionname, region.generation, normcolor, shinycolor FROM Pokemon NATURAL JOIN fromregion NATURAL JOIN region WHERE Pokemon.Pokedexnum = $_GET[pokedex_number]";
								if(!$req)
									$checkothers = true;
								
							}

							if($_GET[pokemon_type] != ""){
								$FromSubString .= " NATURAL JOIN of";
								$WhereSubString .= "typename = '$_GET[pokemon_type]'";
								$typeExists = true;
							}
							if($_GET[pokemon_generation] != ""){
								$checkregion = true;
								if($_GET[pokemon_generation] <= 8 && $_GET[pokemon_generation] > 0){
									if($typeExists)
										$WhereSubString .= " AND ";
									$WhereSubString .= "fromregion.generation = '$_GET[pokemon_generation]'";
									$checkregion = false;
									$typeExists = true;
								}
							}
							if($_GET[pokemon_ability] != ""){
								$FromSubString .= " NATURAL JOIN has";
								if($typeExists)
									$WhereSubString .= " AND ";
								$WhereSubString .= "has.abilityname = '$_GET[pokemon_ability]'";
								$typeExists = true;
								
							}
							if($_GET[region] != "" && ($checkregion || $_GET[pokemon_generation] == "")){
								if($typeExists)
									$WhereSubString .= " AND ";
								$WhereSubString .= "region.regionname = '$_GET[region]'";
							}
							
							if($checkothers){
								$req = pg_query($db, "SELECT name, pokemon.pokedexnum, regionname FROM pokemon NATURAL JOIN fromregion NATURAL JOIN region $FromSubString WHERE $WhereSubString");
								// echo "SELECT name, pokemon.pokedexnum, regionname FROM pokemon NATURAL JOIN fromregion NATURAL JOIN region$FromSubString WHERE $WhereSubString";
							}						
							if($req){
								if(!$checkothers || $checkothersTwo){
									while($row = pg_fetch_row($req)) {
										echo "Pokemon Name: $row[0]<br>  Pokedex Number: $row[1]<br>  Region: $row[2]<br> Generation: $row[3]<br>  Normal Color: $row[4]<br>  Shiny Color: $row[5] <br>";
										echo "<br />\n";
									} 
								}
								else{
									while($row = pg_fetch_row($req)) {
										echo "Pokemon Name: $row[0]\n  Pokedex Number: $row[1]\n  Region: $row[2]  <br>";
										echo "<br />\n";
									} 
								}
							}
							else{
								echo "No Pokemon Found";
							}
							if($_GET[pokemon_generation] == 3 || $_GET[region] == "Hoenn")
								echo "Pokemon from the Hoenn region went extinct due to rising sea levels";
                        ?>
                            
                    </div>
                </div>
                <div class="PokédexDecalOutline">
                    <div class="PokédexDecal">
                        <div class="innerDecalBallBlack">
                            <div class="innerDecallBallWhite"></div>
                        </div>
                        <div class="innerDecalStrip"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="welcomeTextCont">
            <p>The NotPokédex MK III</p>
        </div>
    </div>
</body>
</html>
