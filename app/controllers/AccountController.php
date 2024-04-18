<?php
class AccountController
{

    private $db;
    private $accountModel;

    public function __construct()
    {
        $this->db = (new Database())->getConnection();
        $this->accountModel = new AccountModel($this->db);
    }

    function register()
    {
        include_once 'app/views/account/register.php';
    }

    function save()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $email = $_POST['email'] ?? '';
            $name = $_POST['name'] ?? '';
            $pass = $_POST['password'] ?? '';
            $confirmPass = $_POST['confirmPassword'] ?? '';

            $errors = [];
            if (empty($email)) {
                $errors['email'] = "Vui long nhap Email";
            }
            if (empty($name)) {
                $errors['name'] = "Vui long nhap Full Name";
            }
            if (empty($pass)) {
                $errors['pass'] = "Vui long nhap Password";
            }
            if ($pass != $confirmPass) {
                $errors['confirmPass'] = "Mật khẩu và xác nhận MK phải giống nhau!";
            }
            //kiểm tra Email đã tồn tại trong CSDL hay chưa?
            $emailExist = $this->accountModel->getAccountByEmail($email);

            if ($emailExist) {
                $errors['ExistEmail'] = "Email tài khoản đã tồn tại!";
            }

            if (count($errors) > 0) {
                // var_dump($errors);
                include_once 'app/views/account/register.php';
            } else {
                //mã hóa mật khẩu
                $hashedPassword = password_hash($pass, PASSWORD_BCRYPT, ['cost' => 12]);
                $result = $this->accountModel->createAccount($email, $name, $hashedPassword);
                if ($result) {
                    header('Location: /php/account/login');
                } else {
                    $errors['sql'] = "Lỗi server không thể truy vấn!";
                    include_once 'app/views/account/register.php';
                }
            }
        }
    }

    function login()
    {
        include_once 'app/views/account/login.php';
    }

    // function checkLogin()
    // {
    //     if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    //         $email = $_POST['email'] ?? '';
    //         $pass = $_POST['password'] ?? '';

    //         $errors = [];
    //         if (empty($email)) {
    //             $errors['email'] = "Vui long nhap Email";
    //         }
    //         if (empty($pass)) {
    //             $errors['pass'] = "Vui long nhap Password";
    //         }

    //         //lấy thông tin tài khoản trong csdl theo email
    //         $account = $this->accountModel->getAccountByEmail($email);

    //         if ($account && password_verify($pass, $account->password)) {
    //             //đúng tài khoản
    //             $_SESSION['username'] = $account->email;
    //             $_SESSION['role'] = $account->role;
    //             $_SESSION['name'] = $account->name;
    //             $_SESSION['accountId'] = $account->id; // Đặt accountId vào session

    //             header ('Location: /php');
    //         }else if ($account && !password_verify($pass, $account->password))
    //         {
    //             $errors['account'] = "Sai mat khau roi!";
    //             include_once 'app/views/account/login.php';
    //         }  
    //         else {
    //             $errors['account'] = "Tài khoản không tồn tại!";
    //             include_once 'app/views/account/login.php';
    //         }
    //     }
    // }
    function checkLogin()
{
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $email = $_POST['email'] ?? '';
        $pass = $_POST['password'] ?? '';

        $errors = [];
        if (empty($email)) {
            $errors['email'] = "Vui lòng nhập Email";
        }
        if (empty($pass)) {
            $errors['pass'] = "Vui lòng nhập Password";
        }

        // Lấy thông tin tài khoản từ CSDL dựa trên email
        $account = $this->accountModel->getAccountByEmail($email);

        if ($account && password_verify($pass, $account->password)) {
            // Đúng tài khoản
            $_SESSION['username'] = $account->email;
            $_SESSION['role'] = $account->role_id; // Sử dụng role_id để thiết lập quyền
            $_SESSION['name'] = $account->name;
            $_SESSION['accountId'] = $account->id; // Đặt accountId vào session

            // Kiểm tra và thiết lập quyền mặc định nếu không có quyền
            if (!isset($account->role_id)) {
                $_SESSION['role'] = 2; // Cấp quyền mặc định là 2 (user)
            }

            if ($account->role_id == 1) {
                // Nếu là quyền 1 (admin), chuyển hướng đến trang index của AdminController
                header('Location: /php/admin');
            } else {
                // Nếu là quyền 2 hoặc khác, chuyển hướng đến trang chính
                header('Location: /php');
            }
        } else {
            $errors['account'] = "Tài khoản hoặc mật khẩu không đúng!";
            include_once 'app/views/account/login.php';
        }
    }
}

    
    
    function logout(){
        unset($_SESSION['username']);
        unset($_SESSION['role']);
        unset($_SESSION['name']);
        header('Location: /php/account/login');
    }
}