require File.join( File.dirname(__FILE__), '..', 'test_helper' )

class TestTest < Test::Unit::TestCase
  context 'testing tests' do
    setup do
      @var1 = 5
    end

    should 'equal five' do
      assert_equal 5, @var1
    end
  end

  should 'fear the reaper' do
    assert @hello.fears_the_reaper?
  end
end
