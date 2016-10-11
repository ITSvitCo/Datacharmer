<?php 
try { 
    $host = 'localhost';
    $dbName = 'employees';
    $userName = 'test';
    $password  = '1';
    $charset = 'utf8mb4';
    $db = new PDO('mysql:host='.$host.';dbname='.$dbName.';charset='.$charset.'', $userName, $password);
    $query = 'SELECT first_name, last_name, birth_date, hire_date, gender 
                FROM employees 
                WHERE gender=\'M\' AND 
                    birth_date = \'1965-02-01\' AND  
                    hire_date > \'1990-01-01\' 
                ORDER BY first_name, last_name ASC';
    $employees = $db->query($query);
    while($row = $employees->fetch(PDO::FETCH_ASSOC)) {
        echo $row['first_name'] . ' ' . $row['last_name'] . ' ' . $row['birth_date'] . ' ' . $row['hire_date'] . ' ' . $row['gender'] . PHP_EOL; 
    }
} catch(PDOException $ex) {
    echo $ex->getMessage();
}
?>

