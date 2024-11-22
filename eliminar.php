<?php
if (isset($_GET['index']) && isset($_GET['imagen'])) {
    $index = intval($_GET['index']);
    $imagen = $_GET['imagen'];

    $jsonFile = 'mascotas.json';

    // Verificar si el archivo JSON existe
    if (!file_exists($jsonFile)) {
        echo 'error: el archivo JSON no existe';
        exit();
    }

    $mascotas = json_decode(file_get_contents($jsonFile), true);

    // Verificar si el índice existe en el JSON
    if (!isset($mascotas[$index])) {
        echo 'error: índice no válido';
        exit();
    }

    // Intentar eliminar la imagen
    if (file_exists($imagen)) {
        if (!unlink($imagen)) {
            echo 'error: no se pudo eliminar la imagen';
            exit();
        }
    } else {
        echo 'error: la imagen no existe';
    }

    // Eliminar la entrada del JSON
    array_splice($mascotas, $index, 1);

    // Guardar el archivo JSON actualizado
    if (!file_put_contents($jsonFile, json_encode($mascotas, JSON_PRETTY_PRINT))) {
        echo 'error: no se pudo guardar el archivo JSON';
        exit();
    }

    echo 'success';
    exit();
}

echo 'error: parámetros no válidos';
exit();
?>
