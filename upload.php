<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombreMascota = $_POST['nombreMascota'];
    $imagenMascota = $_FILES['imagenMascota'];

    $directorioDestino = 'img/';
    $rutaArchivo = $directorioDestino . basename($imagenMascota['name']);

    if (move_uploaded_file($imagenMascota['tmp_name'], $rutaArchivo)) {
        $jsonFile = 'mascotas.json';
        $mascotas = file_exists($jsonFile) ? json_decode(file_get_contents($jsonFile), true) : [];

        $mascotas[] = [
            'nombre' => $nombreMascota,
            'imagen' => $rutaArchivo
        ];

        file_put_contents($jsonFile, json_encode($mascotas, JSON_PRETTY_PRINT));

        // Redirigir a subir.html con el parámetro de éxito
        header('Location: subir.html?success=true');
        exit();
    } else {
        echo "Error al subir la imagen.";
    }
}
?>
