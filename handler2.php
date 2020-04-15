<?php

    $first = $_POST['first_date'];
    $second = $_POST['second_date'];
    include 'dbConnection.php';
    include 'index.php';
   // print_r($first);
    //print_r($second);
    //print_r($pdo);
    
    $stmt = $pdo->query("Select * from literature where (publish_year > \"$first\" and publish_year < \"$second\") or (publish_date > \"$first\" and publish_date < \"$second\")");
    //print_r($stmt);
    $result = $stmt->fetchAll(PDO::FETCH_OBJ);
    //print_r($result);
    //var_dump(count($result[0]));
    if ($first != null && $second != null) {
    echo "<table border=\"1\">";
    echo "<tr>";
    foreach ($result[0] as $key => $value) {
        echo "<th>$key</th>";
    }
    echo "</tr>";
    foreach ($result as $row) {
        echo "<tr>";
        foreach ($row as $key => $value) {
            echo "<td>$value</td>";
        }
        echo "</th>";
    }
    echo "</table>";
    }

    $pdo=null;
?>