<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/stylesheet.css"/>
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
            label {
                border: 1px solid #fff;
                padding: 10px;
                display: block;
                position: relative;
                margin: 10px;
                cursor: pointer;
            }

            label::before {
                background-color: white;
                color: white;
                content: " ";
                display: block;
                border-radius: 50%;
                border: 1px solid darkgreen;
                position: absolute;
                top: -5px;
                left: -5px;
                width: 25px;
                height: 25px;
                text-align: center;
                line-height: 28px;
                transition-duration: 0.4s;
                transform: scale(0);
            }

        	label img {
          		height: 125px;
         	 	width: 150px;
         	 	transition-duration: 0.2s;
        	  	transform-origin: 50% 50%;
        	}

       	 	:checked+label {
          		border-color: darkgreen;
       	 	}

        	:checked+label img {
          		transform: scale(0.9);
          		z-index: -1;
        	}
            
        </style>
        
    </head>
    
    <body>
        <h2>What can we help you with?</h2>
        <p>Choose as many topics as you need.</p>
        <form:form method="POST" action="showServices" modelAttribute="services">
            <table align="center">
                <tr>
                    <td>
                        <form:checkbox path="services" value="Checking Account" id="checkingAccount" style="display: none" />
                        <form:label path="services" for="checkingAccount">
                            <img src="resources/service_buttons/imgChangeAccount_Inactive.png">
                        </form:label>
                    </td>
                    <td>
                        <form:checkbox path="services" value="Savings Account" id="savingsAccount" style="display: none" />
                        <form:label path="services" for="savingsAccount">
                            <img src="resources/service_buttons/imgSavingsAccount_Inactive.png">
                        </form:label>
                    </td>
                    <td>
                        <form:checkbox path="services" value="CDs/Money Account" id="CDMoneyAccount" style="display: none" />
                        <form:label path="services" for="CDMoneyAccount">
                            <img src="resources/service_buttons/imgCDMoneyAccount_Inactive.png">
                        </form:label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:checkbox path="services" value="Student Banking" id="studentBanking" style="display: none" />
                        <form:label path="services" for="studentBanking">
                            <img src="resources/service_buttons/imgStudentBanking_Inactive.png">
                        </form:label>
                    </td>
                    <td>
                        <form:checkbox path="services" value="Auton Loans" id="autoLoans" style="display: none" />
                        <form:label path="services" for="autoLoans">
                            <img src="resources/service_buttons/imgAutoLoans_Inactive.png">
                        </form:label>
                    </td>
                    <td>
                        <form:checkbox path="services" value="Home Equity" id="homeEquity" style="display: none" />
                        <form:label path="services" for="homeEquity">
                            <img src="resources/service_buttons/imgHomeEquity_Inactive.png">
                        </form:label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:checkbox path="services" value="Morgage" id="mortgage" style="display: none" />
                        <form:label path="services" for="mortgage">
                            <img src="resources/service_buttons/imgMortgage_Inactive.png">
                        </form:label>
                    </td>
                    <td>
                        <form:checkbox path="services" value="Student Loans" id="studentLoans" style="display: none" />
                        <form:label path="services" for="studentLoans">
                            <img src="resources/service_buttons/imgStudentLoans_Inactive.png">
                        </form:label>
                    </td>
                    <td>
                        <form:checkbox path="services" value="Retirement Savings" id="retirementSavings" style="display: none" />
                        <form:label path="services" for="retirementSavings">
                            <img src="resources/service_buttons/imgRetirementSaving_Inactive.png">
                        </form:label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:checkbox path="services" value="Investment Account" id="investmentAccount" style="display: none" />
                        <form:label path="services" for="investmentAccount">
                            <img src="resources/service_buttons/imgInvestmentAccount_Inactive.png">
                        </form:label>
                    </td>
                    <td>
                        <form:checkbox path="services" value="Credit Card" id="creditCard" style="display: none" />
                        <form:label path="services" for="creditCard">
                            <img src="resources/service_buttons/imgCreditCard_Inactive.png">
                        </form:label>
                    </td>
                    <td>
                        <form:checkbox path="services" value="Other" id="other" style="display: none" />
                        <form:label path="services" for="other">
                            <img src="resources/service_buttons/imgOther_Inactive.png">
                        </form:label>
                    </td>
                </tr>
            </table>
            <!-- <input type="text" height="5" value="Add a note. . ." size="35"> -->
            <!-- <br /> -->
            <br />
            <input type="submit" value="Continue">
        </form:form>
        
    </body>
</html>
