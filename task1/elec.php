<?php
define('Bill',0.2);
    if ($_POST) {

        $unit= $_POST['number'];
        
        if ( $unit>0 && $unit <= 50) {
            $pre= 0.5;
        } elseif( $unit >50 && $unit <= 150) {
            $pre=0.75;
        }
        elseif( $unit>150 && $unit <= 250) {
            $pre=1.20;
        }
        else{$pre=1.50;

        }
        
        $price=$pre * $unit;   
$Bill=  $price * Bill;
$Tprice= $price + $Bill;
}
?>
<!doctype html>
<html lang="en">

<head>
    <title>Electricity</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
    <div class="container text-center">
        <h2 class=" mt-5 mb-3 dark">Electricity </h2>

        <div class="row  py-4">
            <div class="col-4 offset-4">
                <form method="post">
                <div class="form-group ">
                        <label for="Number "> Units</label>
                        <input type="number" name="number" id="Number" class="form-control mt-1 mb-3">

                       
                    <div>
                   

                    <button class="btn btn-warning rounded w-50 mb-5 mt-3">Result</button>
                </form>
                <?php

                if (isset( $unit) ){
                    echo
                    " <div class='alert alert-dark'>
            
            The Units = <b>$unit </b> <br>
            Price = $price <br>
            BILL = $Bill <br>
            Price After Bill = $Tprice
            
            </div>";}
            ?>

            </div>
        </div>
    </div>

</body>

</html> 