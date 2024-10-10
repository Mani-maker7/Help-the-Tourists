<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tourism Places</title>
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

        .places-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }

        .place-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
        }

        .place-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .place-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .place-details {
            padding: 15px;
        }

        .place-title {
            font-size: 1.5em;
            margin: 0 0 10px;
            color: #333;
        }

        .place-description {
            font-size: 1em;
            color: #666;
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
    <script>
        function showHomestays(place) {
            window.location.href = "homestays.jsp?place=" + place;
        }
    </script>
</head>
<body>
    <header>
        <h1>Tourism Places</h1>
    </header>
    
    <main>
        <div class="places-container">
            <div class="place-card" onclick="showHomestays('Varanasi')">
                <img src="https://t3.ftcdn.net/jpg/02/05/83/04/360_F_205830468_Hyhd2IjABzdiiDcheTxotWR9SWCiGjtN.jpg" alt="Place 1" class="place-image">
                <div class="place-details">
                    <h2 class="place-title">VARANASI - Beauty of Ghats</h2>
                    <p class="place-description">The city is home to the revered Kashi Vishwanath Temple and many other ancient shrines, reflecting its deep spiritual heritage. Varanasi's streets are alive with colorful markets, traditional music, and the aroma of local delicacies like kachori and Banarasi paan. Known for its exquisite silk sarees, the city is a hub of art and craftsmanship.</p>
                </div>
            </div>

            <div class="place-card" onclick="showHomestays('Jaipur')">
                <img src="https://images.moneycontrol.com/static-mcnews/2023/04/pexels-ankur-bagai-6440428-770x433.jpg?impolicy=website&width=770&height=431" alt="Place 2" class="place-image">
                <div class="place-details">
                    <h2 class="place-title">JAIPUR - Pink City</h2>
                    <p class="place-description">Jaipur, the Pink City of India, is renowned for its stunning architecture and vibrant culture. Known for its distinctive pink-colored buildings, Jaipur boasts iconic landmarks such as the Hawa Mahal, with its intricate lattice windows, and the City Palace, which blends Mughal and Rajasthani styles.</p>
                </div>
            </div>

            <div class="place-card" onclick="showHomestays('Manali')">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9AnAZlVKLuQLcN5je2j-nFZuDPjbu81mURA&s" alt="Place 3" class="place-image">
                <div class="place-details">
                    <h2 class="place-title">MANALI - Himalayan Paradise</h2>
                    <p class="place-description">Manali, nestled in the northern state of Himachal Pradesh, India, is a picturesque hill station renowned for its breathtaking natural beauty and vibrant outdoor activities. Situated in the Kullu Valley, this charming town is surrounded by snow-capped peaks, lush pine forests, and crystal-clear rivers, making it a popular destination for nature lovers and adventure enthusiasts.</p>
                </div>
            </div>
            
            <!-- Add more places as needed -->
        </div>
    </main>
    
    <footer>
        <p>&copy; 2024 Tourism Website</p>
    </footer>
</body>
</html>