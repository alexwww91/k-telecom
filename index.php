<?php
require_once "config.php";

$sql = "SELECT * FROM object_typ";
$res = mysqli_query($connect, $sql);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <div>
        <form method="get" action="/server.php" enctype="multipart/form-data">
            <textarea placeholder="Введите серийный номер" name="serial" cols="30" rows="3"></textarea>
            <select name="id">
                <?php
                while ($data = mysqli_fetch_assoc($res)) : ?>
                    <option value="<?= $data['id'] ?>" id="<?= $data['id'] ?>"><?= $data['name'] ?></option>
                <?php
                endwhile;
                ?>
            </select>
            <input type="submit" name="submit" value="Добавить">
        </form>
        <?php
        if ($_GET['errore']) :
        ?>
            <h3 style="text-align:center;color:red;"><?= $_GET['errore'] ?></h3>
        <?php
        endif;
        ?>
    </div>
</body>

</html>