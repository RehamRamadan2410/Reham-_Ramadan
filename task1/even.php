<?php

    if ($_POST) {

        $number = $_POST['number'];
        
        if ( $number %2== 0) {
            $sign = "EVEN";
        } else{
            $sign="ODD";
        }
}
?>
<!doctype html>
<html lang="en">

<head>
    <title>Even OR Odd</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
    <div class="container text-center">
        <h2 class=" mt-5 mb-3 dark">Even OR Odd</h2>

        <div class="row  py-4">
            <div class="col-4 offset-4">
                <form method="post">
                <div class="form-group ">
                        <label for="Number "> Add The Number</label>
                        <input type="number" name="number" id="Number" class="form-control mt-1 mb-3">

                       
                    <div>
                   

                    <button class="btn btn-warning rounded w-50 mb-5 mt-3">Result</button>
                </form>
                <?php

                if (isset( $sign) ){
                    echo
                    " <div class='alert alert-dark'>
            
            The Number =$number is $sign  
            
            </div>";}
            ?>

            </div>
        </div>
    </div>

</body>

</html> 