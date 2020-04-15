<?php
    error_reporting(0);
    $Publisher = $_POST['BooksByPublisher'];
    include 'dbConnection.php';
    include 'index.php';
    //print_r($pdo);
    $stmt = $pdo->query("Select a.ID_Book, a.name, b.name as author_name, a.isbn, a.publisher, a.publish_year, a.quantity from literature as a, authors as b, book_authors as c where a.publisher=\"$Publisher\" and a.literate='Book' and a.ID_Book = c.FID_Book and c.FID_Authors = b.ID_Authors");
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