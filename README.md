Using Rspec Situations
======================

Using Rspec Situations is super simple.


Define a situation with the 'situation' method.
Add a symbol key to identify the situation, and add an optional description if you like, and pass in a block creating the situation.


Describe a set of 1 or more situations with the 'describe_situation' method, and treat it just like a normal describe call.


```ruby
describe Apple do
    subject( :apple ){ create :apple }

    situation( :bought ){ subject.bought_by = create :user }
    situation( :red    ){ subject.color = :Red }

    situation( :1yr_old, 'a year old' ){ subject.created_at = 2.years.ago }

    describe_situation :stolen, :red do
        it{ should be_tasty }
    end

    describe_situation :stolen, :1yr_old do
        it{ should_not be_tasty }
    end
end
```
