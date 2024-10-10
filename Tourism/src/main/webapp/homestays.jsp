<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%
    String place = request.getParameter("place");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homestays in <%= place %></title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            line-height: 1.6;
            background-color: #E0BC9F;
        }

        header {
            background-color: #D29844;
            color: white;
            padding: 20px 0;
            text-align: center;
        }

        main {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin: 10px 0;
            padding: 10px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
        }

        li img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
            margin-right: 20px;
        }

        a {
            text-decoration: none;
            color: #007BFF;
        }

        a:hover {
            text-decoration: underline;
        }

        footer {
            background-color: #f2f2f2;
            text-align: center;
            padding: 10px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>
    <header>
        <h1>Homestays in <%= place %></h1>
    </header>
    <main>
        <%
            if ("Varanasi".equals(place)) {
        %>
            <ul>
                <li>
                    <img src=" https://r1imghtlak.mmtcdn.com/cd936bdc6bb011ed8bc10a58a9feac02.jpg?&output-quality=75&downsize=520:350&crop=520:350;0,20&output-format=jpg" alt="Homestay 1 in Varanasi">
                    <a href=" https://www.makemytrip.com/hotels/hotel_xenia-details-varanasi.html">Hotel Xenia Varanasi</a>
                </li>
                <li>
                    <img src=" https://lh5.googleusercontent.com/p/AF1QipOYifKZxEkRs19Kc-k9v-3xyvJbV1leDhUSPD81=w252-h167-k-no" alt="Homestay 2 in Varanasi">
                    <a href="http://surl.li/zcftyb">Royal Guest House</a>
                </li>
                <li>
                    <img src=" https://lh5.googleusercontent.com/p/AF1QipMC3XBJnjWpVGTPfpp6i1vvLgvKPT15brW7Kxmn=w252-h189-k-no" alt="Homestay 3 in Varanasi">
                    <a href="http://surl.li/negxld">Hotel Satkar</a>
                </li>
            </ul>
        <%
            } else if ("Jaipur".equals(place)) {
        %>
            <ul>
                <li>
                    <img src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/579125034.jpg?k=3d310be5ce01e0b9fa2c0cad1b355f8d1ab3770a8b07d4f728e2764f3eadb338&o=&hp=1" alt="Homestay 1 in Jaipur">
                    <a href="http://surl.li/qrluen">Hotel Travaasa Inn</a>
                </li>
                <li>
                    <img src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/209682153.jpg?k=42f20b1d3653bce7823d5954cf6b692ac0da1d9abe911f8e67f5549978002ffa&o=&hp=1" alt="Homestay 2 in Jaipur">
                    <a href="http://surl.li/nakkjm" target="_blank">Dera Jaipur Homestay</a>
                </li>
                <li>
                    <img src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/551054411.jpg?k=2137cdec0ce497dbd6f523bf9298bd8ac0aa013f3ba2ec6587a683df5ff1dfe9&o=&hp=1" alt="Homestay 3 in Jaipur">
                    <a href="http://surl.li/qineql" target="_blank">FabHotel Aqua</a>
                </li>
            </ul>
        <%
            } else if ("Manali".equals(place)) {
        %>
            <ul>
                <li>
                    <img src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/543397261.jpg?k=80b7734317c0922b6ad43168c42eefdbf00759123fe178a493b41a7211f65175&o=&hp=1" alt="Homestay 1 in Manali">
                    <a href="http://surl.li/ohdrqz" target="_blank"> Hotel Premier Mall Road Manali
                    </a>
                </li>
                <li>
                    <img src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/351324532.jpg?k=9176ba500fe6f09ad4b3cd34fa39e583794a0edce4b8cbcbef9ba8a7427bbb0c&o=&hp=1" alt="Homestay 2 in Manali">
                    <a href="http://surl.li/wukews" target="_blank">The 14 Gables, A Boutique Stay</a>
                </li>
                <li>
                    <img src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/438120664.jpg?k=8ef0fe2708f9c600f38964ea02ffb50d7354a05f1923b091de496d15d7ef9e81&o=&hp=1" alt="Homestay 3 in Manali">
                    <a href="http://surl.li/bdwfhe" target="_blank">Himalayan adventure Cottages & Budget Friendly BNB Manali</a>
                </li>
            </ul>
        <%
            } else {
        %>
            <p>No homestays available for the selected place.</p>
        <%
            }
        %>
        <a href="tourismPlaces.jsp">Back to Tourism Places</a>
    </main>
    <footer>
        <p>&copy; 2024 Tourism Website</p>
    </footer>
</body>
</html>