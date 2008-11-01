README

andand is a method that provides _guarded method invocation_, analagous to the && operator in Ruby, and especially &&=.

For example:

Instead of phone && phone = phone.trim, Ruby lets you say phone &&= phone.trim. So with andand, instead of:

phone && phone.call

We can write:

phone.andand.call (A poor man's attempt to write phone&&.call)

See:

http://weblog.raganwald.com/2008/01/objectandand-objectme-in-ruby.html