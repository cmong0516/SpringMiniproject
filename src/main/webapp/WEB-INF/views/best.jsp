<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="index.css">
    <title>Mini Project</title>
</head>

<body>
    <div class="header">
        <div>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="/">Book You Luv</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="/best">Best(table)</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/hot">Best(card)</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/search">Search</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    Mypage
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="/complit">읽은 책</a></li>
                                    <li><a class="dropdown-item" href="/rentbook">대여목록</a></li>
                                </ul>
                            </li>
                        </ul>
                        <div class="header_buttons">
                            <a href="/signin"><button class="btn btn-outline-primary" type="text">SignIn</button></a>
                            <a href="/login"><button class="btn btn-outline-primary" type="text">Login</button></a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div class="bestTable">
        <h1>Best Rented</h1>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Rank</th>
                    <th scope="col">제목</th>
                    <th scope="col">저자</th>
                    <th scope="col">대여횟수</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
        <button onclick="more">더보기</button>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script>
        $.ajax({
            url: "http://data4library.kr/api/loanItemSrch?authKey=f7d458447d77cb111afff9eaa2142ebe69441ff4b2c730fa26168c975d407b7b&startDt=2017-01-01&endDt=2017-03-27&gender=0&pageNo=1&pageSize=100&format=json",
            dataType: 'jsonp',
            jsonpCallback: "myCallback",
            success: function (data) {
                console.log('성공 - ', data);
                console.log(data.response.docs[0]);

                for (let i = 0; i < 100; i++) {
                    $('.table thead').append("<tr><th scope='row'>" + (i + 1) + "</th><td><p class='detail" + i + "'>" + data.response.docs[i].doc.bookname + "</td><td>" + data.response.docs[i].doc.authors + "</td><td>" + data.response.docs[i].doc.loan_count + "</td></tr>");
                }
            },
            error: function (xhr) {
                console.log('실패 - ', xhr);
            }
        });
    </script>
</body>

</html>