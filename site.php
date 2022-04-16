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
} else {
    echo "Opened database succesfully <br>";
}

// these next lines run queries for pokemon name, pokedex number, type, generation, and region
// the queries use joins within them and store the output in the corresponding php variables
// I used the forms above with the $_GET command to add the user input to the query
// the input corresponds to the name in the form above
// I kept the queries simple so that the user could only search for pokemon by name or pokedex number
// User can also search by generation, region and type

$name = pg_query($db, "SELECT name, pokemon.pokedexnum, regionname, region.generation, normcolor, shinycolor FROM Pokemon join fromregion on Pokemon.pokedexnum = fromregion.pokedexnum join region on fromregion.generation = region.generation WHERE Pokemon.name = '$_GET[pokemon_name]'");
echo "<br>";

$type = pg_query($db, "select name, typename from pokemon join of on pokemon.pokedexnum = of.pokedexnum where typename = '$_GET[pokemon_type]'
");

$gen = pg_query($db, "SELECT name, pokemon.pokedexnum, regionname, region.generation, normcolor, shinycolor FROM Pokemon join fromregion on Pokemon.pokedexnum = fromregion.pokedexnum join region on fromregion.generation = region.generation WHERE fromregion.generation = '$_GET[pokemon_generation]'");
echo "<br>";

$pokenum = pg_query($db, "SELECT name, pokemon.pokedexnum, regionname, region.generation, normcolor, shinycolor FROM Pokemon join fromregion on Pokemon.pokedexnum = fromregion.pokedexnum join region on fromregion.generation = region.generation WHERE Pokemon.Pokedexnum = '$_GET[pokedex_number]'");

$region = pg_query($db, "SELECT name, pokemon.pokedexnum, regionname, region.generation, normcolor, shinycolor FROM Pokemon join fromregion on Pokemon.pokedexnum = fromregion.pokedexnum join region on fromregion.generation = region.generation WHERE region.regionname = '$_GET[region]'");

// Below I just used multiple if statements to check which variable had the user input
// Only one form can be used at a time to make the website simple
// within each if statement there is a while loop and $row stores the results of the query
// After that echo is used to print each row
// Each row works like an array, so you just use the indexes to print the data from each column 

if($name) {
    while($row = pg_fetch_row($name)) {

        echo "Pokemon Name: $row[0]  Pokedex Number: $row[1]  Region: $row[2]  Generation: $row[3]  Normal Color: $row[4]  Shiny Color: $row[5] <br>";
        echo "<br />\n";
    } 
} 

if($type) {
    while($row = pg_fetch_row($type)) {

        echo "Pokemon Name: $row[0]  Type: $row[1] <br>";
        echo "<br />\n";
    } 
}


if($pokenum) {
    while($row = pg_fetch_row($pokenum)) {

        echo "Pokemon Name: $row[0]  Pokedex Number: $row[1]  Region: $row[2]  Generation: $row[3]  Normal Color: $row[4]  Shiny Color: $row[5] <br>";
        echo "<br />\n";
    } 
} 

if($gen) {
    while($row = pg_fetch_row($gen)) {

        echo "Pokemon Name: $row[0]  Pokedex Number: $row[1]  Region: $row[2]  Generation: $row[3]  Normal Color: $row[4]  Shiny Color: $row[5] <br>";
        echo "<br />\n";
    } 
} 

if($region) {
    while($row = pg_fetch_row($region)) {

        echo "Pokemon Name: $row[0]  Pokedex Number: $row[1]  Region: $row[2]  Generation: $row[3]  Normal Color: $row[4]  Shiny Color: $row[5] <br>";
        echo "<br />\n";
    } 
} 

?>

</div>

<a href="http://pokemon.com" style=text-align: center;> The Pokemon Website <br></a>


</body>
</html>
