require 'rexml/document'
require File.dirname(__FILE__) + '/../../../spec_helper'


describe "REXML::Element#add_element" do
  before :each do
    @root = REXML::Element.new("root")
  end
  
  it "adds a child without attributes" do
    name = REXML::Element.new("name")
    @root.add_element name
    @root.elements["name"].name.should == name.name
    @root.elements["name"].attributes.should == name.attributes
    @root.elements["name"].context.should == name.context
  end

  it "adds a child with attributes" do
    person = REXML::Element.new("person")
    @root.add_element(person, {"name" => "Madonna"})
    @root.elements["person"].name.should == person.name
    @root.elements["person"].attributes.should == person.attributes
    @root.elements["person"].context.should == person.context
  end

  it "adds a child with name" do
    @root.add_element "name"
    @root.elements["name"].name.should == "name"
    @root.elements["name"].attributes.should == {}

    # FIXME: this fails in MRI since nil is returned,
    # is that correct behavior or not?
    # @root.elements["name"].context.should == {}
  end

  it "returns the added child" do
    name = @root.add_element "name"
    @root.elements["name"].name.should == name.name
    @root.elements["name"].attributes.should == name.attributes
    @root.elements["name"].context.should == name.context
  end
end
