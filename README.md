# A Blog for Gabe

This is the source code for Gabe's blog.

## How to setup password
This blog is a single user platform.
The password has to be stored in the environment.
The following can be used in rails console to generate a hash and salt.

```ruby
password = "abdefghij"
ENV['PASS_SALT'] = BCrypt::Engine.generate_salt
ENV['PASS_HASH'] = BCrypt::Engine.hash_secret(password, ENV['PASS_SALT']) 
```

The hash and salt can then be put into the deployment platform's under the
environment variables 'PASS_SALT' and 'PASS_HASH'