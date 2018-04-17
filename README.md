### Coin Change Problem solved using the Ruby way

We can defined our currency dynamically.

But for an example:
- Quarter: 25
- Dime: 10
- Nickel: 5
- Penny: 1

Write a function that accepts a non-negative amount of money as an input. This function should tell us a way to make change for that amount of money.

For amout = 25 it should return
`{quarters: 1}`

For amout = 41 it should return
`{quarters: 1, dimes: 1, nickels: 1, pennies: 1}`



### To Run It

To run this script from the command line you will need to have **ruby-2.5.0** installed on your machine.

To know what ruby version your running, open a *Terminal* window and type:

    $ ruby -v    # Respose with the ruby version if ruby is installed 

With the correct ruby version installed simply issue the following **commands**:

    $ git clone git_link
    $ cd repo_name
    $ ruby run.rb # runs the code on your terminal
    $ rake test   # run the tests