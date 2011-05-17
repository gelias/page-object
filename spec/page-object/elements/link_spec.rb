require 'spec_helper'
require 'page-object/elements'

describe Link do
  
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :href, :id, :index, :name, :text, :xpath].each do |t|
        identifier = Link.watir_identifier_for t => 'value'
        identifier.keys.first.should == t
      end
    end
    
    it "should map selenium types to watir" do
      [:link, :link_text].each do |t|
        identifier = Link.watir_identifier_for t => 'value'
        identifier.keys.first.should == :text
      end
    end
    
    it "should map selenium types to same" do
      [:class, :id, :link, :link_text, :name, :xpath].each do |t|
        key, value = Link.selenium_identifier_for t => 'value'
        key.should == t
      end
    end
    
    it "should map watir types to selenium" do
      key, value = Link.selenium_identifier_for :text => 'value'
      key.should == :link_text
    end
  end
end