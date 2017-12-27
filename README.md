# Labs TicketServiceQAChallenge
       Funcational Requirments
    1. Find the number of seats available within the venue
       a. Available seats are seats that are neither held nor reserved
    2. Find and hold the best available seats for a given customer
       b. Each ticket hold will expire in seconds
    3. Reserve and commit a specific group of seats for a given customer

 # Assumptions made in the requirements of this project
    1. Seats are allocated from top to bottom rows
    2. Seats are allocated first available in the top row then after each subsequent search if seats are not available in each row starting from the top, reservation of seats will start from the top and cascade to the bottom until best seats are found for a given customer
    3. Each hold will expire in 30 seconds
    4. Maximum venue seats is 500

 # Testing
    1. Test scenaiors are provided under the "Test/Funcational" folder. Please refer to TicketService.feature file
    2. Test scenaiors are writtle gherkin format
    3. Implementation of these test cases can be written using cucumber/java or cucumber/ruby
    4. The same type of use cases can be written for the reserveSeats method where we are looking for seatHoldId & customerEmail
      HappyPath Usecases
      Check to see if the appropriate seatHoldId has the business status as findAndHold & reserveSeats type status is findAndHold then return reservation confirmation code
      Check to see if the appropriate seatHoldId has an expired numofSeconds for a group of seats
      Expections Usecases

  # NFR's
    1. Performance – for example: response time, throughput, utilization, static volumetric
       Scalability - Depending on volume if the interface can scale up to sustain TPS (Transcations per second)
       Capacity - Max of number request the interface can serve on one container, server, etc..
       Availability - 24/7, 365 days. 99.99%
       Reliability
       Security
       Regulatory
       Data Integrity
       Usability
       Interoperability
