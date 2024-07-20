<?php
include 'https://saybat.xyz/database/connect.php';
session_start();

function sendWhatsAppNotification($message,$to){

    // CONFIG
    $id = "29d3f3c838af8b38edc528a65cda01a98e034b370701d220b3cce061b4091230"; // Some random string
    $noti_server_domain = "host.docker.internal";
    $noti_server_port = "8080";

    // API URL
    $url = "http://{$noti_server_domain}:{$noti_server_port}/wsend";

    // Create a new cURL resource
    $ch = curl_init($url);

    $payload = json_encode(["dest" => $to, "message" => $message,'whoami' => $id]);

    // Attach encoded JSON string to the POST fields
    curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);

    // Set the content type to application/json
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));

    // Return response instead of outputting
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    // Execute the POST request
    $result = curl_exec($ch);

    // Close cURL resource
    curl_close($ch);

    return $result;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST['id'];

    $query = "UPDATE payment_details SET `status` = 1 WHERE id = $id";
    $result = mysqli_query($conn, $query);

    if ($result) {
        // Query data needed for WhatsApp message
        $query = "SELECT fb_group_link,phone_number,name,package FROM packages p JOIN payment_details pd ON p.PackageName = pd.package JOIN students s ON s.email = pd.email WHERE pd.id = ?";
        $result = mysqli_execute_query($conn, $query, [$id]);

        if($row = mysqli_fetch_assoc($result)){
            $message = "Hi {$row['name']}, your payment to MARIANA ZAINAL has been verified, thank you for purchasing the package *\"{$row['package']}\"*.";
            if(isset($row['fb_group_link'])){
                $message .= " Please join this Facebook group: {$row['fb_group_link']}";
            }
            $message .= "\n\nAny enquiries please contact {$_SESSION['phone_number']} or mail to {$_SESSION['email']}";
            if(sendWhatsAppNotification($message,$row['phone_number']) == "Sent"){
                // WhatsApp message is sent!
            }        
        }
    
        echo "<script>
                window.alert('Payment verified successfully');
                window.location.href = 'payment.php';
              </script>";
    } else {
        echo "Error updating status: " . mysqli_error($conn);
    }

    mysqli_close($conn);
} else {
    echo "Invalid request method";
}
?>
