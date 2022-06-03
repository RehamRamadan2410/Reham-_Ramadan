<?php
session_start();


$phoneNumber = $_SESSION['phoneNumber'];
$review = $_SESSION['review'];


// Review

$question;
function survay($survay)
{
    if ($survay < 3) {
        $question = "Bad";
    } else if ($survay >= 3 && $survay < 5) {
        $question = "Good";
    } else if ($survay >= 5 && $survay < 10) {
        $question = "Very Good";
    } else {
        $question = "Excellent";
    }
    return $question;
}

// Total Review 

$add = 0;
for ($i = 1; $i <= 5; $i++) {
    $add += $review['question' . $i];
}

if ($add < 25) {
    $result = 'Bad';
    $message = "<p class='alert alert-danger text-center'>
            We're very sorry about that<br> We'll contact you soon on this Phone Number :  <strong>{$phoneNumber}</strong>
            </p>";
} else {
    $result = 'Good';
    $message = "<p class='alert alert-success text-center'>
    <strong>Thank you</strong>
            </p>";
}



?>




<!doctype html>
<html lang="en">

<head>
    <title>Hospital</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="../BS5-Template/css/all.min.css" type="text/css" rel="stylesheet">
    <link href="../BS5-Template/css/bootstrap.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>




<body>

    <div class="container py-4 ">
        <h1 class="text-center text-info my-5">Hospital Survay</h1>
        <form method="get">
            <table class="table  my-3 mt-5  text-primary">
                <thead>
                    <tr>
                        <th scope="col">QUESTIONS</th>
                        <th scope="col">REVIEWS</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>Are you satisfied with the level of cleanliness?</th>
                        <td><?= survay($review['question1']) ?></td>

                    </tr>
                    <tr>
                        <th>Are you satisfied with the service prices?</th>
                        <td><?= survay($review['question2']) ?></td>

                    </tr>
                    <tr>
                        <th>Are you satisfied with the nursing service?</th>
                        <td><?= survay($review['question3']) ?></td>

                    </tr>
                    <tr>
                        <th>Are you satisfied with the level of the doctors?</th>
                        <td><?= survay($review['question4']) ?></td>

                    </tr>
                    <tr>
                        <th>Are you satisfied with the calmness in the hospital?</th>
                        <td><?= survay($review['question5']) ?></td>

                    </tr>

                </tbody>
                <thead>
                    <tr>
                        <th scope="col">TOTAL REVIEW</th>
                        <th scope="col"><?= $result ?></th>

                    </tr>
                </thead>

            </table>
            <div class="form-group"> <?= $message ?> </div>


        </form>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="../BS5-Template/css/js/bootstrap.bundle.js"></script>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


</body>

</html>