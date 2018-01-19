# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling
numbers.one.to.hundred <- 1:100
employee.names <- c(paste("Employee", numbers.one.to.hundred))

# Create a vector of 100 random salaries for the year 2016
# Use the `runif()` function to pick random numbers between 40000 and 50000
twenty.sixteen.salaries <- runif(100, 40000, 50000)

# Create a vector of 100 salaries in 2017 that have changed from 2016
# Use `runif()` to add a random number between -5000 and 10000 to each of 2016's
# salaries (the negative number means that a salary may have decreased!)
twenty.seventeen.salaries <- runif(100, -5000, 10000) + twenty.sixteen.salaries

# Create a data frame 'salaries' by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(employee.names,
                       twenty.sixteen.salaries, 
                       twenty.seventeen.salaries,
                       stringsAsFactors = FALSE)

# Create a column 'change' that stores each person's change in salary between
# 2016 and 2017
salaries$change <- salaries$twenty.seventeen.salaries - salaries$twenty.sixteen.salaries

# Create a column 'got.raise' that is TRUE if the person got a raise (their
# salary went up)
salaries$got.raise <- salaries$change > 0


### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2017 salary of employee 57
print(salaries[57, "twenty.seventeen.salaries"])

# How many employees got a raise?
print(sum(salaries$got.raise))

# What was the dollar value of the highest raise?
max.raise <- max(salaries[["change"]])
print(max.raise)

# What was the "name" of the employee who received the highest raise?
employee.with.highest.raise.features <- salaries[salaries$change == max.raise, ]
employee.with.highest.raise.name <- employee.with.highest.raise.features$employee.names
print(employee.with.highest.raise.name)

# What was the largest decrease in salaries between the two years?
largest.decrease <- min(salaries[["change"]])
print(largest.decrease)

# What was the name of the employee who recieved largest decrease in salary?
employee.with.largest.decrease.features <- salaries[salaries$change == largest.decrease, ]
employee.with.largest.decrease.name <- employee.with.largest.decrease.features$employee.names
print(employee.with.largest.decrease.name)

# What was the average salary change?
mean(salaries$change)

# For people who did not get a raise, how much money did they lose on average?
salary.changes <- salaries$change
mean.decrease <- mean(salary.changes[salary.changes < 0])
print(mean.decrease)

## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?

# Write a .csv file of your salary data to your working directory

