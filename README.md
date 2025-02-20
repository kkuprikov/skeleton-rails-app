# Coding test

## Architecture choices

### Test 1

As many students may relate to different courses, it's essential to use `has_and_belongs_to_many` association type here. The `has_many :through` is used to store the grade in a join table's field.

Generating UUID as a primary key for students and courses is implemented using `pgcrypto` extension. Unique indexes are used for students' `email` and courses' `reference_code` fields. Also, for the join table a unique compound index on `%i[course_id student_id]` is utilized, along with `:student_id` index. There's no need to use two compound indexes, as explained [here](https://pawelurbanek.com/rails-postgres-join-indexes).

There's no underlying difference between `varchar` and `text` in Postgres, however, I'm used to mark potentially bigger fields as text. Thus, course's description has a `text` type.

As for tests, I covered possible scenarios for blank mandatory fields, wrongly formatted or existing reference code and existing email (coerced to lower case).

### Test 2

I was inspired by simplicity that `interactor` gem provides to extract a business logic for this task to separate classes. An alternative could be using `dry-transaction` and/or `dry-monads` to reflect the flow.

I've chosen a pessimistic lock approach, as we're potentially dealing with hundreds of simultaneous transactions. They should perform fast enough, however, a deadlock may occur if two transfers take place at the same time:

```ruby
# account1 -> account2
account1.lock!
# waiting for account2 to be released
# account2 -> account1
account2.lock!
# waiting for account1
```

In that case, one of the transactions will fail.
Also, it's probably a performance improvement to cache total balance somewhere if it's often asked for. This value should then only be updated on `.deposit` and `.withdraw` operations, relieving the database from performing `sum()` on large dataset.

### Test 3

The logic resides in `lib/array_math.rb` module. We need to ensure that argument for the function is a non-empty `Array` with all elements being numeric.
