<?php
require_once "config.php";

$sql = "SELECT * FROM objects";
$res = mysqli_query($connect, $sql);
$arrSerials = [];
while ($data = mysqli_fetch_assoc($res)) {
    array_push($arrSerials, $data['serial']);
}

$mask = [
    '1' => '/\b[A-Z0-9]{2}[A-Z]{5}[A-Z0-9][A-Z]{2}\b/',
    '2' => '/\b[0-9][A-Z0-9]{2}[A-Z]{2}[A-Z0-9](-|_|@)[A-Z0-9][a-z]{2}\b/',
    '3' => '/\b[0-9][A-Z0-9]{2}[A-Z]{2}[A-Z0-9](-|_|@)[A-Z0-9]{3}\b/',
];

/*$pattern_name = '/\b[0-9][A-Z0-9]{2}[A-Z]{2}[A-Z0-9](-|_|@)[A-Z0-9]{3}\b/';
$name = '1A2ZS2-2HG';
preg_match($pattern_name, $name, $matches);
print_r(preg_match($pattern_name, $name, $matches));*/

if ($_GET['submit']) {
    $serial = trim(strip_tags($_GET['serial']));
    $id = trim(strip_tags($_GET['id']));
    $sql = "SELECT * FROM object_typ WHERE `id`=$id";
    $res = mysqli_query($connect, $sql);
    $data = mysqli_fetch_assoc($res);
    var_dump($data["name"]);

    if (in_array($serial, $arrSerials)) {
        header("Location: index.php?errore=Оборудование с таким серийным номером уже добавлено");
    } elseif (!preg_match($mask[$id], $serial, $matches)) {
        header("Location: index.php?errore=Формат серийного номера не соответствует оборудованию");
    } else {
        $s = "INSERT INTO objects (type_id, serial) VALUES ($id, \"$serial\")";
        $r = mysqli_query($connect, $s);
        var_dump($s);
        header("Location: index.php?errore=Оборудование успешно добавлено");
    }
}
