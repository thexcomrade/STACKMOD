HTML = r<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>NumPy Learning Hub</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            scroll-behavior: smooth;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #0b1120;
            color: #e5e7eb;
            line-height: 1.6;
        }

        /* =========================
           SIDEBAR
        ========================= */

        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 250px;
            height: 100vh;
            background: #111827;
            border-right: 1px solid #263244;
            padding: 25px 18px;
            overflow-y: auto;
            z-index: 1000;
        }

        .logo {
            font-size: 26px;
            font-weight: bold;
            color: #60a5fa;
            margin-bottom: 5px;
        }

        .logo span {
            color: #facc15;
        }

        .logo-text {
            font-size: 12px;
            color: #94a3b8;
            margin-bottom: 30px;
        }

        .sidebar h3 {
            font-size: 12px;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin: 20px 10px 10px;
        }

        .sidebar a {
            display: block;
            color: #cbd5e1;
            text-decoration: none;
            padding: 9px 12px;
            margin: 3px 0;
            border-radius: 8px;
            font-size: 14px;
            transition: 0.2s;
        }

        .sidebar a:hover {
            background: #1e293b;
            color: #60a5fa;
            transform: translateX(3px);
        }

        /* =========================
           MAIN
        ========================= */

        .main {
            margin-left: 250px;
            padding: 40px;
        }

        .container {
            max-width: 1200px;
            margin: auto;
        }

        /* =========================
           HERO
        ========================= */

        .hero {
            background:
                radial-gradient(circle at top right, #1d4ed8, transparent 35%),
                linear-gradient(135deg, #111827, #172554);
            border: 1px solid #263244;
            border-radius: 24px;
            padding: 60px 50px;
            margin-bottom: 35px;
            overflow: hidden;
        }

        .badge {
            display: inline-block;
            background: #1e3a8a;
            color: #93c5fd;
            padding: 7px 14px;
            border-radius: 30px;
            font-size: 13px;
            margin-bottom: 20px;
        }

        .hero h1 {
            font-size: 52px;
            line-height: 1.1;
            margin-bottom: 18px;
            color: white;
        }

        .hero h1 span {
            color: #60a5fa;
        }

        .hero p {
            max-width: 750px;
            color: #cbd5e1;
            font-size: 17px;
            margin-bottom: 25px;
        }

        .hero-buttons {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-block;
            text-decoration: none;
            padding: 12px 20px;
            border-radius: 10px;
            font-weight: bold;
            font-size: 14px;
        }

        .btn-primary {
            background: #2563eb;
            color: white;
        }

        .btn-secondary {
            background: #1e293b;
            color: #cbd5e1;
            border: 1px solid #334155;
        }

        /* =========================
           SEARCH
        ========================= */

        .search-box {
            margin-bottom: 30px;
        }

        .search-box input {
            width: 100%;
            padding: 15px 18px;
            border-radius: 12px;
            border: 1px solid #334155;
            background: #111827;
            color: white;
            outline: none;
            font-size: 15px;
        }

        .search-box input:focus {
            border-color: #3b82f6;
        }

        /* =========================
           SECTION
        ========================= */

        .section-title {
            margin: 50px 0 20px;
        }

        .section-title h2 {
            font-size: 30px;
            color: white;
        }

        .section-title p {
            color: #94a3b8;
            margin-top: 5px;
        }

        /* =========================
           TOPIC GRID
        ========================= */

        .topic-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 15px;
        }

        .topic-card {
            background: #111827;
            border: 1px solid #263244;
            border-radius: 14px;
            padding: 20px;
            transition: 0.25s;
        }

        .topic-card:hover {
            transform: translateY(-5px);
            border-color: #3b82f6;
            background: #172033;
        }

        .topic-number {
            font-size: 12px;
            color: #60a5fa;
            margin-bottom: 8px;
        }

        .topic-card h3 {
            font-size: 16px;
            color: white;
        }

        /* =========================
           TASK CARDS
        ========================= */

        .task {
            background: #111827;
            border: 1px solid #263244;
            border-radius: 18px;
            padding: 28px;
            margin-bottom: 25px;
            scroll-margin-top: 30px;
        }

        .task:hover {
            border-color: #334155;
        }

        .task-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .task-title {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .task-title h2 {
            color: white;
            font-size: 22px;
        }

        .task-icon {
            width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            background: #1e3a8a;
            font-size: 20px;
        }

        .level {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        .green {
            background: #064e3b;
            color: #6ee7b7;
        }

        .yellow {
            background: #713f12;
            color: #fde68a;
        }

        .orange {
            background: #7c2d12;
            color: #fdba74;
        }

        .red {
            background: #7f1d1d;
            color: #fca5a5;
        }

        .task p {
            color: #cbd5e1;
            margin-bottom: 15px;
        }

        .task ul {
            margin: 10px 0 20px 22px;
            color: #cbd5e1;
        }

        .task li {
            margin: 5px 0;
        }

        /* =========================
           CODE
        ========================= */

        .code-wrapper {
            position: relative;
            margin-top: 15px;
        }

        pre {
            background: #020617;
            border: 1px solid #1e293b;
            border-radius: 12px;
            padding: 22px;
            overflow-x: auto;
            color: #dbeafe;
            font-family: Consolas, "Courier New", monospace;
            font-size: 14px;
            line-height: 1.7;
        }

        code {
            font-family: Consolas, "Courier New", monospace;
        }

        .copy-btn {
            position: absolute;
            right: 12px;
            top: 12px;
            border: 1px solid #334155;
            background: #1e293b;
            color: #cbd5e1;
            padding: 7px 11px;
            border-radius: 7px;
            cursor: pointer;
            font-size: 12px;
        }

        .copy-btn:hover {
            background: #334155;
            color: white;
        }

        /* =========================
           INFO BOX
        ========================= */

        .info-box {
            background: #172554;
            border: 1px solid #1e40af;
            padding: 18px;
            border-radius: 12px;
            margin: 15px 0;
            color: #bfdbfe;
        }

        .tip-box {
            background: #422006;
            border: 1px solid #92400e;
            padding: 18px;
            border-radius: 12px;
            margin-top: 15px;
            color: #fed7aa;
        }

        /* =========================
           FINAL WORK
        ========================= */

        .final {
            background:
                linear-gradient(135deg, #172554, #111827);
            border: 1px solid #2563eb;
        }

        .final h2 {
            color: #93c5fd;
        }

        .final-label {
            display: inline-block;
            background: #2563eb;
            color: white;
            padding: 7px 12px;
            border-radius: 8px;
            font-size: 12px;
            font-weight: bold;
            margin-bottom: 12px;
        }

        /* =========================
           CHALLENGE
        ========================= */

        .challenge {
            background:
                linear-gradient(135deg, #3f1d0b, #111827);
            border: 1px solid #ea580c;
        }

        .challenge h2 {
            color: #fdba74;
        }

        /* =========================
           FOOTER
        ========================= */

        footer {
            text-align: center;
            color: #64748b;
            padding: 50px 20px 20px;
            font-size: 13px;
        }

        /* =========================
           RESPONSIVE
        ========================= */

        @media (max-width: 850px) {

            .sidebar {
                position: static;
                width: 100%;
                height: auto;
                border-right: none;
                border-bottom: 1px solid #263244;
            }

            .sidebar a {
                display: inline-block;
            }

            .main {
                margin-left: 0;
                padding: 20px;
            }

            .hero {
                padding: 35px 25px;
            }

            .hero h1 {
                font-size: 38px;
            }
        }

        @media (max-width: 500px) {

            .main {
                padding: 15px;
            }

            .hero h1 {
                font-size: 32px;
            }

            .task {
                padding: 20px;
            }

            pre {
                font-size: 12px;
                padding: 15px;
            }
        }
    </style>
</head>

<body>

<!-- =========================
     SIDEBAR
========================= -->

<aside class="sidebar">

    <div class="logo">Num<span>Py</span></div>

    <div class="logo-text">
        Learning Hub
    </div>

    <h3>Basics</h3>

    <a href="#topics">Topics</a>
    <a href="#task1">Task 1</a>
    <a href="#task2">Task 2</a>
    <a href="#task3">Task 3</a>
    <a href="#task4">Task 4</a>

    <h3>Intermediate</h3>

    <a href="#task5">Task 5</a>
    <a href="#task6">Task 6</a>
    <a href="#task7">Task 7</a>
    <a href="#task8">Task 8</a>
    <a href="#task9">Task 9</a>
    <a href="#task10">Task 10</a>
    <a href="#task11">Task 11</a>

    <h3>Advanced Practice</h3>

    <a href="#final">Final Work</a>
    <a href="#challenge">Challenge</a>

</aside>


<!-- =========================
     MAIN CONTENT
========================= -->

<main class="main">

<div class="container">

    <!-- HERO -->

    <section class="hero">

        <span class="badge">🐍 Python • NumPy</span>

        <h1>
            Master <span>NumPy</span><br>
            One Task at a Time.
        </h1>

        <p>
            A complete hands-on NumPy practice guide covering
            arrays, indexing, slicing, mathematical operations,
            array-to-array operations and transpose.
        </p>

        <div class="hero-buttons">

            <a href="#topics" class="btn btn-primary">
                Start Learning →
            </a>

            <a href="#final" class="btn btn-secondary">
                Final Project
            </a>

        </div>

    </section>


    <!-- SEARCH -->

    <div class="search-box">

        <input
            type="text"
            id="search"
            placeholder="🔍 Search NumPy topics or tasks..."
        >

    </div>


    <!-- TOPICS -->

    <section id="topics">

        <div class="section-title">

            <h2>NumPy Topics</h2>

            <p>
                Core concepts you will practice throughout the tasks.
            </p>

        </div>

        <div class="topic-grid">

            <div class="topic-card">
                <div class="topic-number">01</div>
                <h3>NumPy Import</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">02</div>
                <h3>Array Creation</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">03</div>
                <h3>1D Array</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">04</div>
                <h3>2D Array</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">05</div>
                <h3>arange()</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">06</div>
                <h3>zeros()</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">07</div>
                <h3>ones()</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">08</div>
                <h3>full()</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">09</div>
                <h3>linspace()</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">10</div>
                <h3>dtype</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">11</div>
                <h3>ndim</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">12</div>
                <h3>shape</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">13</div>
                <h3>size</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">14</div>
                <h3>Indexing</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">15</div>
                <h3>Negative Indexing</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">16</div>
                <h3>Slicing</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">17</div>
                <h3>2D Indexing</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">18</div>
                <h3>2D Slicing</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">19</div>
                <h3>Math Operations</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">20</div>
                <h3>Array Operations</h3>
            </div>

            <div class="topic-card">
                <div class="topic-number">21</div>
                <h3>Transpose</h3>
            </div>

        </div>

    </section>


    <!-- TASK 1 -->

    <section class="task" id="task1">

        <div class="task-header">

            <div class="task-title">

                <div class="task-icon">🟢</div>

                <h2>Task 1 — Create a 1D Array</h2>

            </div>

            <span class="level green">BEGINNER</span>

        </div>

        <p>
            Create a NumPy array containing student marks and display
            its basic information.
        </p>

        <ul>
            <li>Display the array</li>
            <li>Display dimension</li>
            <li>Display shape</li>
            <li>Display size</li>
            <li>Display data type</li>
        </ul>

        <div class="code-wrapper">

            <button class="copy-btn">Copy</button>

<pre><code>import numpy as np

marks = np.array([45, 67, 89, 72, 56, 91, 38, 76])

print("Array:", marks)
print("Dimension:", marks.ndim)
print("Shape:", marks.shape)
print("Size:", marks.size)
print("Data type:", marks.dtype)</code></pre>

        </div>

    </section>


    <!-- TASK 2 -->

    <section class="task" id="task2">

        <div class="task-header">

            <div class="task-title">

                <div class="task-icon">🟢</div>

                <h2>Task 2 — Array Creation Methods</h2>

            </div>

            <span class="level green">BEGINNER</span>

        </div>

        <p>
            Practice different NumPy methods for creating arrays.
        </p>

        <div class="code-wrapper">

            <button class="copy-btn">Copy</button>

<pre><code>import numpy as np

print("5 zeros:", np.zeros(5))

print("6 ones:", np.ones(6))

print("10 repeated values of 25:")
print(np.full(10, 25))

print("Numbers from 10 to 50:")
print(np.arange(10, 51))

print("Numbers from 2 to 20:")
print(np.arange(2, 21, 2))

print("5 equally spaced values:")
print(np.linspace(0, 1, 5))</code></pre>

        </div>

    </section>


    <!-- TASK 3 -->

    <section class="task" id="task3">

        <div class="task-header">

            <div class="task-title">

                <div class="task-icon">🟢</div>

                <h2>Task 3 — Student Marks</h2>

            </div>

            <span class="level green">BEGINNER</span>

        </div>

        <p>
            Practice normal indexing, negative indexing and slicing.
        </p>

        <div class="code-wrapper">

            <button class="copy-btn">Copy</button>

<pre><code>import numpy as np

marks = np.array([78, 65, 89, 92, 56, 74, 81, 69])

print("First mark:", marks[0])
print("Last mark:", marks[-1])
print("Third mark:", marks[2])
print("Second-last mark:", marks[-2])

print("First three marks:", marks[:3])
print("Last four marks:", marks[-4:])

print("Marks from index 2 to 5:")
print(marks[2:6])

print("Reverse:")
print(marks[::-1])</code></pre>

        </div>

    </section>


    <!-- TASK 4 -->

    <section class="task" id="task4">

        <div class="task-header">

            <div class="task-title">

                <div class="task-icon">🟡</div>

                <h2>Task 4 — Negative Indexing</h2>

            </div>

            <span class="level yellow">EASY</span>

        </div>

        <div class="code-wrapper">

            <button class="copy-btn">Copy</button>

<pre><code>import numpy as np

numbers = np.array([10, 20, 30, 40, 50, 60, 70])

print("Last:", numbers[-1])
print("Second-last:", numbers[-2])
print("Third-last:", numbers[-3])

print("Last 3:")
print(numbers[-3:])

print("Reverse:")
print(numbers[::-1])</code></pre>

        </div>

    </section>


    <!-- TASK 5 -->

    <section class="task" id="task5">

        <div class="task-header">

            <div class="task-title">

                <div class="task-icon">🟡</div>

                <h2>Task 5 — 2D Array Creation</h2>

            </div>

            <span class="level yellow">EASY</span>

        </div>

        <div class="code-wrapper">

            <button class="copy-btn">Copy</button>

<pre><code>import numpy as np

arr = np.array([
    [10, 20, 30],
    [40, 50, 60],
    [70, 80, 90]
])

print(arr)

print("Dimension:", arr.ndim)
print("Shape:", arr.shape)
print("Size:", arr.size)
print("Data type:", arr.dtype)</code></pre>

        </div>

    </section>


    <!-- TASK 6 -->

    <section class="task" id="task6">

        <div class="task-header">

            <div class="task-title">

                <div class="task-icon">🟡</div>

                <h2>Task 6 — 2D Array Indexing</h2>

            </div>

            <span class="level yellow">EASY</span>

        </div>

        <div class="code-wrapper">

            <button class="copy-btn">Copy</button>

<pre><code>import numpy as np

arr = np.array([
    [10, 20, 30],
    [40, 50, 60],
    [70, 80, 90]
])

print("10:", arr[0, 0])
print("50:", arr[1, 1])
print("90:", arr[2, 2])
print("30:", arr[0, 2])
print("70:", arr[2, 0])

print("First row:", arr[0])
print("Second row:", arr[1])
print("Third row:", arr[2])

print("First column:", arr[:, 0])
print("Last column:", arr[:, -1])</code></pre>

        </div>

    </section>


    <!-- TASK 7 -->

    <section class="task" id="task7">

        <div class="task-header">

            <div class="task-title">

                <div class="task-icon">🟡</div>

                <h2>Task 7 — 2D Array Slicing</h2>

            </div>

            <span class="level yellow">EASY</span>

        </div>

        <div class="code-wrapper">

            <button class="copy-btn">Copy</button>

<pre><code>import numpy as np

arr = np.array([
    [10, 20, 30, 40],
    [50, 60, 70, 80],
    [90, 100, 110, 120]
])

print("First two rows:")
print(arr[:2])

print("Last two rows:")
print(arr[-2:])

print("First two columns:")
print(arr[:, :2])

print("Last two columns:")
print(arr[:, -2:])

print("First two rows and columns:")
print(arr[:2, :2])

print("Second and third columns:")
print(arr[:, 1:3])

print("First and third rows:")
print(arr[::2])</code></pre>

        </div>

    </section>


    <!-- TASK 8 -->

    <section class="task" id="task8">

        <div class="task-header">

            <div class="task-title">

                <div class="task-icon">🟠</div>

                <h2>Task 8 — Mathematical Operations</h2>

            </div>

            <span class="level orange">INTERMEDIATE</span>

        </div>

        <div class="code-wrapper">

            <button class="copy-btn">Copy</button>

<pre><code>import numpy as np

A = np.array([10, 20, 30, 40, 50])

print("Add 5:", A + 5)
print("Subtract 5:", A - 5)
print("Multiply by 2:", A * 2)
print("Divide by 10:", A / 10)
print("Square:", A ** 2)</code></pre>

        </div>

    </section>


    <!-- TASK 9 -->

    <section class="task" id="task9">

        <div class="task-header">

            <div class="task-title">

                <div class="task-icon">🟠</div>

                <h2>Task 9 — Array-to-Array Operations</h2>

            </div>

            <span class="level orange">INTERMEDIATE</span>

        </div>

        <div class="code-wrapper">

            <button class="copy-btn">Copy</button>

<pre><code>import numpy as np

A = np.array([10, 20, 30, 40, 50])
B = np.array([5, 10, 15, 20, 25])

print("A + B:", A + B)
print("A - B:", A - B)
print("A * B:", A * B)
print("A / B:", A / B)


# 2D Arrays

A = np.array([
    [10, 20],
    [30, 40]
])

B = np.array([
    [1, 2],
    [3, 4]
])

print("2D A + B:")
print(A + B)

print("2D A - B:")
print(A - B)

print("2D A * B:")
print(A * B)

print("2D A / B:")
print(A / B)</code></pre>

        </div>

    </section>


    <!-- TASK 10 -->

    <section class="task" id="task10">

        <div class="task-header">

            <div class="task-title">

                <div class="task-icon">🟠</div>

                <h2>Task 10 — Student Marks Analysis</h2>

            </div>

            <span class="level orange">INTERMEDIATE</span>

        </div>

        <div class="info-box">

            Each row represents one student.
            Each column represents one subject.

        </div>

        <div class="code-wrapper">

            <button class="copy-btn">Copy</button>

<pre><code>import numpy as np

students = np.array([
    [80, 75, 90],
    [65, 70, 85],
    [90, 88, 95],
    [55, 60, 70]
])

print("First student:", students[0])
print("Third student:", students[2])

print("First subject:")
print(students[:, 0])

print("Last subject:")
print(students[:, -1])

print("Second student's second subject:")
print(students[1, 1])

print("First two students:")
print(students[:2])

print("Last two students:")
print(students[-2:])</code></pre>

        </div>

    </section>


    <!-- TASK 11 -->

    <section class="task" id="task11">

        <div class="task-header">

            <div class="task-title">

                <div class="task-icon">🔴</div>

                <h2>Task 11 — Transpose</h2>

            </div>

            <span class="level red">ADVANCED</span>

        </div>

        <div class="code-wrapper">

            <button class="copy-btn">Copy</button>

<pre><code>import numpy as np

A = np.array([
    [10, 20, 30],
    [40, 50, 60]
])

print("Original array:")
print(A)

print("Transpose:")
print(A.T)

print("Original shape:", A.shape)
print("Transposed shape:", A.T.shape)

print("Original dimensions:", A.ndim)
print("Transposed dimensions:", A.T.ndim)</code></pre>

        </div>

    </section>


    <!-- FINAL WORK -->

    <section class="task final" id="final">

        <span class="final-label">
            🔥 FINAL WORK
        </span>

        <div class="task-header">

            <div class="task-title">

                <div class="task-icon">🎓</div>

                <h2>Student Result Analysis</h2>

            </div>

        </div>

        <p>
            A complete NumPy exercise combining array information,
            indexing, slicing, mathematical operations and transpose.
        </p>

        <div class="code-wrapper">

            <button class="copy-btn">Copy</button>

<pre><code>import numpy as np

result = np.array([
    [101, 80, 75, 90],
    [102, 65, 70, 85],
    [103, 90, 88, 95],
    [104, 55, 60, 70],
    [105, 78, 82, 80]
])


# =========================
# A. ARRAY INFORMATION
# =========================

print("Array:")
print(result)

print("ndim:", result.ndim)
print("shape:", result.shape)
print("size:", result.size)
print("dtype:", result.dtype)


# =========================
# B. INDEXING
# =========================

print("ID of first student:")
print(result[0, 0])

print("Python mark of student 103:")
print(result[2, 1])

print("Power BI mark of student 105:")
print(result[4, 3])

print("All Python marks:")
print(result[:, 1])

print("All Power BI marks:")
print(result[:, 3])


# =========================
# C. SLICING
# =========================

print("First three students:")
print(result[:3])

print("Last two students:")
print(result[-2:])

print("Only subject columns:")
print(result[:, 1:])

print("Python and SQL marks:")
print(result[:, 1:3])


# =========================
# D. MATHEMATICAL OPERATIONS
# =========================

subject_marks = result[:, 1:]

print("Add 5 bonus marks:")
print(subject_marks + 5)

print("Multiply subject marks by 2:")
print(subject_marks * 2)


another_marks = np.array([
    [5, 5, 5],
    [2, 3, 4],
    [1, 2, 3],
    [4, 4, 4],
    [3, 3, 3]
])

print("Array-to-array addition:")
print(subject_marks + another_marks)


# =========================
# E. TRANSPOSE
# =========================

print("Transpose:")
print(result.T)

print("Shape before transpose:")
print(result.shape)

print("Shape after transpose:")
print(result.T.shape)</code></pre>

        </div>

    </section>


    <!-- CHALLENGE -->

    <section class="task challenge" id="challenge">

        <span class="final-label">
            ⭐ CHALLENGE
        </span>

        <div class="task-header">

            <div class="task-title">

                <div class="task-icon">🚀</div>

                <h2>Your Own 3 × 4 Array</h2>

            </div>

        </div>

        <p>
            Create your own 3 × 4 NumPy array and practice everything
            you have learned.
        </p>

        <ul>
            <li>Array creation</li>
            <li>ndim</li>
            <li>shape</li>
            <li>size</li>
            <li>Indexing</li>
            <li>Negative indexing</li>
            <li>Slicing</li>
            <li>Mathematical operation</li>
            <li>Array-to-array operation</li>
            <li>Transpose</li>
        </ul>

        <div class="tip-box">
            💡 Try solving this yourself before looking at the example below.
        </div>

        <div class="code-wrapper">

            <button class="copy-btn">Copy</button>

<pre><code>import numpy as np

challenge = np.array([
    [10, 20, 30, 40],
    [50, 60, 70, 80],
    [90, 100, 110, 120]
])

# Creation
print("Array:")
print(challenge)

# ndim
print("Dimension:")
print(challenge.ndim)

# shape
print("Shape:")
print(challenge.shape)

# size
print("Size:")
print(challenge.size)

# Indexing
print("Indexing:")
print(challenge[1, 2])

# Negative indexing
print("Negative indexing:")
print(challenge[-1, -1])

# Slicing
print("Slicing:")
print(challenge[:2, :2])

# Mathematical operation
print("Add 5:")
print(challenge + 5)

# Array-to-array operation
other = np.array([
    [1, 1, 1, 1],
    [2, 2, 2, 2],
    [3, 3, 3, 3]
])

print("Array-to-array addition:")
print(challenge + other)

# Transpose
print("Transpose:")
print(challenge.T)</code></pre>

        </div>

    </section>


    <!-- FOOTER -->

    <footer>

        <p>
            🐍 NumPy Learning Hub
        </p>

        <p>
            Learn • Practice • Build
        </p>

    </footer>

</div>

</main>


<!-- =========================
     JAVASCRIPT
========================= -->

<script>

    /* =========================
       COPY CODE
    ========================= */

    const copyButtons = document.querySelectorAll(".copy-btn");

    copyButtons.forEach(function(button) {

        button.addEventListener("click", function() {

            const code = button
                .parentElement
                .querySelector("code")
                .innerText;

            navigator.clipboard.writeText(code);

            button.innerText = "Copied ✓";

            setTimeout(function() {
                button.innerText = "Copy";
            }, 1500);

        });

    });


    /* =========================
       SEARCH
    ========================= */

    const searchInput = document.getElementById("search");

    const tasks = document.querySelectorAll(".task, .topic-card");

    searchInput.addEventListener("input", function() {

        const searchText = searchInput.value.toLowerCase();

        tasks.forEach(function(item) {

            const content = item.innerText.toLowerCase();

            if (content.includes(searchText)) {

                item.style.display = "";

            } else {

                item.style.display = "none";

            }

        });

    });

</script>

</body>
</html>