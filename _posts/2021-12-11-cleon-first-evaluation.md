---
layout: post
title:  "Cleon gem, the first evaluation"
date:   2021-12-11 12:49:47 +0200
tags:   object-oriented design cleon
---

A few days ago, I developed my first [Users Domain](https://github.com/nvoynov/cleon-users) using [Cleon](https://github.com/nvoynov/cleon). I've chosen a simple and concise domain of user registration and authentication, and the services that it provides are ubiquitous so everyone will understand it. I took it from the "Service-Oriented Design with Ruby and Rails" book and then [adapt it a little](https://github.com/nvoynov/cleon-users/blob/master/user_stories.md).

It should be mentioned that I had some "clean" experience before in 2018, just when I finished reading of the "The Clean Architecture" book. I rewrote some [Creq code](https://github.com/nvoynov/creq) and got the [Clerq](https://github.com/nvoynov/clerq). This is not the paragon of "clean architecture", rather just a remark that the Cleon gem is a second reincarnation.

## Structure

But let's get back to "Users Domain". I hope the core structure is clear [lib/users.rb](https://github.com/nvoynov/cleon-users/blob/master/lib/users.rb)

> now, it seems that `require_relative "users/services"` should go the first :)

```ruby
require_relative "users/version"
require_relative "users/entities"
require_relative "users/services"
require_relative "users/gateways"
require_relative "users/argchkr"
```

Then you could go for [lib/users/services](https://github.com/nvoynov/cleon-users/blob/master/lib/users/services.rb) and see the __domain services__

```ruby
require_relative "services/service"
require_relative "services/register_user"
require_relative "services/authenticate_user"
require_relative "services/change_user_password"
require_relative "services/select_users"
```

## Domain Service

Then some service example, like [change_user_password](https://github.com/nvoynov/cleon-users/blob/master/lib/users/services/change_user_password.rb) and maybe [Credentail Entity](https://github.com/nvoynov/cleon-users/blob/master/lib/users/entities/credentials.rb).

> There are some smell exactly in those two classes. 1) `bcrypt` dependency should be injected into some kind of a security provider. 2) the checking for old_password should be moved from the entity to the service.

```ruby
class ChangeUserPassword < Service
  include Users::Entities

  def initialize(email:, old_password:, new_password:)
    @email = email
    @old_password = old_password
    @new_password = new_password
  end

  def call
    cred = gateway.find_credentials(@email)
    raise Users::Error, "Unknow user or password" unless cred
    cred.change_password(
      old_password: @old_password,
      new_password: @new_password)
    gateway.save_credentials(cred)
  end
end
```

## Gateway and Testing

To test the domain service behavior one needs a data source. For the domain itself, it is too early to choose certain data storage. At the same time, it is exactly the time to shape the [interface of future storage](https://github.com/nvoynov/cleon-users/blob/master/lib/users/gateways/gateway.rb). And when it is shaped (as your domain services require), you can provide [the simplest in memory gateway implementation](https://github.com/nvoynov/cleon-users/blob/master/test/services/memory_gateway.rb) for testing purposes; hash-based in this case. It's also helpful to base on Hash because you can easily turn it into the PStore persistent storage just by wrapping the code into the `PStore#transaction` block.

## ArgChckr

And the last useful module here is [ArgChckr](https://github.com/nvoynov/cleon-users/blob/master/lib/users/argchkr.rb) module that provides the simplest argument policy class for checking incoming arguments.

> At the beginning, I was wondering about adding some more advanced stuff here, like dry-validations, and maybe try RBS. But while I was thinking it over, I decided that my desired behavior there would be just throwing ArgumentError and leaving the decision for the service client; and I'm rather happy with the solution.

```ruby
EmailChkr = Policy.new(
  "email", ":%s must be valid email String[5, 50]",
  ->(v) {
    rx = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    v.is_a?(String) && v.length.between?(5,50) && rx =~ v
  })

PasswordChkr = Policy.new(
  "password", ":%s must be String[8,50]",
  ->(v) { v.is_a?(String) && v.length.between?(8, 50) })
```

## Seeing a little ahead  

I added wrappers for all services directly to the `lib/users.rb`. However, when I made the REST service for the domain, they turned out to be superfluous - it seems more natural to use the service classes directly.

```ruby
def authenticate_user(email:, password:)
  Services::AuthenticateUser.(
    email: email, password: password)
end

def create_user(name:, email:, password:)
  Services::RegisterUser.(
    name: name, email: email, password: password)
end
```
