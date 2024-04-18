<?php
include_once 'app/views/share/header.php'
?>


<div class="row">
    <form action="/php/product/save" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="name">Name </label>
            <input type="text" class="form-control" id="name" name="name" aria-describedby="name"
                placeholder="Enter Name">
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <input type="text" class="form-control" id="description" name="description" placeholder="Description">
        </div>
        <div class="form-group">
            <label for="price">Price</label>
            <input type="number" class="form-control" id="price" name="price" placeholder="price">
        </div>
        <div class="form-group">
            <label for="image">Image</label>
            <input type="file" class="form-control-file" id="image" name="image">
        </div>

        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</div>

<?php
include_once 'app/views/share/footer.php'
?>