Feature: Find the number of seats available within the venue to find, findAndHold & reserveSeats

@NumOfSeatsAvailable @happypath
Scenario Outline: to check whether Interface returns number of seats available, updates the DB to hold best available seats for 30 seconds
	Given I have a valid cusotmer emailID "<valid_customer_emailID>"
	And I have a valid integer of numberofSeatsRequested "<numberofSeatsRequested>"
	When I send a "<request_name>" to method "numSeatsAvailable"
	Then "<field_name>" field is present in the response
	And "<field_name>" is a integer
	And findAndHoldSeats method is invoked by "<numberofSeatsRequested>" and "<valid_customer_emailID>"
	And "SeatHold" object is retured with "<seatHoldId>" and "<valid_customer_emailID>"
	And business status is updated as "findAndHold"
	And the reserveSeats type status is updated as "findAndHold"

	     Examples:
	       | request_name					 							| field_name 							 | valid_customer_emailID | numberofSeatsRequested 					| seatHoldId	|
	       | numofseats_validation 							| numSeatsAvailable 	 		 | test@gmail.com 				| 20	| holdTrackingID |
#-----------------------------------Exception scenarios for num of seats available within the venue to book ----------------------------------------------------------

@NumOfSeatsAvailable @Exception
Scenario Outline: to check whether Interface returns number of seats available if numberofSeatsRequested is missing, equal to zero or greater than 500
	Given I have a valid cusotmer emailID "<valid_customer_emailID>"
	And I have a valid integer of numberofSeatsRequested "<numberofSeatsRequested>"
	When I send a "<request_name>" to method "numSeatsAvailable"
	Then "<field_name>" field is present in the response
	And "<field_name>" is a integer
	And findAndHoldSeats method is invoked by "<numberofSeatsRequested>" and "<valid_customer_emailID>"
	And "SeatHold" object is retured with "<seatHoldId>" and "<valid_customer_emailID>"
	And business status is updated as "findAndHold"
	And the reserveSeats type status is updated as "findAndHold"
	And the error message "<errorMessage>" and "<error_id>" should be as expected

	     Examples:
	       | request_name							| field_name				| valid_customer_emailID | numberofSeatsRequested | seatHoldId	| errorMessage | error_id
	       | numofseats_MissingInput  | numSeatsAvailable |test@gmail.com  					| none 									| trackingId  | | "Missing input for numberofSeatsRequested"	| "20000"
	       | numofseats_greaterThan0  | numSeatsAvailable |test@gmail.com  					| none 									| trackingId  | | "Missing input for numberofSeatsRequested. Please input seat requested between from 1 to 500"	| "20001"
				 | numofseats_Lessthan501  | numSeatsAvailable |test@gmail.com  					| none 									| trackingId  | | "Missing input for numberofSeatsRequested. Please input seat requested between from 1 to 500"	| "20001"
