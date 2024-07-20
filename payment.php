<?php
include 'https://saybat.xyz/database/connect.php';
session_start();
if (!isset($_SESSION['email'])) {
    header('Location: https://saybat.xyz/login/login.php');
}
// $packageName = $_GET['packageName'];
// $price = $_GET['price'];

// echo $packageName;
// echo $price;

?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User List</title>

</head>
<style>
/* Add your CSS styles here */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #CDB693;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.table-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.entries-show select {
    padding: 8px;
    border-radius: 5px;
}

.search-box input {
    padding: 8px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

.table-container table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.table-container th,
.table-container td {
    padding: 12px;
    text-align: left;
}

.table-container th {
    background-color: #816842;
}

.table-container tbody tr:hover {
    background-color: #AE9B7E;
}

.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
    background-color: #AE9B7E;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    border-radius: 30px;
    width: 60%;
}

.modal-left {
    margin-top: 80px;
    width: 70%;
    float: left;
}

.modal-right {
    margin-top: 30px;
    width: 30%;
    float: left;
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

#studentImage {
    max-width: 100%;
    height: auto;
}

.hidden {
    display: none;
}

.verify-button-1,
.unverify-button-1 {
    color: black;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    width: 150px;
    font-size: 15px;
}

.verify-button-1 {
    background-color: #3DEF59;
    margin-left: 100px;
}

.unverify-button-1 {
    background-color: #E33939;
    margin-left: 20px;
}

.verify-button-1:hover,
.unverify-button-1:hover {
    filter: brightness(90%);
}
</style>
<body>

<?php include 'https://saybat.xyz/includes/nav-bar.php'; ?>

<div class="container">
    <div class="table-header">
        <div class="entries-show">
            Show <select>
                <option value="10">10</option>
                <option value="20">20</option>
                <!-- ... other options ... -->
            </select> entries
        </div>
        <div class="search-box">
            <label for="search">Search:</label>
            <input type="text" id="search">
        </div>
    </div>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Name <span class="sort-icon">&#9660;</span></th>
                    <th>Phone Number <span class="sort-icon">&#9660;</span></th>
                    <th>Email </th>
                    <th>Select <span class="sort-icon">&#9660;</span></th>
                    <th>Edit</th>
                </tr>
            </thead>
            <tbody>
            <?php
                $query = "SELECT pd.*, s.name, s.phone_number 
                FROM payment_details pd
                INNER JOIN students s ON pd.email = s.email";
                $result = mysqli_query($conn, $query);
                
                if ($result) {
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo '<tr>';
                        echo '<td>' . htmlspecialchars($row['name']) . '</td>';
                        echo '<td>' . htmlspecialchars($row['phone_number']) . '</td>';
                        echo '<td>' . htmlspecialchars($row['email']) . '</td>';
                        echo '<td class="hidden">' . htmlspecialchars($row['date']) . '</td>'; 
                        echo '<td class="hidden">' . htmlspecialchars($row['receipt_filename']) . '</td>'; 
                        echo '<td class="hidden hidden_id">' . htmlspecialchars($row['id']) . '</td>'; 
                        
                        if ($row['status'] == 0) {
                            echo '<td><button class="verify-button" style="background-color: red;">Unverified</button></td>';
                        } elseif ($row['status'] == 1) {
                            echo '<td><button class="verify-button" style="background-color: green;">Verified</button></td>';
                        }
                        
                        echo '<td><img src="../Images/edit-icon.svg" alt="Edit" class="edit-icon"></td>';
                        echo '</tr>';
                        ?>
                        <p class="hidden_id" id="id" style="display: none;"></p>
                        <div id="studentModal" class="modal" style="display: none;">
                            <div class="modal-content">
                                <div class="modal-left">
                                    <p id="studentName">Student Name: <?php echo $row['name']?></p>
                                    <p id="studentPhone">Phone Number: <?php echo $row['phone_number']?></p>
                                    <p id="studentDate">Date: <?php echo $row['date']?></p>
                                </div>
                                <div class="modal-right">
                                    <img id="studentImage" src="" alt="Student Image">
                                    <p>Click on image to download</p>
                                </div>
                                <div class="modal-actions">
                                    <button onclick="verifyBtn()" class="verify-button-1">Verify</button>
                                    <button id="unverifiedBtn" class="unverify-button-1">Unverified</button>
                                </div>
                            </div>
                        </div>
                        <script>
                            function verifyBtn() {
                                var id = document.querySelector('.hidden_id').textContent; 
                                var xhr = new XMLHttpRequest();
                                xhr.open('POST', 'update_status.php');
                                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                                xhr.onload = function() {
                                    if (xhr.status === 200) {
                                        console.log(xhr);
                                        window.location.reload();
                                    } else {
                                        console.error('Error:', xhr.statusText);
                                    }
                                };
                                xhr.send('id=' + encodeURIComponent(id) + '&status=1');
                            };

                            document.getElementById('unverifiedBtn').addEventListener('click', function() {
                                var id = document.querySelector('.hidden_id').textContent; 
                                var xhr = new XMLHttpRequest();
                                xhr.open('POST', 'update_status2.php');
                                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                                xhr.onload = function() {
                                    if (xhr.status === 200) {
                                        console.log(xhr.responseText);
                                        window.location.reload();
                                    } else {
                                        console.error('Error:', xhr.statusText);
                                    }
                                };
                                xhr.send('id=' + encodeURIComponent(id) + '&status=1');
                            });

                        </script>
                    <?php
                    }
                } else {
                    echo 'Error: ' . mysqli_error($conn);
                }
            ?>

        </tbody>
    </table>
</div>

<?php
$sql = "SELECT COUNT(*) AS total FROM payment_details";

$result = $conn->query($sql);

if ($result) {
    $row = $result->fetch_assoc();
    
    $totalCount = $row['total'];

    echo "<div class='table-info'>Showing 1 to $totalCount of $totalCount entries</div>";
} else {
    echo "Error: " . $conn->error;
}
?>


<script>
    var modal = document.getElementById('studentModal');

    var editIcons = document.querySelectorAll('.edit-icon');

    editIcons.forEach(function(icon) {
        icon.addEventListener('click', function() {
            modal.style.display = 'block';

            var studentName = this.closest('tr').querySelector('td:nth-child(1)').textContent;
            var studentPhone = this.closest('tr').querySelector('td:nth-child(2)').textContent;
            var studentDate = this.closest('tr').querySelector('td:nth-child(4)').textContent;
            var id = this.closest('tr').querySelector('td:nth-child(6)').textContent;
            var studentImageSrc = 'uploads/' + this.closest('tr').querySelector('td:nth-child(5)').textContent;

            document.getElementById('studentName').textContent = 'Student Name: ' + studentName;
            document.getElementById('studentPhone').textContent = 'Phone Number: ' + studentPhone;
            document.getElementById('studentDate').textContent = 'Date: ' + studentDate;
            document.getElementById('studentImage').src = studentImageSrc;
            document.getElementById('id').textContent = id;
        });
    });


    document.getElementById('studentImage').addEventListener('click', function() {
        var imageSrc = this.src;
        var fileName = imageSrc.substring(imageSrc.lastIndexOf('/') + 1);
        
        var anchor = document.createElement('a');
        anchor.href = imageSrc;
        anchor.download = fileName;
        anchor.click();
    });




</script>
</body>
</html>
