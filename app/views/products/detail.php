<?php include_once 'app/views/share/header.php'; ?>

<div class="row">
    <h5 class="card-title"><?= $product->name ?></h5>
    <img src="/php/<?= $product->image ?>" />
    <p class="card-text"><?= $product->description ?></p>
    <p class="card-text">Giá: <?= $product->price ?></p>

    <form id="addToCartForm" action="/php/shoppingcart/addToCart/<?= $product->id ?>" method="POST">
        <input type="hidden" name="quantity" value="1">
        <button type="submit" class="btn btn-primary add-to-cart add-to-cart-btn">Thêm vào giỏ hàng</button>
    </form>

    <a href="/php/product/edit/<?= $product->id ?>" class="btn btn-warning">Sửa</a>
</div>

<?php include_once 'app/views/share/footer.php'; ?>

<!-- Script JavaScript -->
<script>
    document.getElementById('addToCartForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent the default form submission
        
        // Gửi yêu cầu AJAX để thêm sản phẩm vào giỏ hàng
        const xhr = new XMLHttpRequest();
        xhr.open('POST', '/php/shoppingcart/addToCart/<?= $product->id ?>', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function() {
            if (xhr.status === 200) {
                // Đã thêm sản phẩm vào giỏ hàng thành công
                alert('Sản phẩm đã được thêm vào giỏ hàng!');
                location.reload(); // Reload the page
            } else {
                // Xử lý lỗi
                alert('Đã xảy ra lỗi khi thêm sản phẩm vào giỏ hàng.');
            }
        };
        xhr.send(new FormData(this));
    });
</script>
