require File.join( File.dirname(__FILE__), '..', 'test_helper' )

class RoleTest < Test::Unit::TestCase
  context 'testing Role' do
    setup do
      @var1 = 5
    end

    should 'be able to save role' do
      @role = Role.new(:name => "admin")
      assert @role.save
    end
  end

  context 'nil' do
    should 'fear the reaper' do
      assert nil.respond_to?(:fears_the_reaper?)
    end
  end
end
