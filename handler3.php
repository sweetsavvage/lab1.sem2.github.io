<?php

    $Author = $_POST['BooksByAuthor'];
    include 'dbConnection.php';
    include 'index.php';
    //var_dump($Author);
   // print_r($Author);
    //print_r($pdo);
    
    $stmt = $pdo->query("Select * from literature as a, authors as b, book_authors as c where a.ID_Book=c.FID_Book and c.FID_Authors=b.ID_Authors and b.name=\"$Author\"");
    //print_r($stmt);
    $result = $stmt->fetchAll(PDO::FETCH_OBJ);
    //print_r($result);
    //var_dump(count($result[0]));
    
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
    
    $pdo=null;

?>