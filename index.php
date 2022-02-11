<!DOCTYPE html>
<html lang="en-GB">
<?php require_once 'config.php' ?>


<head>
    <meta charset="utf-8">
    <title>Form</title>
    <link rel="stylesheet" href="form.css">
</head>

<body class="font-verdana">

        <h1 class="letter-50px" id="firstTitle">Form</h1>

        <form action="/results.php" method="post" class="form">
            <label for="last_name"></label>
            <input type="text" name="last_name" placeholder="Last Name" id="last_name" value="">
            <label for="first_name"></label>
            <input type="text" name="first_name" placeholder="First Name" id="first_name" value="">
            <label for="birthdate"></label>
            <input type="date" name="birthdate" id="birthdate" value="">
            <label for="street"></label>
            <input type="text" name="street" placeholder="Street and Street number" id="street" value="">
            <label for="postal_code"></label>
            <input type="number" name="postal_code" placeholder="NPA" id="postal_code" value="">
            <label for="city"></label>
            <input type="text" name="city" placeholder="City" id="city" value="">
            <label for="name_country"></label>
            <input type="text" name="name_country" placeholder="Country" id="name_country" value="">
            <label for="phone"></label>
            <input type="tel" name="phone" placeholder="Phone Number" id="phone" value="">
            <label for="mail"></label>
            <input type="email" name="mail" placeholder="Email Address" id="mail" value="">
            <label for="civility"></label>
            <select name="civility" id="civility">
                <option value="0"></option>
                <option value="1">Ms</option>
                <option value="2">Mr</option>
            </select>
            <label for="sex"></label>
            <select name="sex" id="sex">
                <option value="0">🧑</option>
                <option value="1">👩</option>
                <option value="2">👨</option>
            </select>
            <input type="submit" name="submit" id="submit">
        </form>


</body>
</html>