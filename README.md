# Coding test

## About the test

This coding test is used as part of our evaluation for new backend developers. What is important is that you not only code, but also comment on your design choices. It is used to get an insight into your way of thinking and structuring your development and thought process.

The code quality should be what you would consider ready to be deployed to an enterprise production system. If there are parts of your solution that, in your opinion, could have alternative solutions or codesmell, then it would be good that you pinpoint those areas and describe why you feel that these areas could be improved.

## Tech and getting started

We currently use **Ruby on Rails 7.0.4.3** with **Ruby MRI 3.2.2**. As a backend database we use **PostgreSQL 13.1**. For testing we use **RSpec**. We expect that the application will be using the same versions and technologies. Furthermore we use **Rubocop** to improve our code quality. For development and production we use Docker images.

A ready to use Docker setup of Ruby on Rails 7.0.4.3 with PostgreSQL 13.1 is available. This can be cloned from the public repo:

`https://github.com/DecideAct/skeleton-rails-app`

To start up a ready to use skeleton app simply clone the public repo and run:

```
docker-compose run web rake db:create
docker-compose run web rails c
```

and

```
docker-compose run web ANY_COMMAND_YOU_WISH_TO_RUN_IN_THE_DOCKER_CONTAINER
```

Example:

```
docker-compose run web bundle exec rspec spec
```

Since our backend system is only used in API mode it is not necessary to use any time on any frontend functionality. All testing should be done via RSpec and/or via the rails console.

You can use any gem and any extensions to PostgreSQL, as long as you comment on why you have decided to use this certain gem or extension in your application.

Please read the tests through thoroughly since each line contains important information and hints to the task. If you have any questions in regard to the test then don’t hesitate to contact me: `lasse@decideact.net`

Each test is an individual test. The tests are not related and can be solved in any order.

---

## Test 1

Design the model(s) (migrations, models and RSpec tests) for the following scenario:

A school has students. Each student is identified by a unique non sequential ID. Each student has a first name, a last name and an optional middle name. Each student has a unique and valid email address. The email address `foo@bar.com` and `FOO@bar.com` is considered to be the same email address. You can store the email address in any format you prefer.

The school offers courses. Each course is identified by a unique non sequential ID. Each course has a name and an optional description. Each course has a unique reference code which consists of 3 capital letters, a dash (-) and 5 digits. Eg. “TRB-38491”

Each student can attend any course, but only once! Each student will have a grade between 0 and 100 (integer) for the attended course. A course passed is any course that the student attend with a grade greater than or equal to 80.

The student model should have the following method calls implemented:

```
passed_courses  :  All the courses that the student passed
failed_courses  :  All the courses that the student failed
average_grade   :  The average grade of all the courses that the student attended
```

The courses model should have the following method calls implemented:

```
students_that_passed  :  All students that passed the course
students_that_failed  :  All students that failed the course
```

- Explain the various data types used in PostgreSQL and why you have decided to use the specific types
- Explain how and why indexes are used
- Explain why and how you decide to use RSpec tests to cover the model validations

---

## Test 2

We have a busy bank with 1000s of transactions per second. Transactions are deposits into accounts, withdrawals from accounts and movements of amounts between different accounts.

Design a simple model of a bank account. The account has a balance of any valid amount in Euros. The balance can be positive or negative (assume that the balance is always in the range of -2000000..2000000) and that the amount can be any euro and cent amount. It is essential that the amounts in the accounts are precise!

Create business logic for the following:

- Return the sum of the balance for all the accounts
- Transfer a given amount between two accounts - the sender and recipient accounts must not be the same
- Add a given amount to an account (a deposit in a bank of money into an account)
- Deduct a given amount from an account (a withdrawal in a bank of money from an account)

Again you are allowed to use any gem that you find useful, but please explain why you decided to use the gem.

Our system uses this gem extensively:

`https://github.com/collectiveidea/interactor`

It is not required, however I would recommend looking at this gem.

---

## Test 3

A junior developer made the following function for returning the average sum of elements of an array. The input data is from various sources; **trusted** and **untrusted**. It is essential that the function will not cause application errors no matter what the provided input is.

Write RSpec tests for the following code and come with improvements to the code.

```
def calculate_average(a)
  a.sum / a.length
end
```

Example:

```
3.2.1 :001 > calculate_average([1,2,3])
 => 2

3.2.1 :002 > calculate_average([1,2,3,4,5,6,7,8,9])
 => 5

3.2.1 :003 > calculate_average([-1,-2,3])
 => 0

3.2.1 :010 > calculate_average([0])
 => 0
```
