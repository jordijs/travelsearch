<form method="post">
<label>Search your trip!</label>
<input type="text" name="searchText">
</form>

<?php 

if (!empty($_POST)) {

    $searchText = $_POST["searchText"];

    $searchTextLength = strlen($searchText);

    if ($searchTextLength > 2) {
        //Start app
        require_once 'app.php';
        
    } else {
        echo "The search must include at least three characters. Please, try again.";
    }
}



