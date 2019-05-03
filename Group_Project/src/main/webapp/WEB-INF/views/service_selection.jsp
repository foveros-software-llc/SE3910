<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Commerce Bank - Services</title>
        
        <style type="text/css">
            table
            {
                margin-bottom: 20px;
            }
            body
            {
                margin: 0px;
                text-align: center;
            }
            #checkingAccount
            {
                background-image: url(resources/service_buttons/imgChangeAccount_Inactive.png);
                height: 125px;
                width: 150px;
                display: block;
				text-indent: -9999em;
				text-transform: uppercase;
            }
            #savingsAccount
            {
                background-image: url(resources/service_buttons/imgSavingsAccount_Inactive.png);
                height: 125px;
                width: 150px;
                display: block;
				text-indent: -9999em;
				text-transform: uppercase;
            }
            #CDMoneyAccount
            {
                background-image: url(resources/service_buttons/imgCDMoneyAccount_Inactive.png);
                height: 125px;
                width: 150px;
                display: block;
				text-indent: -9999em;
				text-transform: uppercase;
            }
            #studentBanking
            {
                background-image: url(resources/service_buttons/imgStudentBanking_Inactive.png);
                height: 125px;
                width: 150px;
                display: block;
				text-indent: -9999em;
				text-transform: uppercase;
            }
            #autoLoans
            {
                background-image: url(resources/service_buttons/imgAutoLoans_Inactive.png);
                height: 125px;
                width: 150px;
                display: block;
				text-indent: -9999em;
				text-transform: uppercase;
            }
            #homeEquity
            {
                background-image: url(resources/service_buttons/imgHomeEquity_Inactive.png);
                height: 125px;
                width: 150px;
                display: block;
				text-indent: -9999em;
				text-transform: uppercase;
            }
            #mortgage
            {
                background-image: url(resources/service_buttons/imgMortgage_Inactive.png);
                height: 125px;
                width: 150px;
                display: block;
				text-indent: -9999em;
				text-transform: uppercase;
            }
            #studentLoans
            {
                background-image: url(resources/service_buttons/imgStudentLoans_Inactive.png);
                height: 125px;
                width: 150px;
                display: block;
				text-indent: -9999em;
				text-transform: uppercase;
            }
            #retirementSavings
            {
                background-image: url(resources/service_buttons/imgRetirementSaving_Inactive.png);
                height: 125px;
                width: 150px;
                display: block;
				text-indent: -9999em;
				text-transform: uppercase;
            }
            #investementAccount
            {
                background-image: url(resources/service_buttons/imgInvestmentAccount_Inactive.png);
                height: 125px;
                width: 150px;
                display: block;
				text-indent: -9999em;
				text-transform: uppercase;
            }
            #creditCard
            {
                background-image: url(resources/service_buttons/imgCreditCard_Inactive.png);
                height: 125px;
                width: 150px;
                display: block;
				text-indent: -9999em;
				text-transform: uppercase;
            }
            #other
            {
                background-image: url(resources/service_buttons/imgOther_Inactive.png);
                height: 125px;
                width: 150px;
                display: block;
				text-indent: -9999em;
				text-transform: uppercase;
            }
            
        </style>
        
    </head>
    
    <body>
        <h2>What can we help you with?</h2>
        <p>Choose as many topics as you need.</p>
        <form method="post" action="/spring/service_selected">
            <table align="center">
                <tr>
                    <td>
                        <input type="submit" value="Checking Account" id="checkingAccount" name="service">
                    </td>
                    <td>
                        <input type="submit" value="Savings Account" id="savingsAccount" name="service">
                    </td>
                    <td>
                        <input type="submit" value="CDs/Money Market Accounts" id="CDMoneyAccount" name="service">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Student Banking" id="studentBanking" name="service">
                    </td>
                    <td>
                        <input type="submit" value="Auto Loans" id="autoLoans" name="service">
                    </td>
                    <td>
                        <input type="submit" value="Home Equity" id="homeEquity" name="service">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Morgage" id="mortgage" name="service">
                    </td>
                    <td>
                        <input type="submit" value="Student Loans" id="studentLoans" name="service">
                    </td>
                    <td>
                        <input type="submit" value="Sivins for Retirement" id="retirementSavings" name="service">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Investment Account" id="investementAccount" name="service">
                    </td>
                    <td>
                        <input type="submit" value="Credit Cord" id="creditCard" name="service">
                    </td>
                    <td>
                        <input type="submit" value="Other" id="other" name="service">
                    </td>
                </tr>
            </table>
            <input type="text" id="textBox" height="5" size="35">
            <br />
            <br />
            <input type="submit" value="Continue">
        </form>
        
    </body>
</html>