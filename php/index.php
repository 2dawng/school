<?php
session_start();

// Handle tab preservation after form submission
$current_tab = 'home';
if (isset($_POST['current_tab'])) {
    $current_tab = $_POST['current_tab'];
} elseif (isset($_GET['tab'])) {
    $current_tab = $_GET['tab'];
} elseif (isset($_POST['exercise'])) {
    // Map exercise to tab
    $exercise_to_tab = array(
        'ex1' => 'ex1',
        'ex2a' => 'ex2a',
        'ex2b' => 'ex2b', 
        'ex3' => 'ex3',
        'ex4' => 'ex4',
        'ex5' => 'ex5',
        'ex6' => 'ex6',
        'ex7' => 'ex7',
        'ex8' => 'ex8',
        'ex9' => 'ex9',
        'ex10' => 'ex10',
        'ex11_login' => 'ex11',
        'ex11_signup' => 'ex11'
    );
    if (isset($exercise_to_tab[$_POST['exercise']])) {
        $current_tab = $exercise_to_tab[$_POST['exercise']];
    }
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thực Hành Cơ Bản Với HTML, CSS, PHP</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 1400px;
            margin: 0 auto;
            background: white;
            border-radius: 0;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            overflow: hidden;
            display: grid;
            grid-template-columns: 200px 1fr;
            min-height: 100vh;
        }
        
        .sidebar {
            background: linear-gradient(180deg, #4CAF50, #45a049);
            padding: 0;
            border-right: 3px solid #2e7d32;
        }
        
        .main-content {
            background: white;
        }
        
        .header {
            background: linear-gradient(45deg, #4CAF50, #45a049);
            color: white;
            padding: 20px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }
        
        .student-info {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px 30px;
            flex: 1;
        }
        
        .info-item {
            font-size: 16px;
            font-weight: bold;
        }
        
        .highlight {
            color: #ffeb3b;
            background: rgba(0,0,0,0.2);
            padding: 2px 8px;
            border-radius: 4px;
        }
        
        .search-container {
            margin-left: 20px;
        }
        
        .search-box {
            padding: 10px 15px;
            border: none;
            border-radius: 20px;
            width: 200px;
            font-size: 14px;
        }
        
        .nav-tabs {
            background: linear-gradient(180deg, #4CAF50, #45a049);
            padding: 20px 0;
            display: flex;
            flex-direction: column;
            border: none;
        }
        
        .nav-tab {
            width: 100%;
            padding: 15px 20px;
            background: transparent;
            border: none;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: bold;
            color: white;
            text-align: left;
            border-bottom: 1px solid rgba(255,255,255,0.2);
            font-size: 16px;
        }
        
        .nav-tab:hover {
            background: rgba(255,255,255,0.2);
            padding-left: 30px;
        }
        
        .nav-tab.active {
            background: rgba(255,255,255,0.3);
            border-left: 4px solid #ffeb3b;
            padding-left: 26px;
        }
        
        .content {
            padding: 30px;
            min-height: 500px;
        }
        
        .exercise-form {
            background: #f8f9fa;
            padding: 25px;
            border-radius: 10px;
            margin: 20px 0;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }
        
        .form-group input, .form-group textarea, .form-group select {
            width: 100%;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        
        .form-group input:focus, .form-group textarea:focus {
            outline: none;
            border-color: #4CAF50;
        }
        
        .btn {
            background: #4CAF50;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        
        .btn:hover {
            background: #45a049;
        }
        
        .result {
            background: #e8f5e8;
            border: 2px solid #4CAF50;
            border-radius: 8px;
            padding: 20px;
            margin-top: 20px;
        }
        
        .result h3 {
            color: #2e7d32;
            margin-bottom: 15px;
        }
        
        .result-content {
            font-size: 14px;
            line-height: 1.6;
        }
        
        .exercise-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        
        .exercise-card {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        
        .exercise-card:hover {
            transform: translateY(-5px);
        }
        
        .exercise-card h4 {
            color: #4CAF50;
            margin-bottom: 10px;
        }
        
        .hidden {
            display: none;
        }
        
        @media (max-width: 768px) {
            .container {
                grid-template-columns: 1fr;
            }
            
            .sidebar {
                order: 2;
            }
            
            .main-content {
                order: 1;
            }
            
            .nav-tabs {
                flex-direction: row;
                overflow-x: auto;
            }
            
            .nav-tab {
                min-width: 80px;
                white-space: nowrap;
            }
            
            .header {
                padding: 15px;
            }
            
            .student-info {
                grid-template-columns: 1fr;
                gap: 5px;
            }
            
            .search-container {
                margin-left: 0;
                margin-top: 10px;
            }
            
            .search-box {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <div class="nav-tabs">
                <button class="nav-tab<?php echo ($current_tab == 'home') ? ' active' : ''; ?>" onclick="showTab('home')">Trang chủ</button>
                <button class="nav-tab<?php echo ($current_tab == 'ex1') ? ' active' : ''; ?>" onclick="showTab('ex1')">Bài1</button>
                <button class="nav-tab<?php echo ($current_tab == 'ex2a') ? ' active' : ''; ?>" onclick="showTab('ex2a')">Bài2a</button>
                <button class="nav-tab<?php echo ($current_tab == 'ex2b') ? ' active' : ''; ?>" onclick="showTab('ex2b')">Bài2b</button>
                <button class="nav-tab<?php echo ($current_tab == 'ex3') ? ' active' : ''; ?>" onclick="showTab('ex3')">Bài3</button>
                <button class="nav-tab<?php echo ($current_tab == 'ex4') ? ' active' : ''; ?>" onclick="showTab('ex4')">Bài4</button>
                <button class="nav-tab<?php echo ($current_tab == 'ex5') ? ' active' : ''; ?>" onclick="showTab('ex5')">Bài5</button>
                <button class="nav-tab<?php echo ($current_tab == 'ex6') ? ' active' : ''; ?>" onclick="showTab('ex6')">Bài6</button>
                <button class="nav-tab<?php echo ($current_tab == 'ex7') ? ' active' : ''; ?>" onclick="showTab('ex7')">Bài7</button>
                <button class="nav-tab<?php echo ($current_tab == 'ex8') ? ' active' : ''; ?>" onclick="showTab('ex8')">Bài8</button>
                <button class="nav-tab<?php echo ($current_tab == 'ex9') ? ' active' : ''; ?>" onclick="showTab('ex9')">Bài9</button>
                <button class="nav-tab<?php echo ($current_tab == 'ex10') ? ' active' : ''; ?>" onclick="showTab('ex10')">Bài10</button>
                <button class="nav-tab<?php echo ($current_tab == 'ex11') ? ' active' : ''; ?>" onclick="showTab('ex11')">Bài11</button>
            </div>
        </div>
        
        <div class="main-content">
            <div class="header">
                <div class="student-info">
                    <div class="info-item">Họ tên: <span class="highlight">Nguyễn Trần Hải Đăng</span></div>
                    <div class="info-item">Khoa: <span class="highlight">Công nghệ Thông tin</span></div>
                    <div class="info-item">Lớp: <span class="highlight">CNTT</span></div>
                    <div class="info-item">Khóa: <span class="highlight">K63</span></div>
                </div>
                <div class="search-container">
                    <input type="text" placeholder="Tìm kiếm..." class="search-box">
                </div>
            </div>
            
            <div class="content">
            <!-- Home Tab -->
            <div id="home" class="tab-content<?php echo ($current_tab == 'home') ? '' : ' hidden'; ?>">
                <div style="background: #f0f8f0; padding: 20px; border-left: 4px solid #4CAF50; margin-bottom: 20px;">
                    <h2 style="color: #2e7d32; margin: 0;">Chào mừng bạn đến với website tìm hiểu về lập trình web</h2>
                </div>
                
                <div style="padding: 20px; background: white;">
                    <h3 style="color: #4CAF50;">Danh sách các bài tập thực hành PHP</h3>
                    <p>Đây là những bài viết mới nhất được cập nhật trong chuyên mục Tự Học PHP.</p>
                    <p><strong>PHP</strong> là một ngôn ngữ lập trình phía Server dùng để xây dựng các ứng dụng Website. Điểm mạnh của PHP là dễ học, dễ sử dụng, có tốc độ xử lý nhanh và quan trọng nhất là hoàn toàn miễn phí.</p>
                    
                    <div class="exercise-list">
                        <div class="exercise-card">
                            <h4>Bài 1: Số nguyên tố</h4>
                            <p>Tính và in tổng các số nguyên tố từ 1 đến 100</p>
                        </div>
                        <div class="exercise-card">
                            <h4>Bài 2: Tổng chuỗi số</h4>
                            <p>Tính tổng các chuỗi số với điều kiện khác nhau</p>
                        </div>
                        <div class="exercise-card">
                            <h4>Bài 3: Biểu thức toán học</h4>
                            <p>S(x,n) = x + x²/2! + x³/3! + ... + xⁿ/n!</p>
                        </div>
                        <div class="exercise-card">
                            <h4>Bài 4: Nhập số liên tục</h4>
                            <p>Nhập số cho đến khi nhập 0 thì dừng</p>
                        </div>
                        <div class="exercise-card">
                            <h4>Bài 5: Số hoàn hảo</h4>
                            <p>Kiểm tra xem một số có phải số hoàn hảo hay không</p>
                        </div>
                        <div class="exercise-card">
                            <h4>Bài 6: Giai thừa</h4>
                            <p>Tính giá trị của n giai thừa (n! = n(n-1)!)</p>
                        </div>
                        <div class="exercise-card">
                            <h4>Bài 7: Ước số</h4>
                            <p>Liệt kê tất cả các ước số của số nguyên dương n</p>
                        </div>
                        <div class="exercise-card">
                            <h4>Bài 8: Mảng số nguyên</h4>
                            <p>Đếm phần tử âm, dương trong mảng 10 phần tử</p>
                        </div>
                        <div class="exercise-card">
                            <h4>Bài 9: Chuyển đổi thời gian</h4>
                            <p>Chuyển giây sang định dạng giờ:phút:giây</p>
                        </div>
                        <div class="exercise-card">
                            <h4>Bài 10: Class OOP</h4>
                            <p>Tạo class Person và class Student kế thừa</p>
                        </div>
                        <div class="exercise-card">
                            <h4>Bài 11: Form đăng ký</h4>
                            <p>Tạo form giao diện đăng ký/đăng nhập</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Exercise 1 -->
            <div id="ex1" class="tab-content<?php echo ($current_tab == 'ex1') ? '' : ' hidden'; ?>">
                <h2>Bài 1: Tính tổng các số nguyên tố từ 1 đến 100</h2>
                <div class="exercise-form">
                    <form method="post">
                        <input type="hidden" name="exercise" value="ex1">
                        <input type="hidden" name="current_tab" value="ex1">
                        <button type="submit" class="btn">Tính tổng số nguyên tố</button>
                    </form>
                    
                    <?php
                    if (isset($_POST['exercise']) && $_POST['exercise'] == 'ex1') {
                        function isPrime($n) {
                            if ($n < 2) return false;
                            for ($i = 2; $i <= sqrt($n); $i++) {
                                if ($n % $i == 0) return false;
                            }
                            return true;
                        }
                        
                        $sum = 0;
                        $primes = array();
                        for ($i = 1; $i <= 100; $i++) {
                            if (isPrime($i)) {
                                $sum += $i;
                                $primes[] = $i;
                            }
                        }
                        
                        echo '<div class="result">';
                        echo '<h3>Kết quả:</h3>';
                        echo '<div class="result-content">';
                        echo '<p><strong>Các số nguyên tố từ 1 đến 100:</strong></p>';
                        echo '<p>' . implode(', ', $primes) . '</p>';
                        echo '<p><strong>Tổng các số nguyên tố: ' . $sum . '</strong></p>';
                        echo '</div>';
                        echo '</div>';
                    }
                    ?>
                </div>
            </div>

            <!-- Exercise 2a -->
            <div id="ex2a" class="tab-content<?php echo ($current_tab == 'ex2a') ? '' : ' hidden'; ?>">
                <h2>Bài 2a: Tính tổng chuỗi T = 1/2 + 2/3 + 3/4 + … n/n+1</h2>
                <div class="exercise-form">
                    <form method="post">
                        <input type="hidden" name="exercise" value="ex2a">
                        <input type="hidden" name="current_tab" value="ex2a">
                        <div class="form-group">
                            <label for="n2a">Nhập giá trị n:</label>
                            <input type="number" id="n2a" name="n" min="1" value="<?php echo isset($_POST['n']) && $_POST['exercise'] == 'ex2a' ? $_POST['n'] : ''; ?>" required>
                        </div>
                        <button type="submit" class="btn">Tính tổng</button>
                    </form>
                    
                    <?php
                    if (isset($_POST['exercise']) && $_POST['exercise'] == 'ex2a' && isset($_POST['n'])) {
                        $n = (int)$_POST['n'];
                        $sum = 0;
                        $terms = array();
                        
                        for ($i = 1; $i <= $n; $i++) {
                            $term = $i / ($i + 1);
                            $sum += $term;
                            $terms[] = "$i/" . ($i + 1);
                        }
                        
                        echo '<div class="result">';
                        echo '<h3>Kết quả:</h3>';
                        echo '<div class="result-content">';
                        echo '<p><strong>Biểu thức:</strong> ' . implode(' + ', $terms) . '</p>';
                        echo '<p><strong>Tổng T = ' . number_format($sum, 6) . '</strong></p>';
                        echo '</div>';
                        echo '</div>';
                    }
                    ?>
                </div>
            </div>

            <!-- Exercise 2b -->
            <div id="ex2b" class="tab-content<?php echo ($current_tab == 'ex2b') ? '' : ' hidden'; ?>">
                <h2>Bài 2b: Tính tổng chuỗi T = 1/2 + 1/4 + 1/6 + ... với điều kiện e = 1/n+2 > 0.0001</h2>
                <div class="exercise-form">
                    <form method="post">
                        <input type="hidden" name="exercise" value="ex2b">
                        <input type="hidden" name="current_tab" value="ex2b">
                        <button type="submit" class="btn">Tính tổng (với điều kiện dừng)</button>
                    </form>
                    
                    <?php
                    if (isset($_POST['exercise']) && $_POST['exercise'] == 'ex2b') {
                        $sum = 0;
                        $n = 2;
                        $terms = array();
                        
                        do {
                            $term = 1 / $n;
                            $sum += $term;
                            $terms[] = "1/$n";
                            $n += 2;
                            $e = 1 / ($n);
                        } while ($e > 0.0001);
                        
                        echo '<div class="result">';
                        echo '<h3>Kết quả:</h3>';
                        echo '<div class="result-content">';
                        echo '<p><strong>Các số hạng:</strong> ' . implode(' + ', $terms) . '</p>';
                        echo '<p><strong>Số lượng số hạng:</strong> ' . count($terms) . '</p>';
                        echo '<p><strong>Tổng T = ' . number_format($sum, 6) . '</strong></p>';
                        echo '<p><strong>Giá trị e cuối cùng:</strong> ' . number_format($e, 6) . '</p>';
                        echo '</div>';
                        echo '</div>';
                    }
                    ?>
                </div>
            </div>

            <!-- Exercise 3 -->
            <div id="ex3" class="tab-content<?php echo ($current_tab == 'ex3') ? '' : ' hidden'; ?>">
                <h2>Bài 3: Tính biểu thức S(x,n) = x + x²/2! + x³/3! + ... + xⁿ/n!</h2>
                <div class="exercise-form">
                    <form method="post">
                        <input type="hidden" name="exercise" value="ex3">
                        <input type="hidden" name="current_tab" value="ex3">
                        <div class="form-group">
                            <label for="x3">Nhập giá trị x:</label>
                            <input type="number" id="x3" name="x" step="0.01" value="<?php echo isset($_POST['x']) && $_POST['exercise'] == 'ex3' ? $_POST['x'] : ''; ?>" required>
                        </div>
                        <div class="form-group">
                            <label for="n3">Nhập giá trị n:</label>
                            <input type="number" id="n3" name="n" min="1" value="<?php echo isset($_POST['n']) && $_POST['exercise'] == 'ex3' ? $_POST['n'] : ''; ?>" required>
                        </div>
                        <button type="submit" class="btn">Tính biểu thức</button>
                    </form>
                    
                    <?php
                    if (isset($_POST['exercise']) && $_POST['exercise'] == 'ex3' && isset($_POST['x']) && isset($_POST['n'])) {
                        $x = (float)$_POST['x'];
                        $n = (int)$_POST['n'];
                        
                        function factorial($n) {
                            if ($n <= 1) return 1;
                            return $n * factorial($n - 1);
                        }
                        
                        $sum = $x; // First term
                        $terms = array("x");
                        
                        for ($i = 2; $i <= $n; $i++) {
                            $term = pow($x, $i) / factorial($i);
                            $sum += $term;
                            $terms[] = "x^$i/$i!";
                        }
                        
                        echo '<div class="result">';
                        echo '<h3>Kết quả:</h3>';
                        echo '<div class="result-content">';
                        echo '<p><strong>Biểu thức:</strong> ' . implode(' + ', $terms) . '</p>';
                        echo '<p><strong>Với x = ' . $x . ', n = ' . $n . '</strong></p>';
                        echo '<p><strong>S(x,n) = ' . number_format($sum, 6) . '</strong></p>';
                        echo '</div>';
                        echo '</div>';
                    }
                    ?>
                </div>
            </div>

            <!-- Exercise 4 -->
            <div id="ex4" class="tab-content<?php echo ($current_tab == 'ex4') ? '' : ' hidden'; ?>">
                <h2>Bài 4: Nhập số cho đến khi nhập 0 thì dừng</h2>
                <div class="exercise-form">
                    <form method="post">
                        <input type="hidden" name="exercise" value="ex4">
                        <input type="hidden" name="current_tab" value="ex4">
                        <div class="form-group">
                            <label for="numbers">Nhập các số (cách nhau bằng dấu phẩy), nhập 0 để dừng:</label>
                            <input type="text" id="numbers" name="numbers" placeholder="VD: 5,10,15,3,0" value="<?php echo isset($_POST['numbers']) && $_POST['exercise'] == 'ex4' ? $_POST['numbers'] : ''; ?>" required>
                        </div>
                        <button type="submit" class="btn">Xử lý dãy số</button>
                    </form>
                    
                    <?php
                    if (isset($_POST['exercise']) && $_POST['exercise'] == 'ex4' && isset($_POST['numbers'])) {
                        $input = $_POST['numbers'];
                        $numbers = explode(',', $input);
                        $processed = array();
                        $sum = 0;
                        $count = 0;
                        
                        foreach ($numbers as $num) {
                            $num = (int)trim($num);
                            if ($num == 0) {
                                break;
                            }
                            $processed[] = $num;
                            $sum += $num;
                            $count++;
                        }
                        
                        echo '<div class="result">';
                        echo '<h3>Kết quả:</h3>';
                        echo '<div class="result-content">';
                        echo '<p><strong>Các số đã nhập (trước số 0):</strong> ' . implode(', ', $processed) . '</p>';
                        echo '<p><strong>Số lượng số:</strong> ' . $count . '</p>';
                        echo '<p><strong>Tổng các số:</strong> ' . $sum . '</p>';
                        if ($count > 0) {
                            echo '<p><strong>Trung bình:</strong> ' . number_format($sum / $count, 2) . '</p>';
                        }
                        echo '</div>';
                        echo '</div>';
                    }
                    ?>
                </div>
            </div>

            <!-- Exercise 5 -->
            <div id="ex5" class="tab-content<?php echo ($current_tab == 'ex5') ? '' : ' hidden'; ?>">
                <h2>Bài 5: Kiểm tra số hoàn hảo</h2>
                <div class="exercise-form">
                    <form method="post">
                        <input type="hidden" name="exercise" value="ex5">
                        <input type="hidden" name="current_tab" value="ex5">
                        <div class="form-group">
                            <label for="perfect_num">Nhập số cần kiểm tra:</label>
                            <input type="number" id="perfect_num" name="perfect_num" min="1" value="<?php echo isset($_POST['perfect_num']) && $_POST['exercise'] == 'ex5' ? $_POST['perfect_num'] : ''; ?>" required>
                        </div>
                        <button type="submit" class="btn">Kiểm tra số hoàn hảo</button>
                    </form>
                    
                    <?php
                    if (isset($_POST['exercise']) && $_POST['exercise'] == 'ex5' && isset($_POST['perfect_num'])) {
                        $num = (int)$_POST['perfect_num'];
                        
                        function isPerfect($n) {
                            if ($n <= 1) return false;
                            
                            $sum = 1; // 1 is always a divisor
                            $divisors = array(1);
                            
                            for ($i = 2; $i <= sqrt($n); $i++) {
                                if ($n % $i == 0) {
                                    $sum += $i;
                                    $divisors[] = $i;
                                    if ($i != $n / $i) {
                                        $sum += $n / $i;
                                        $divisors[] = $n / $i;
                                    }
                                }
                            }
                            
                            sort($divisors);
                            return array('isPerfect' => $sum == $n, 'divisors' => $divisors, 'sum' => $sum);
                        }
                        
                        $result = isPerfect($num);
                        
                        echo '<div class="result">';
                        echo '<h3>Kết quả:</h3>';
                        echo '<div class="result-content">';
                        echo '<p><strong>Số cần kiểm tra:</strong> ' . $num . '</p>';
                        echo '<p><strong>Các ước số (không kể chính nó):</strong> ' . implode(', ', $result['divisors']) . '</p>';
                        echo '<p><strong>Tổng các ước số:</strong> ' . $result['sum'] . '</p>';
                        if ($result['isPerfect']) {
                            echo '<p style="color: green;"><strong>' . $num . ' là số hoàn hảo!</strong></p>';
                        } else {
                            echo '<p style="color: red;"><strong>' . $num . ' không phải là số hoàn hảo.</strong></p>';
                        }
                        echo '<p><em>Số hoàn hảo là số bằng tổng các ước số thực sự của nó (VD: 6 = 1 + 2 + 3)</em></p>';
                        echo '</div>';
                        echo '</div>';
                    }
                    ?>
                </div>
            </div>

            <!-- Exercise 6 -->
            <div id="ex6" class="tab-content<?php echo ($current_tab == 'ex6') ? '' : ' hidden'; ?>">
                <h2>Bài 6: Tính giai thừa n! = n(n-1)!</h2>
                <div class="exercise-form">
                    <form method="post">
                        <input type="hidden" name="exercise" value="ex6">
                        <input type="hidden" name="current_tab" value="ex6">
                        <div class="form-group">
                            <label for="factorial_n">Nhập giá trị n:</label>
                            <input type="number" id="factorial_n" name="factorial_n" min="0" max="20" value="<?php echo isset($_POST['factorial_n']) && $_POST['exercise'] == 'ex6' ? $_POST['factorial_n'] : ''; ?>" required>
                        </div>
                        <button type="submit" class="btn">Tính giai thừa</button>
                    </form>
                    
                    <?php
                    if (isset($_POST['exercise']) && $_POST['exercise'] == 'ex6' && isset($_POST['factorial_n'])) {
                        $n = (int)$_POST['factorial_n'];
                        
                        function factorialRecursive($n) {
                            if ($n <= 1) return 1;
                            return $n * factorialRecursive($n - 1);
                        }
                        
                        function factorialIterative($n) {
                            $result = 1;
                            for ($i = 2; $i <= $n; $i++) {
                                $result *= $i;
                            }
                            return $result;
                        }
                        
                        $recursiveResult = factorialRecursive($n);
                        $iterativeResult = factorialIterative($n);
                        
                        // Build the expression
                        $expression = array();
                        for ($i = $n; $i >= 1; $i--) {
                            $expression[] = $i;
                        }
                        
                        echo '<div class="result">';
                        echo '<h3>Kết quả:</h3>';
                        echo '<div class="result-content">';
                        echo '<p><strong>Biểu thức:</strong> ' . $n . '! = ' . implode(' × ', $expression) . '</p>';
                        echo '<p><strong>Phương pháp đệ quy:</strong> ' . number_format($recursiveResult) . '</p>';
                        echo '<p><strong>Phương pháp lặp:</strong> ' . number_format($iterativeResult) . '</p>';
                        echo '<p><strong>' . $n . '! = ' . number_format($recursiveResult) . '</strong></p>';
                        echo '</div>';
                        echo '</div>';
                    }
                    ?>
                </div>
            </div>

            <!-- Exercise 7 -->
            <div id="ex7" class="tab-content<?php echo ($current_tab == 'ex7') ? '' : ' hidden'; ?>">
                <h2>Bài 7: Liệt kê tất cả các ước số của số nguyên dương n</h2>
                <div class="exercise-form">
                    <form method="post">
                        <input type="hidden" name="exercise" value="ex7">
                        <input type="hidden" name="current_tab" value="ex7">
                        <div class="form-group">
                            <label for="divisor_n">Nhập số nguyên dương n:</label>
                            <input type="number" id="divisor_n" name="divisor_n" min="1" value="<?php echo isset($_POST['divisor_n']) && $_POST['exercise'] == 'ex7' ? $_POST['divisor_n'] : ''; ?>" required>
                        </div>
                        <button type="submit" class="btn">Tìm ước số</button>
                    </form>
                    
                    <?php
                    if (isset($_POST['exercise']) && $_POST['exercise'] == 'ex7' && isset($_POST['divisor_n'])) {
                        $n = (int)$_POST['divisor_n'];
                        
                        function findDivisors($n) {
                            $divisors = array();
                            for ($i = 1; $i <= sqrt($n); $i++) {
                                if ($n % $i == 0) {
                                    $divisors[] = $i;
                                    if ($i != $n / $i) {
                                        $divisors[] = $n / $i;
                                    }
                                }
                            }
                            sort($divisors);
                            return $divisors;
                        }
                        
                        $divisors = findDivisors($n);
                        $count = count($divisors);
                        
                        echo '<div class="result">';
                        echo '<h3>Kết quả:</h3>';
                        echo '<div class="result-content">';
                        echo '<p><strong>Số cần tìm ước:</strong> ' . $n . '</p>';
                        echo '<p><strong>Các ước số:</strong> ' . implode(', ', $divisors) . '</p>';
                        echo '<p><strong>Số lượng ước số:</strong> ' . $count . '</p>';
                        
                        // Check if prime
                        if ($count == 2 && $divisors[0] == 1 && $divisors[1] == $n) {
                            echo '<p style="color: blue;"><strong>' . $n . ' là số nguyên tố!</strong></p>';
                        }
                        echo '</div>';
                        echo '</div>';
                    }
                    ?>
                </div>
            </div>

            <!-- Exercise 8 -->
            <div id="ex8" class="tab-content<?php echo ($current_tab == 'ex8') ? '' : ' hidden'; ?>">
                <h2>Bài 8: Mảng 10 phần tử - Đếm số âm, số dương</h2>
                <div class="exercise-form">
                    <form method="post">
                        <input type="hidden" name="exercise" value="ex8">
                        <input type="hidden" name="current_tab" value="ex8">
                        <div class="form-group">
                            <label for="array_elements">Nhập 10 số nguyên (cách nhau bằng dấu phẩy):</label>
                            <input type="text" id="array_elements" name="array_elements" placeholder="VD: -5,3,0,-2,7,1,-8,4,0,9" value="<?php echo isset($_POST['array_elements']) && $_POST['exercise'] == 'ex8' ? $_POST['array_elements'] : ''; ?>" required>
                        </div>
                        <button type="submit" class="btn">Phân tích mảng</button>
                    </form>
                    
                    <?php
                    if (isset($_POST['exercise']) && $_POST['exercise'] == 'ex8' && isset($_POST['array_elements'])) {
                        $input = $_POST['array_elements'];
                        $elements = explode(',', $input);
                        
                        // Ensure we have exactly 10 elements
                        $elements = array_slice(array_map('intval', array_map('trim', $elements)), 0, 10);
                        
                        $positive = array();
                        $negative = array();
                        $zero = array();
                        
                        foreach ($elements as $index => $element) {
                            if ($element > 0) {
                                $positive[] = array('value' => $element, 'index' => $index);
                            } elseif ($element < 0) {
                                $negative[] = array('value' => $element, 'index' => $index);
                            } else {
                                $zero[] = array('value' => $element, 'index' => $index);
                            }
                        }
                        
                        echo '<div class="result">';
                        echo '<h3>Kết quả:</h3>';
                        echo '<div class="result-content">';
                        echo '<p><strong>Mảng đã nhập:</strong> [' . implode(', ', $elements) . ']</p>';
                        echo '<p><strong>Số phần tử:</strong> ' . count($elements) . '</p>';
                        
                        echo '<p><strong>Số dương (' . count($positive) . ' phần tử):</strong> ';
                        if (count($positive) > 0) {
                            $pos_values = array_map(function($item) { return $item['value']; }, $positive);
                            echo implode(', ', $pos_values);
                        } else {
                            echo 'Không có';
                        }
                        echo '</p>';
                        
                        echo '<p><strong>Số âm (' . count($negative) . ' phần tử):</strong> ';
                        if (count($negative) > 0) {
                            $neg_values = array_map(function($item) { return $item['value']; }, $negative);
                            echo implode(', ', $neg_values);
                        } else {
                            echo 'Không có';
                        }
                        echo '</p>';
                        
                        echo '<p><strong>Số 0 (' . count($zero) . ' phần tử):</strong> ';
                        if (count($zero) > 0) {
                            echo count($zero) . ' phần tử';
                        } else {
                            echo 'Không có';
                        }
                        echo '</p>';
                        
                        if (count($elements) < 10) {
                            echo '<p style="color: orange;"><em>Lưu ý: Bạn đã nhập ' . count($elements) . ' phần tử thay vì 10 phần tử.</em></p>';
                        }
                        echo '</div>';
                        echo '</div>';
                    }
                    ?>
                </div>
            </div>

            <!-- Exercise 9 -->
            <div id="ex9" class="tab-content<?php echo ($current_tab == 'ex9') ? '' : ' hidden'; ?>">
                <h2>Bài 9: Chuyển đổi giây sang giờ:phút:giây</h2>
                <div class="exercise-form">
                    <form method="post">
                        <input type="hidden" name="exercise" value="ex9">
                        <input type="hidden" name="current_tab" value="ex9">
                        <div class="form-group">
                            <label for="seconds">Nhập số giây:</label>
                            <input type="number" id="seconds" name="seconds" min="0" value="<?php echo isset($_POST['seconds']) && $_POST['exercise'] == 'ex9' ? $_POST['seconds'] : ''; ?>" required>
                        </div>
                        <button type="submit" class="btn">Chuyển đổi</button>
                    </form>
                    
                    <?php
                    if (isset($_POST['exercise']) && $_POST['exercise'] == 'ex9' && isset($_POST['seconds'])) {
                        $totalSeconds = (int)$_POST['seconds'];
                        
                        function convertSeconds($seconds) {
                            $hours = floor($seconds / 3600);
                            $remaining = $seconds % 3600;
                            $minutes = floor($remaining / 60);
                            $secs = $remaining % 60;
                            
                            return array(
                                'hours' => $hours,
                                'minutes' => $minutes,
                                'seconds' => $secs,
                                'formatted' => sprintf('%02d:%02d:%02d', $hours, $minutes, $secs)
                            );
                        }
                        
                        $result = convertSeconds($totalSeconds);
                        
                        echo '<div class="result">';
                        echo '<h3>Kết quả:</h3>';
                        echo '<div class="result-content">';
                        echo '<p><strong>Số giây nhập vào:</strong> ' . number_format($totalSeconds) . ' giây</p>';
                        echo '<p><strong>Chuyển đổi:</strong></p>';
                        echo '<ul>';
                        echo '<li>Giờ: ' . $result['hours'] . '</li>';
                        echo '<li>Phút: ' . $result['minutes'] . '</li>';
                        echo '<li>Giây: ' . $result['seconds'] . '</li>';
                        echo '</ul>';
                        echo '<p><strong>Định dạng: ' . $result['formatted'] . '</strong></p>';
                        
                        // Some examples
                        if ($totalSeconds == 3769) {
                            echo '<p style="color: green;"><em>✓ Ví dụ trong đề bài: 3769 giây = 01:02:49</em></p>';
                        }
                        echo '</div>';
                        echo '</div>';
                    }
                    ?>
                </div>
            </div>

            <!-- Exercise 10 -->
            <div id="ex10" class="tab-content<?php echo ($current_tab == 'ex10') ? '' : ' hidden'; ?>">
                <h2>Bài 10: Class PERSON và SINHVIEN</h2>
                <div class="exercise-form">
                    <form method="post">
                        <input type="hidden" name="exercise" value="ex10">
                        <input type="hidden" name="current_tab" value="ex10">
                        <div class="form-group">
                            <label for="name">Họ tên:</label>
                            <input type="text" id="name" name="name" value="<?php echo isset($_POST['name']) && $_POST['exercise'] == 'ex10' ? $_POST['name'] : ''; ?>" required>
                        </div>
                        <div class="form-group">
                            <label for="dob">Ngày sinh:</label>
                            <input type="date" id="dob" name="dob" value="<?php echo isset($_POST['dob']) && $_POST['exercise'] == 'ex10' ? $_POST['dob'] : ''; ?>" required>
                        </div>
                        <div class="form-group">
                            <label for="hometown">Quê quán:</label>
                            <input type="text" id="hometown" name="hometown" value="<?php echo isset($_POST['hometown']) && $_POST['exercise'] == 'ex10' ? $_POST['hometown'] : ''; ?>" required>
                        </div>
                        <div class="form-group">
                            <label for="class">Lớp:</label>
                            <input type="text" id="class" name="class" value="<?php echo isset($_POST['class']) && $_POST['exercise'] == 'ex10' ? $_POST['class'] : ''; ?>" required>
                        </div>
                        <button type="submit" class="btn">Tạo thông tin sinh viên</button>
                    </form>
                    
                    <?php
                    if (isset($_POST['exercise']) && $_POST['exercise'] == 'ex10' && 
                        isset($_POST['name']) && isset($_POST['dob']) && isset($_POST['hometown']) && isset($_POST['class'])) {
                        
                        class Person {
                            protected $name;
                            protected $dateOfBirth;
                            protected $hometown;
                            
                            public function __construct($name, $dateOfBirth, $hometown) {
                                $this->name = $name;
                                $this->dateOfBirth = $dateOfBirth;
                                $this->hometown = $hometown;
                            }
                            
                            public function getName() {
                                return $this->name;
                            }
                            
                            public function getDateOfBirth() {
                                return $this->dateOfBirth;
                            }
                            
                            public function getHometown() {
                                return $this->hometown;
                            }
                            
                            public function getAge() {
                                $today = new DateTime();
                                $dob = new DateTime($this->dateOfBirth);
                                return $today->diff($dob)->y;
                            }
                            
                            public function displayInfo() {
                                return "Họ tên: " . $this->name . "<br>" .
                                       "Ngày sinh: " . date('d/m/Y', strtotime($this->dateOfBirth)) . "<br>" .
                                       "Tuổi: " . $this->getAge() . "<br>" .
                                       "Quê quán: " . $this->hometown;
                            }
                        }
                        
                        class SinhVien extends Person {
                            private $class;
                            
                            public function __construct($name, $dateOfBirth, $hometown, $class) {
                                parent::__construct($name, $dateOfBirth, $hometown);
                                $this->class = $class;
                            }
                            
                            public function getClass() {
                                return $this->class;
                            }
                            
                            public function displayInfo() {
                                return parent::displayInfo() . "<br>" .
                                       "Lớp: " . $this->class;
                            }
                            
                            public function displayStudentCard() {
                                return '
                                <div style="border: 2px solid #4CAF50; padding: 20px; margin: 10px 0; border-radius: 10px; background: #f9f9f9;">
                                    <h4 style="color: #4CAF50; text-align: center; margin-bottom: 15px;">THÔNG TIN CÁ NHÂN SINH VIÊN</h4>
                                    <div style="line-height: 1.8;">
                                        ' . $this->displayInfo() . '
                                    </div>
                                </div>';
                            }
                        }
                        
                        $student = new SinhVien($_POST['name'], $_POST['dob'], $_POST['hometown'], $_POST['class']);
                        
                        echo '<div class="result">';
                        echo '<h3>Kết quả:</h3>';
                        echo '<div class="result-content">';
                        echo $student->displayStudentCard();
                        echo '</div>';
                        echo '</div>';
                    }
                    ?>
                </div>
            </div>

            <!-- Exercise 11 -->
            <div id="ex11" class="tab-content<?php echo ($current_tab == 'ex11') ? '' : ' hidden'; ?>">
                <h2>Bài 11: Tạo form giao diện đăng ký/đăng nhập</h2>
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 30px; margin-top: 20px;">
                    
                    <!-- Login Form -->
                    <div class="exercise-form">
                        <h3 style="text-align: center; margin-bottom: 20px;">
                            <span style="background: #3b5998; color: white; padding: 10px 20px; border-radius: 5px;">
                                📘 Login with Facebook
                            </span>
                        </h3>
                        <h4 style="margin-bottom: 20px;">Login</h4>
                        <form method="post">
                            <input type="hidden" name="exercise" value="ex11_login">
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" id="username" name="username" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" id="password" name="password" required>
                            </div>
                            <div class="form-group">
                                <label>
                                    <input type="checkbox" name="remember"> Remember Me
                                </label>
                            </div>
                            <button type="submit" class="btn">Log in</button>
                        </form>
                    </div>
                    
                    <!-- Signup Form -->
                    <div class="exercise-form">
                        <h4 style="margin-bottom: 20px;">Signup for New Account?</h4>
                        <form method="post">
                            <input type="hidden" name="exercise" value="ex11_signup">
                            <div class="form-group">
                                <label for="user_name">User Name</label>
                                <input type="text" id="user_name" name="user_name" required>
                            </div>
                            <div class="form-group">
                                <label for="user_email">User Email *</label>
                                <input type="email" id="user_email" name="user_email" required>
                            </div>
                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
                                <div class="form-group">
                                    <label for="title">Select Title</label>
                                    <select id="title" name="title">
                                        <option value="mr">Mr.</option>
                                        <option value="mrs">Mrs.</option>
                                        <option value="ms">Ms.</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="full_name">Full name * 2024 letters...</label>
                                    <input type="text" id="full_name" name="full_name" required>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <h5>Company detail</h5>
                                <p style="font-size: 12px; color: #666;">Provide detail about your company</p>
                                <label for="company_name">Company name</label>
                                <input type="text" id="company_name" name="company_name">
                            </div>
                            
                            <div class="form-group">
                                <label>
                                    <input type="checkbox" name="agree" required> I am agree with registration
                                </label>
                            </div>
                            
                            <button type="submit" class="btn" style="background: #5cb85c;">Register</button>
                        </form>
                    </div>
                </div>
                
                <?php
                if (isset($_POST['exercise'])) {
                    if ($_POST['exercise'] == 'ex11_login' && isset($_POST['username']) && isset($_POST['password'])) {
                        echo '<div class="result">';
                        echo '<h3>Kết quả Đăng nhập:</h3>';
                        echo '<div class="result-content">';
                        echo '<p><strong>Username:</strong> ' . htmlspecialchars($_POST['username']) . '</p>';
                        echo '<p><strong>Password:</strong> ' . str_repeat('*', strlen($_POST['password'])) . '</p>';
                        echo '<p><strong>Remember Me:</strong> ' . (isset($_POST['remember']) ? 'Có' : 'Không') . '</p>';
                        echo '<p style="color: green;">✓ Đăng nhập thành công!</p>';
                        echo '</div>';
                        echo '</div>';
                    }
                    
                    if ($_POST['exercise'] == 'ex11_signup' && isset($_POST['user_name']) && isset($_POST['user_email'])) {
                        echo '<div class="result">';
                        echo '<h3>Kết quả Đăng ký:</h3>';
                        echo '<div class="result-content">';
                        echo '<p><strong>User Name:</strong> ' . htmlspecialchars($_POST['user_name']) . '</p>';
                        echo '<p><strong>Email:</strong> ' . htmlspecialchars($_POST['user_email']) . '</p>';
                        echo '<p><strong>Title:</strong> ' . htmlspecialchars($_POST['title']) . '</p>';
                        echo '<p><strong>Full Name:</strong> ' . htmlspecialchars($_POST['full_name']) . '</p>';
                        echo '<p><strong>Company:</strong> ' . htmlspecialchars($_POST['company_name']) . '</p>';
                        echo '<p><strong>Agreed to terms:</strong> ' . (isset($_POST['agree']) ? 'Có' : 'Không') . '</p>';
                        echo '<p style="color: green;">✓ Đăng ký thành công!</p>';
                        echo '</div>';
                        echo '</div>';
                    }
                }
                ?>
            </div>
            </div>
        </div>
    </div>

    <script>
        // Function to show tab and update URL
        function showTab(tabName) {
            // Hide all tabs
            const tabs = document.querySelectorAll('.tab-content');
            tabs.forEach(tab => {
                tab.classList.add('hidden');
            });
            
            // Remove active class from all nav tabs
            const navTabs = document.querySelectorAll('.nav-tab');
            navTabs.forEach(tab => {
                tab.classList.remove('active');
            });
            
            // Show selected tab
            document.getElementById(tabName).classList.remove('hidden');
            
            // Add active class to clicked nav tab
            event.target.classList.add('active');
            
            // Update URL without reloading page
            const url = new URL(window.location);
            url.searchParams.set('tab', tabName);
            window.history.pushState({}, '', url);
        }
        
        // Function to get current tab from URL or form submission
        function getCurrentTab() {
            const urlParams = new URLSearchParams(window.location.search);
            const tabFromUrl = urlParams.get('tab');
            
            // Check if there's a form submission that specifies a tab
            <?php if (isset($_POST['current_tab'])): ?>
                return '<?php echo $_POST['current_tab']; ?>';
            <?php endif; ?>
            
            // If there's a POST request but no current_tab, try to determine from exercise
            <?php if (isset($_POST['exercise'])): ?>
                <?php 
                $exerciseToTab = array(
                    'ex1' => 'ex1',
                    'ex2a' => 'ex2a', 
                    'ex2b' => 'ex2b',
                    'ex3' => 'ex3',
                    'ex4' => 'ex4',
                    'ex5' => 'ex5',
                    'ex6' => 'ex6',
                    'ex7' => 'ex7',
                    'ex8' => 'ex8',
                    'ex9' => 'ex9',
                    'ex10' => 'ex10',
                    'ex11_login' => 'ex11',
                    'ex11_signup' => 'ex11'
                );
                if (isset($exerciseToTab[$_POST['exercise']])) {
                    echo "return '{$exerciseToTab[$_POST['exercise']]}';";
                }
                ?>
            <?php endif; ?>
            
            return tabFromUrl || 'home';
        }
        
        // Initialize page with correct tab
        document.addEventListener('DOMContentLoaded', function() {
            const currentTab = getCurrentTab();
            
            // Hide all tabs first
            const tabs = document.querySelectorAll('.tab-content');
            tabs.forEach(tab => {
                tab.classList.add('hidden');
            });
            
            // Remove active class from all nav tabs
            const navTabs = document.querySelectorAll('.nav-tab');
            navTabs.forEach(tab => {
                tab.classList.remove('active');
            });
            
            // Show current tab
            const targetTab = document.getElementById(currentTab);
            if (targetTab) {
                targetTab.classList.remove('hidden');
            }
            
            // Add active class to corresponding nav tab
            const navTab = document.querySelector(`[onclick="showTab('${currentTab}')"]`);
            if (navTab) {
                navTab.classList.add('active');
            }
            
            // Auto-generate random array for exercise 8
            const generateBtn = document.createElement('button');
            generateBtn.type = 'button';
            generateBtn.className = 'btn';
            generateBtn.textContent = 'Tạo mảng ngẫu nhiên';
            generateBtn.style.marginLeft = '10px';
            generateBtn.onclick = function() {
                const randomArray = [];
                for (let i = 0; i < 10; i++) {
                    randomArray.push(Math.floor(Math.random() * 21) - 10); // Random from -10 to 10
                }
                document.getElementById('array_elements').value = randomArray.join(', ');
            };
            
            const arrayInput = document.getElementById('array_elements');
            if (arrayInput) {
                arrayInput.parentNode.appendChild(generateBtn);
            }
        });
        
        // Update all form submissions to include current tab
        document.addEventListener('DOMContentLoaded', function() {
            const forms = document.querySelectorAll('form');
            forms.forEach(form => {
                form.addEventListener('submit', function() {
                    // Get current active tab
                    const activeTab = document.querySelector('.tab-content:not(.hidden)');
                    if (activeTab) {
                        let currentTabInput = form.querySelector('input[name="current_tab"]');
                        if (!currentTabInput) {
                            currentTabInput = document.createElement('input');
                            currentTabInput.type = 'hidden';
                            currentTabInput.name = 'current_tab';
                            form.appendChild(currentTabInput);
                        }
                        currentTabInput.value = activeTab.id;
                    }
                });
            });
        });
    </script>
</body>
</html>