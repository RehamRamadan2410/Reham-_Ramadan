<?php
if ($_POST) {
    $phy= $_POST['Physics'] ;
    $che= $_POST['Chemistry'] ;
    $bio= $_POST['Biology'] ;
    $math= $_POST['Math'] ;
    $com= $_POST['Computer'];


    $add= $phy+ $che+ $bio+ $math +$com;
    $per=$add*100 /500;
    if ($per >= 90){
        $grade = "A" ;
    }elseif ($per >= 80){
        $grade = "B";
    } elseif ($per >= 70){
        $grade = "C";
    }elseif ($per >= 60 ){
        $grade = "D";
    }elseif ($per >= 40 ){
        $grade = "E";
    }elseif($per >= 0){ 
        $grade = "F";
    }else{ 
       $message= "<div class='alert alert-danger'>
       Add Real Values Please!</div> ";}
}



?>
<!doctype html>
<html lang="en">

<head>
    <title>Grade</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
    <div class="container text-center">
        <h3 class=" mt-5 mb-3">Enter Your Grade</h3>

        <div class="row py-5">
            <div class=" col-4 offset-4">
                <form method="post">
                <div clas='form-group' >

<label for="Physics mt-2">Physics</label>
<input type="number" name="Physics" id="Physics" class="form-control mt-1 mb-4">
<label for="Chemistry mt-2">Chemistry</label>
<input type="number"  name="Chemistry" id="Chemistry" class=" form-control  mt-1 mb-4">
<label for="Biology mt-2" >Biology</label>
<input type="number"  name="Biology" id="Biology" class=" form-control  mt-1 mb-4">
<label for="Math mt-2" >Math</label>
<input type="number"  name="Math" id="Math" class=" form-control  mt-1 mb-4">
<label for="Computer mt-2" >Computer</label>
<input type="number"  name="Computer" id="Computer" class=" form-control  mt-1 mb-4">
</div>
                   
                    <button class="btn btn-success w-50 mb-5 mt-2">Result</button>
                </form>
                <?php

                if (isset($add,$grade)) {
                    echo "<div >
              
                    Your Total Grade Is <br>  <b>{$add}/500</b>  <br>
                    Your Percentage Is <br>  <strong>{$per}%</strong>  <br>
                    Your Grade Is <br>  <strong>{$grade}</strong>  <br>
                    </div>";

                }elseif(isset($message)){
                    echo $message;
                    }
                ?>

            </div>
        </div>
    </div>



</html> 