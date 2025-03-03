<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <style>
        /* General Styling */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #f6f9fc, #d9e4f5);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Header Styling */
        .header {
            background-color: #007BFF;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .header .welcome-message {
            font-size: 20px;
            font-weight: bold;
            margin: 0;
        }

        .header .logout-btn {
            background-color: #dc3545;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .header .logout-btn:hover {
            background-color: #c82333;
            transform: translateY(-2px);
        }

        /* Dashboard Container */
        .dashboard-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            padding: 40px;
            margin-top: 100px;
            width: 90%;
            max-width: 800px;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        .dashboard-container h2 {
            margin-bottom: 30px;
            color: #333;
        }

        /* Button Container */
        .btn-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .dashboard-btn {
            display: inline-block;
            background-color: #007BFF;
            color: white;
            padding: 15px 25px;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .dashboard-btn:hover {
            background-color: #0056b3;
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .dashboard-btn:nth-child(odd) {
            background-color: #28a745;
        }

        .dashboard-btn:nth-child(odd):hover {
            background-color: #218838;
        }

        /* Back Button */
        .back-btn {
            display: inline-block;
            background-color: #6c757d;
            color: white;
            padding: 10px 25px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 30px; /* Added margin to increase distance */
        }

        .back-btn:hover {
            background-color: #5a6268;
        }

        /* Footer Styling */
        .footer {
            margin-top: 30px;
            font-size: 14px;
            color: #666;
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <% 
    String name;
        if("submitScore".equals(request.getParameter("sbt")))
        {
        	 HttpSession ss = request.getSession(false);
             name = (String) ss.getAttribute("name");
             if (ss != null) {
            	    ss.invalidate(); // Invalidate the session
            	    ss = request.getSession(false); // Try fetching it again
            	    if (ss == null) {
            	        System.out.println("Session invalidated successfully.");
            	    } else {
            	        System.out.println("Session still exists.");
            	    }
            	} else {
            	    System.out.println("No session to invalidate.");
            	}
             
             HttpSession s = request.getSession();
             s.setAttribute("name",name);

        }
        else{
        	HttpSession s = request.getSession(false);
            name = (String) s.getAttribute("name");
            if (name == null) {
                name = "User"; // Fallback for demonstration
            }
        }
        // Simulating a user session
        
    %>

    <!-- Header -->
    <div class="header">
        <p class="welcome-message">Hello, <%= name %>!</p>
        <a href="logoutUser.jsp" class="logout-btn">Logout</a>
    </div>

    <!-- Dashboard Container -->
    <div class="dashboard-container">
        <h2>User Dashboard</h2>
        <div class="btn-container">
            <a href="attendQuiz.jsp" class="dashboard-btn">Attend Quiz</a>
            <a href="viewScore.jsp" class="dashboard-btn">View Scores</a>
            <a href="viewProfile.jsp" class="dashboard-btn">View Profile</a>
            <a href="chooseLevel.jsp" class="dashboard-btn">Leaderboard</a>
        </div>
        <a href="login.jsp" class="back-btn">Back</a>
        <div class="footer">Start your journey and achieve greatness!</div>
    </div>
</body>
</html>
