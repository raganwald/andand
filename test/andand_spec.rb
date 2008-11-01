=begin

Copyright (c) 2008 Reginald Braithwaite
http://weblog.raganwald.com/2008/01/objectandand-objectme-in-ruby.html

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

=end

require File.dirname(__FILE__) + '/test_helper.rb'

require 'andand'

class Symbol
  def to_proc
    Proc.new { |*args| args.shift.__send__(self, *args) }
  end
end

describe AndAnd, "Basic Behaviour" do
  it "should conditionally yield to a block" do
    5.andand { |n| n*n }.should == 25
    5.andand(&:succ).should == 6
    nil.andand { |n| n*n }.should == nil
    false.andand { |n| n*n }.should == false
  end
  it "should conditionally call a proc-able parameter" do
    5.andand(:succ).should == 6
    nil.andand(:succ).should == nil
    false.andand(:succ).should == false
  end
  it "should conditionally proxy methods" do
    5.andand.succ.should == 6
    nil.andand.succ.should == nil
    false.andand.succ.should == false
    (1..10).andand.inject(&:+).should == 55
    nil.andand.inject(&:+).should == nil
    false.andand.inject(&:+).should == false
    'HelloWeblogReaders'.andand[7,4].should == 'blog'
    nil.andand[7,4].should == nil
    false.andand[7,4].should == false
    'HelloWeblogReaders'.andand.tr('Wb','Bd').should == 'HelloBedlogReaders'
    nil.andand.tr('Wb','Bd').should == nil
    false.andand.tr('Wb','Bd').should == false
  end
  it "should handle infix operators" do
    (5.andand * 2).should == 10
    (nil.andand * 2).should == nil
    (false.andand * 2).should == false
  end
end

describe AndAnd, "Me" do
  it "should unconditionally yield to a block" do
    5.me { |n| n*n }.should == 5
    5.me(&:succ).should == 5
    nil.me { |n| n || true }.should be_nil
    false.me { |n| n || true }.should == false
  end
  it "should unconditionally call a proc-able parameter" do
    5.me(:to_s).should == 5
    nil.me(:to_s).should == nil
    false.me(:to_s).should == false
  end
  it "should proxy methods" do
    5.me.to_s.should == 5
    nil.me.to_s.should == nil
    false.me.to_s.should == false
    (1..10).me.inject(&:+).should == (1..10)
    'HelloWeblogReaders'.me[7,4].should == 'HelloWeblogReaders'
    'HelloWeblogReaders'.me.tr('Wb','Bd').should == 'HelloWeblogReaders'
  end
  it "should handle infix operators" do
    (5.me * 2).should == 5
  end
end

describe AndAnd, "Mixing Me with AndAnd" do
  it "should compose me.andand" do
    frobbish = :blitz
    :foo.me.andand do
      frobbish = :bar
    end.should == :foo
    frobbish.should == :bar
    nil.me.andand do
      frobbish = :barbarella
    end.should be_nil
    frobbish.should == :bar
    false.me.andand do
      frobbish = :hope
    end.should == false
    frobbish.should == :bar
  end
end

class Foo
  def frobbish
    'fnord'
  end
end

describe AndAnd, "exception handling" do
  it "should not swallow NoMethodErrors" do
    foo = Foo.new
    lambda do
      foo.andand.frobbish
      nil.andand.frobbish
      nil.andand.hsibborf
    end.should_not raise_error
    lambda do
      foo.andand.hsibborf
    end.should raise_error
  end
end