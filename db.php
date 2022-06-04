<?php

$dsn = "mysql:host=localhost;dbname=lab_1";
$user = "root";
$pass = "";
//$db = new PDO("mysql:host=localhost;dbname=computer", "root", "");
try {
    $dbh = new PDO($dsn, $user, $pass);

} catch (PDOException $eh) {
    echo $ex->GetMessage();
}

function findByLeague($league)
{
    global $dbh;
    try {
        $statement = $dbh->prepare("SELECT first.name as A, GAME.score, second.name as B
            FROM (GAME inner join TEAM AS first on GAME.FID_Team1 = first.ID_TEAM) 
            inner join TEAM AS second on GAME.FID_Team2 = second.ID_TEAM 
            WHERE first.league AND second.league = ?");
        $statement->execute([$league]);
        echo "<table>";
        echo " <tr>
        <th> Team1  </th>
        <th> Score </th>
        <th> Team2 </th>
        </tr> ";
        while ($data = $statement->fetch()) {
            echo " <tr>
            <th> {$data['A']} </th>
            <th> {$data['score']} </th>
            <th> {$data['B']} </th>
            </tr> ";
        }
    echo "</table>";
        
    } catch (PDOException $eh) {
        echo $ex->GetMessage();
    }
}



function findByDate($first_date, $second_date)
{
    global $dbh;
    try {
        $statement = $dbh->prepare("SELECT GAME.date, GAME.place, GAME.score, first.name as A, second.name as B
            FROM (GAME inner join TEAM AS first on GAME.FID_Team1 = first.ID_TEAM) 
            inner join TEAM AS second on GAME.FID_Team2 = second.ID_TEAM 
            WHERE GAME.date BETWEEN :first AND :second");
        $statement->execute(array('first' => $first_date, 'second' => $second_date));
        echo "<table>";
        echo " <tr>
        <th> Date  </th>
        <th> Place </th>
        <th> Score </th>
        <th> Team1 </th>
        <th> Team2 </th>
        </tr> ";
        while ($data = $statement->fetch()) {
            echo " <tr>
            <th> {$data['date']}  </th>
            <th> {$data['place']} </th>
            <th> {$data['score']} </th>
            <th> {$data['A']} </th>
            <th> {$data['B']} </th>
            </tr> ";
        }
    echo "</table>";
        
    } catch (PDOException $eh) {
        echo $ex->GetMessage();
    }
}


function findByName($name)
{
    global $dbh;
    // $name = 'Richard';
    try {
        $statement = $dbh->prepare("SELECT GAME.date, GAME.place, GAME.score, first.name as A, second.name as B
        FROM (GAME inner join TEAM AS first on GAME.FID_Team1 = first.ID_TEAM) 
        inner join TEAM AS second on GAME.FID_Team2 = second.ID_TEAM 
        WHERE GAME.ID_Game IN 
            (SELECT GAME.ID_Game FROM GAME WHERE 
            (SELECT FID_TEAM FROM PLAYER WHERE ID_Player = ?) IN (FID_TEAM1, FID_TEAM2))");
        $statement->execute([$name]);
        echo "<table>";
        echo " <tr>
        <th> Date  </th>
        <th> Place </th>
        <th> Score </th>
        <th> Team1 </th>
        <th> Team2 </th>
        </tr> ";
        while ($data = $statement->fetch()) {
            echo " <tr>
            <th> {$data['date']}  </th>
            <th> {$data['place']} </th>
            <th> {$data['score']} </th>
            <th> {$data['A']} </th>
            <th> {$data['B']} </th>
            </tr> ";
        }
        echo "</table>";
        
    } catch (PDOException $eh) {
        echo $ex->GetMessage();
    }
}

