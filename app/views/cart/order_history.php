<?php
include_once 'app/views/share/header.php'
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Order History</h1>
    <?php if (!empty($orderHistory)): ?>
        <table>
            <thead>
                <tr>
                    <th >Order ID</th>
                    <th>Date</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Total Price</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($orderHistory as $order): ?>
                    <tr>
                        <td ><?php echo $order['OrderId'];?></td>
                        <td><?php echo $order['Date']; ?></td>
                        <td><?php echo $order['Address']; ?></td>
                        <td><?php echo $order['Phone']; ?></td>
                        <td><?php echo $order['Total']; ?></td>
                        <td><?php echo $order['ProductName']; ?></td>
                        <td><?php echo $order['Amount']; ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php else: ?>
        <p>No orders found.</p>
    <?php endif; ?>
</body>
</html>
<?php
include_once 'app/views/share/footer.php'
?>