# MONEY EXCHANGE

Following the interview here is a test task. It would be great if you could solve it during next week. And please let me know if you have any questions

Programming task
The program should be developed using Ruby on Rails, for the web pages you can choose
native HTML/Javascript or a framework you are familiar with.
Please upload your project as a pull request in Github. We recommend opening a clean rails
project first and commit that as the master branch, then make a new branch and submit your
solution as a pull request, so the number of changes will be limited to the actual code you’ve
written.
On https://fixer.io/ you can sign up to get access to an WebApi that provides you with currency
exchange rates. The API provides the rates in JSON structures.
Sign up to get access and familiarize you with the API.
Below are a few programming tasks that utilize this service in different ways.
1. Create a ruby script within the rails project that takes in two currency codes and one
amount as input. The amount is in the first currency, and the script should calculate the
currency amount for the second currency code (using the latest exchange rates). The
program should do the calculation in process and not utilize any external calculation api.
2. Extend the program with an optional input date, do the same calculation as in step 1 but
use the currency rate for the date inputted to the program. You need to find out the url for
retrieving exchange rate a given date using the documentation on fixer.io.
3. Create a program that will be executed once a day. The program should retrieve the
latest exchange rate and store it in a database. This task involves designing a suitable
database structure.
Optional tasks (time permitting)
1. Create an API that offers the same calculations as in task 1-1 and task 1-2
2. Build a simple web on top of the service you created in task 2, that offers this calculation
service to the user.
3. Extend the API from task 2-1, with a new method to return all the exchange rates for one
currency for a given period of time. The exchange rates should be extracted from the
database created in task 1-3.
4. Build a web page on top of task 2-3, to show how an exchange rate develops for a time
period, find a satiable graphical component to visualize the exchange rate.