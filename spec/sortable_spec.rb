require 'spec_no_rails_helper'
require 'sortables'

class SomeSuchClass < ActiveRecord::Base
  sortable
end

migrator = ActiveRecord::Migration

unless migrator.table_exists?('some_such_classes')
  migrator.create_table :some_such_classes do |t|
    t.integer :position
  end
end

describe Sortables do
  before { @class = SomeSuchClass }

  it "sorts automatically" do
    obj = @class.create!
    obj2 = @class.create!

    obj.position.should == 0
    obj2.position.should == 1
  end

  it "default scopes by position ASC" do
    obj  = @class.create!(:position => 45)
    obj2 = @class.create!(:position => 25)

    @class.all.should == [obj2, obj]
  end
end
