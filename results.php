<!DOCTYPE html>
<?php require_once "config.php" ?>
<html lang="en-GB">
<head>
    <meta charset="utf-8">
    <title>Form</title>
    <link rel="stylesheet" href="form.css">
</head>

<?php
if(isset($_POST["submit"])) {

    $country = mb_strtolower(trim($_POST['name_country']));

    $stmt_country = $pdo->prepare("SELECT * FROM countries WHERE name=:name");
    $stmt_country->execute([
            'name' => $country
    ]);
    $user = $stmt_country->fetchall();

    if ($user) {
        $id_country = $user[0]["id_countries"];

    } else {
        $stmt_country = $pdo->prepare("INSERT INTO countries (name) VALUES(:name)");
        $stmt_country->execute([
            'name' => $country
        ]);

        $id_country = $pdo->lastinsertid();
    }



    $stmt = $pdo->prepare("INSERT INTO users (first_name, last_name, birthdate, mail, phone, civility, sex) VALUES(:first_name, :last_name, :birthdate, :mail, :phone, :civility, :sex)");
    $stmt->execute([
        'first_name' => $_POST['first_name'],
        'last_name' => $_POST['last_name'],
        'birthdate' => $_POST['birthdate'],
        'mail' => $_POST['mail'],
        'phone' => $_POST['phone'],
        'civility' => $_POST['civility'],
        'sex' => $_POST['sex']
    ]);

    $stmt_addresses = $pdo->prepare("INSERT INTO addresses (street, postal_code, city, countries_id_countries) VALUES (:street, :postal_code, :city, :countries_id_countries)");
    $stmt_addresses->execute([
        'street' => $_POST['street'],
        'postal_code' => $_POST['postal_code'],
        'city' => $_POST['city'],
        'countries_id_countries' => $id_country
    ]);
}


?>

<body>

<h1>You : </h1>
<?php
$form_data = [
    'First Name' => htmlentities($_POST["first_name"]),
    'Last Name' => htmlentities($_POST["last_name"]),
    'Birth Date' => htmlentities($_POST["birthdate"]),
    'Address' => htmlentities($_POST["street"]) . ' ' . htmlentities((int)$_POST["postal_code"]) . ' ' . htmlentities($_POST["city"]) . ", " . htmlentities($country),
    'Phone number' => htmlentities((int)$_POST["phone"]),
    'Email address' => htmlentities($_POST["mail"]),
    'Civility' => htmlentities($_POST["civility"]),
    'Sex' => htmlentities($_POST["sex"])
];
?>

<p class="form-data">
    <?php foreach($form_data as $data => $value): ?>
        <?= "$data : $value" ?><br>
    <?php endforeach ?>
</p>
<h2>Users :</h2><br>
<?php
$query = $pdo->prepare("
SELECT * FROM users
INNER JOIN users_has_addresses uha on users.id_user = uha.users_id_user
INNER JOIN addresses a on uha.addresses_id_addresses = a.id_addresses
INNER JOIN countries c on a.countries_id_countries = c.id_countries
");

$query->execute([]);

$user_all_data = $query->fetchAll();
?>
<?php foreach ($user_all_data as $row): ?>
<p class="form-data">
    <?= 'First name : ' . $row['first_name'] ?><br>
    <?= 'Last name : ' . $row['last_name'] ?><br>
    <?= 'Birth date :' . $row['birthdate'] ?><br>
    <?= 'Address : ' . $row['street'] . ' ' . $row['postal_code'] . ' ' . $row['city']  . ', ' . $row['name'] ?><br>
    <?= 'Phone number : ' . $row['phone'] ?><br>
    <?= 'Email address : ' . $row['mail'] ?><br>
    <?= 'Civility : ' . $row['civility'] ?><br>
    <?= 'Sex : ' . $row['sex'] ?><br>
</p>
<?php endforeach ?>

<a href="index.php"><--Go back to the form</a>

</body>
</html>