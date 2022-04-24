<!DOCTYPE html>
<html>
<style>

.center {
   padding: 70px 0;
   text-align: center;
}
body {
    background-image: url('dex.png');
}

body {
    background-color: LightCoral;
}
form {
   text-align: center;
}


h1 {
    text-align: center;
}

a  {
    display: block;
    text-align: center;
}

.aligncenter{
    text-align: center;
}

</style>
   

    <head>
        <title>Pokemon Database Website</title>
        <br>
        <br>
        <h1 style="color:white">Pokedex</h1>
</head>
<body>

<br>
<br>
<br>
<br>
<br>
<br>
<p class="aligncenter">
<img  src="bulb.png" width="200" height="200"> 
<img  src="char.png" width="200" height="200">
<img  src="blas.png" width="200" height="200"> 
</p>

<style>
form {
    text-align: center;
}
</style>

<!-- The div lines were just used for centering
The forms were used to get user input
The name corresponds to the _GET commands below to get user input and add it to the queries
-->
<div class="center"> 
<form action="site.php" method="GET">
    <label for="pokemon_name"> Enter Pokemon Name:</label>
    <input type="text" name="pokemon_name">
    <input type="submit" value="Submit">
 </form>
    <br>
    <br>
<form action="site.php" method="GET">
    <label for="pokedex_number"> Enter Pokedex Number:</label>
    <input type="number" name="pokedex_number">
    <input type="submit" value="Submit">
</form>
    <br>
    <br>
<form action="site.php" method="GET">
    <label for="pokemon_generation"> Enter Pokemon Generation:</label>
    <input type="number" name="pokemon_generation">
    <input type="submit" value="Submit">
</form>
    <br>
    <br>
<form action="site.php" method="GET">
    <label for="pokemon_type"> Enter Pokemon Type:</label>
    <input type="text" name="pokemon_type">
    <input type="submit" value="Submit">
</form>

<br>
<br>

<form action="site.php" method="GET">
    <label for="region"> Enter Region:</label>
    <input type="text" name="region">
    <input type="submit" value="Submit">
</form>
</div>

<div class="center">

<!-- The database code starts at line 106 with the php-->

<?php 


// this line connects to the local postgres DB, just add your credentials
$db = pg_connect("host=localhost port=5432 dbname=Pokemon user=postgres password=pokemon");


// this is just an if statement to check if the DB connection is successful
if(!$db) {
   echo "Error: Unable to open database\n";
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
if($_GET[region] != "" && $checkregion || $_GET[pokemon_generation] == ""){
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
			echo "xD";
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

<a href="http://pokemon.com" style=text-align: center;> The Pokemon Website <br></a>


</body>
</html>
