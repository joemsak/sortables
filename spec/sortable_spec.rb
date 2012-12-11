require 'spec_no_rails_helper'
require 'sortables'

class SomeSuchClass < ActiveRecord::Base
  sortable
end

class SomeOtherClass < ActiveRecord::Base
  sortable
end

migrator = ActiveRecord::Migration

%w(some_such_classes some_other_classes).each do |table_name|
  unless migrator.table_exists?(table_name)
    migrator.create_table table_name.to_sym do |t|
      t.integer :position
    end
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

  it "doesn't use ambiguous column references" do
    SomeOtherClass.where('position IS NOT NULL').to_sql.should include("some_other_classes.position")
  end
end
