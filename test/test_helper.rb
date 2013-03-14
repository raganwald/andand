class BlankSlate
  # A global BlankSlate object. This is bad, because it inherits from Object
  # and offers more methods than AndAnd::BlankSlate should offer.
  # For example, ActiveSupport creates a global BlankSlate class.
  def method_on_global_blank_slate
  end
end

require 'test/unit'
require File.dirname(__FILE__) + '/../lib/andand'
