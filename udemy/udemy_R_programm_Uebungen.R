# Übung 1 
'''
https://sds-platform-private.s3-us-east-2.amazonaws.com/uploads/P2-Section2-Homework-The-Challenge.pdf
Test the Law Of Large Numbers for N random normally distributed numbers with
mean = 0, stdev = 1:
Create an R script that will count how many of these numbers fall between -1 and 1
and divide by the total quantity of N
You know that E(X) = 68.2%
Check that Mean(XN) -> E(X) as you rerun your script while increasing N
'''

N <- 1000000
counter <- 0
for(i in rnorm(N)){
  if(i > -1 & i < 1){
    counter <- counter + 1
    
  }
}
counter / N

# Übung 2
'''
https://sds-platform-private.s3-us-east-2.amazonaws.com/uploads/P2-Section3-Homework-The-Challenge.pdf

Scenario: You are a Data Scientist working for a consulting firm. One of your
colleagues from the Auditing department has asked you to help them assess the
financial statement of organisation X.
You have been supplied with two vectors of data: monthly revenue and monthly
expenses for the financial year in question. Your task is to calculate the following
financial metrics:
- profit for each month
- profit after tax for each month (the tax rate is 30%)
- profit margin for each month - equals to profit a after tax divided by revenue
- good months - where the profit after tax was greater than the mean for the year
- bad months - where the profit after tax was less than the mean for the year
- the best month - where the profit after tax was max for the year
- the worst month - where the profit after tax was min for the year

All results need to be presented as vectors.
Results for dollar values need to be calculated with $0.01 precision, but need to be
presented in Units of $1,000 (i.e. 1k) with no decimal points.
Results for the profit margin ratio need to be presented in units of % with no
decimal points.
Note: You colleague has warned you that it is okay for tax for any given month to be
negative (in accounting terms, negative tax translates into a deferred tax asset).
'''
#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#- profit for each month
profit <- revenue - expenses
profit

# - profit after tax for each month (the tax rate is 30%)
tax <- round(profit * 0.3, digits=2)
tax

profit.after.tax <- profit -tax
profit.after.tax

# - profit margin for each month - equals to profit a after tax divided by revenue
profit.margin <- round(profit.after.tax / revenue,2)*100
profit.margin

# - good months - where the profit after tax was greater than the mean for the year
mean_pat <- mean(profit.after.tax)
mean_pat

good.months <- profit.after.tax > mean_pat
good.months

#- bad months - where the profit after tax was less than the mean for the year
bad.month <- !good.months
bad.month

#- the best month - where the profit after tax was max for the year
best.month <- profit.after.tax == max(profit.after.tax)
best.month

#- the worst month - where the profit after tax was min for the year
worth.month <- profit.after.tax == min(profit.after.tax)
worth.month

# Units of thousands
revenue.1000 <- round(revenue/1000)
expenses.1000 <- round(expenses/1000)
profit.1000 <- round(profit/1000)
profit.after.tax.1000 <- round(profit.after.tax / 1000)

# output

