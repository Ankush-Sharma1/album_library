require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "should not save album without title" do
    album = Album.new(user_id: User.first.id)
    assert_not  album.save
    # pp(album.errors)
  end
  # test "should report error" do
  #   assert_raises(NameError) do
  #     some_undefined_variable
  #   # assert true
  #   end
  # end
end
