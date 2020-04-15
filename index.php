<!DOCTYPE html>
<html>
    <head>
        <meta charset = "utf-8">
        <title>Laba1</title>
        <style>
        
            /* .Tasks {
                display: flex;
                flex-direction: row;
                justify-content: space-between;
            } */
            input, select {
                display: block;
                margin-bottom: 15px;
            }
            div {
               border: 1px solid black;
               padding: 5px;
               /* width: 400px;
               margin: 0 auto; */
            }
           p{
               font-size:18px;
           }
        
        </style>
        <!--<link rel = "stylesheet" href = "stylesheet.css">-->
    </head>

    <body>

        <?php
            include 'dbConnection.php'
        ?>
        <div class="Tasks">
        <div class="Task1">
        <form action="handler1.php" method="post">
            <p>Найти книги по издательству</p>
            <?php
            //$stmt = $pdo->query("Select distinct publisher from literature where publisher is not null");
            // $result = $stmt->fetch(PDO::FETCH_COLUMN);
            //$result = $stmt->fetchAll();
            // print_r($result);
            ?>
            <select name="BooksByPublisher">
                <?php
                    $stmt = $pdo->query("Select distinct publisher from literature where publisher is not null");
                    $result = $stmt->fetchAll();
                   // print_r($stmt);
                    foreach ($result as $key => $value) {
                        echo "<option label=\"$publisher\" value=\"$value[0]\">$value[0]</option>";
                    }
                ?>
            </select>
            <input type="submit" value="Показать" >
        </form>
            <!--<button>Отобразить</button>-->
        </div>
        

        <div class="Task2">
        <form action="handler2.php" method="post">
            <p>Найти литературу по дате издания</p>
            <p>От</p>
            <input type="date" name="first_date">
            <p>До</p>
            <input type="date" name="second_date">
            
            <input type="submit" value="Показать">
        </form>
        </div>

        <div class="Task3">
        <form action="handler3.php" method="post">
            <p>Найти книги по автору</p>
            <select name="BooksByAuthor">
                <?php
                    $stmt = $pdo->query("Select name from authors");
                    $result = $stmt->fetchAll();
                   // print_r($stmt);
                    foreach ($result as $key => $value) {
                        echo "<option label=\"$author\" value = \"$value[0]\">$value[0]</option>";
                    }
                ?>
            </select>
            <input type="submit" value="Показать">
        </form>
        </div>
        </div>


    </body>
</html>