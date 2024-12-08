<html>
    <hr>
    <h2>Lista Ejecutores</h2>
    <hr>

    <body>

    <form method="POST" action="">
        <button type="submit" name="mostrar_ejecutores">Mostrar Ejecutores</button>
    </form>

    <?php
    include '../conexion.php';


    if (isset($_POST['mostrar_ejecutores'])) {
        $query = "SELECT rut, nombre, tipo , domicilio FROM ejecutor";
        $result = pg_query($coneccion, $query);

        if (pg_num_rows($result) > 0) {
            echo "<h2>Lista de Oficinas</h2>";
            echo "<table border='1'>
                    <tr>
                        <th>Rut</th>
                        <th>Nombre</th>
                        <th>Tipo</th>
                        <th>Domicilio</th>
                    </tr>";

            while ($row = pg_fetch_assoc($result)) {
                echo "<tr>
                        <td>{$row['rut']}</td>
                        <td>{$row['nombre']}</td>
                        <td>{$row['tipo']}</td>
                        <td>{$row['domicilio']}</td>
                    </tr>";
            }
            echo "</table>";
        } else {
            echo "<p>No se encontraron ejecutores.</p>";
        }

    }


    ?>
    </body>
</html>