
<%
' Retrieve user inputs from the form submission
Dim name, goal, strategy, telephone, income, expenses, savings, debt, initialInvestment, finalInvestment
name = Request.Form("name")
goal = Request.Form("goal")
strategy = Request.Form("strategy")
telephone = Request.Form("telephone")
income = CDbl(Request.Form("income"))
expenses = CDbl(Request.Form("expenses"))
savings = CDbl(Request.Form("savings"))
debt = CDbl(Request.Form("debt"))
initialInvestment = CDbl(Request.Form("initialInvestment"))
finalInvestment = CDbl(Request.Form("finalInvestment"))

' Perform some basic calculations
Dim netWorth, savingsRate, debtToIncomeRatio, investmentReturns

netWorth = income - expenses
If income > 0 Then
    savingsRate = (savings / income) * 100
    debtToIncomeRatio = (debt / income) * 100
Else
    savingsRate = 0
    debtToIncomeRatio = 0
End If
If initialInvestment > 0 Then
    investmentReturns = ((finalInvestment - initialInvestment) / initialInvestment) * 100
Else
    investmentReturns = 0
End If
%>

<!DOCTYPE html>
<html>
<head>
    <title>Personal Finance Dashboard</title>
    <style>
        body {
            background-color: #001F3F;
            color: #FFFFFF;
            font-family: Arial, sans-serif;
            text-align: center;
        }
        h1, h2 {
            color: #39CCCC;
        }
        #dashboard {
            width: 80%;
            margin: 0 auto;
            padding: 50px 0;
        }
        .visualization {
            background-color: #0074D9;
            color: #FFFFFF;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div id="dashboard">
        <h1>Welcome <%= name %>!</h1>
        <h2>Personal Finance Details:</h2>
        <p>Goal: <%= goal %></p>
        <p>Strategy: <%= strategy %></p>
        <p>Telephone: <%= telephone %></p>
        <p>Monthly Income: $<%= income %></p>
        <p>Monthly Expenses: $<%= expenses %></p>
        <p>Monthly Savings: $<%= savings %></p>
        <p>Total Debt: $<%= debt %></p>
        <p>Initial Investment: $<%= initialInvestment %></p>
        <p>Final Investment: $<%= finalInvestment %></p>
        
        <div class="visualization">
            <h3>Net Worth</h3>
            <p>Net Worth: $<%= netWorth %></p>
        </div>
        <div class="visualization">
            <h3>Savings Rate</h3>
            <p>Savings Rate: <%= Round(savingsRate, 2) %>%</p>
        </div>
        <div class="visualization">
            <h3>Debt-to-Income Ratio</h3>
            <p>Debt-to-Income Ratio: <%= Round(debtToIncomeRatio, 2) %>%</p>
        </div>
        <div class="visualization">
            <h3>Investment Returns</h3>
            <p>Investment Returns: <%= Round(investmentReturns, 2) %>%</p>
        </div>
		
		<a href="default.html" class="return-link">Return to Webpage</a>
		
    </div>
</body>
</html>
