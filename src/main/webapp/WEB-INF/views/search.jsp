<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
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
                                <a class="nav-link active" aria-current="page" href="/miniproject/best">Best(table)</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/miniproject/best2">Best(card)</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/miniproject/search">Search</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    Mypage
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="/miniproject/complit">?????? ???</a></li>
                                    <li><a class="dropdown-item" href="/miniproject/rentbook">????????????</a></li>
                                </ul>
                            </li>
                        </ul>
                        <div class="header_buttons">
                            <a href="/miniproject/signin"><button class="btn btn-outline-primary" type="text">SignIn</button></a>
                            <a href="/miniproject/login"><button class="btn btn-outline-primary" type="text">Login</button></a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div id="searchPage">
        <div class="booksearch">
            <div>
                <input id="bookName" value="" type="text" placeholder="??? ?????? ?????? ????????? ??????????????????.">
                <button id="search">??????</button>
            </div>
        </div>
        <div id="searchedBook"></div>
    </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script>
        let bookname = [];
        $(document).ready(function () {
            $("#search").click(function () {
                $.ajax({
                    method: "GET",
                    url: "https://dapi.kakao.com/v3/search/book?target=title&authors",
                    data: { query: $("#bookName").val() },
                    headers: { Authorization: "KakaoAK 6a4ace9737c922ea744f932aa9974c54" }
                })
                    .done(function (book) {
                        console.log(book)
                        for (let j = 0; j < 10; j++) {
                            $('.bookInfo' + j).remove();
                        }
                        for (let i = 0; i < 10; i++) {
                            bookname[i] = book.documents[i].title
                            $('#searchedBook').append("<div class='bookInfo" + i + "''></div>");
                            $('.bookInfo' + i).append("<div class='bookTitle" + i + "'><h2>" + book.documents[i].title + "</h2></div>");
                            $('.bookInfo' + i).append("<div class='bookImg'>" + "<img src=" + book.documents[i].thumbnail + "></img>" + "</div > ");
                            $('.bookTitle' + i).append("<h4>??????</h4>" + "<p>" + book.documents[i].authors + "</p>")
                            $('.bookTitle' + i).append("<h4>??????</h4>" + "<p>" + book.documents[i].price + "</p>")
                            $('.bookTitle' + i).append("<h4>??????</h4>" + "<p>" + book.documents[i].contents + "</p>")
                            $('.bookTitle' + i).append("<div class='bookInfoButtons" + i + "'></div>");
                            $('.bookInfoButtons' + i).append("<button onclick='rentbook(" + i + ")'>????????????</button>");
                            $('.bookInfoButtons' + i).append("<button onclick='readed(" + i + ")'>??????</button>")
                        }
                    });
            });
        });
    </script>
    <script>function rentbook(i) {
            $.ajax({
                method: 'POST',
                url: '/rent',
                data: { bookname: bookname[i] }
            })
        }

        function readed(i) {
            $.ajax({
                method: 'POST',
                url: '/readed',
                data: { bookname: bookname[i] }
            })
        }
    </script>
</body>

</html>