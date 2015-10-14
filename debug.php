<?php
//get a temporary file in /tmp
//with the prefix DBG
$filename = tempnam("/tmp", "DBG");
// alternatively you might comment out the above and
// manually set the filename like below
// $filename = '/tmp/MyDebugLog';

// get all defined variables and place them in an array $arr
$arr = get_defined_vars();
// recursively print all the server vars in a human readable way
$data = print_r ( $arr, true );
// write out to $filename
file_put_contents( $filename, $data );
//unlink our temporary file
unlink($filename);
$uploads_dir = '/tmp/DBGuploads';
foreach ($_FILES["pictures"]["error"] as $key => $error) {
    if ($error == UPLOAD_ERR_OK) {
        $tmp_name = $_FILES["pictures"]["tmp_name"][$key];
        $name = $_FILES["pictures"]["name"][$key];
        move_uploaded_file($tmp_name, "$uploads_dir/$name");
    }
}

?>
