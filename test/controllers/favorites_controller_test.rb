require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest

  test 'should redirect create when not logged in' do
    archer = users(:archer)
    orange = microposts(:orange)
    assert_no_difference 'Favorite.count' do
      post favorites_path, params: {micropost_id: orange.id}
    end
    log_in_as(archer)
    assert_difference 'Favorite.count', 1 do
      post favorites_path, params: {micropost_id: orange.id}
    end
  end

  test 'should redirect delete when not logged in' do
    michael = users(:michael)
    orange = microposts(:orange)
    @favorite = favorites(:one)
    assert_no_difference 'Favorite.count' do
      delete  favorite_path(@favorite)
    end
    log_in_as(michael)
    assert_difference 'Favorite.count', -1 do
      delete  favorite_path(@favorite)
    end
  end

  test 'should redirect delete when different_user' do
    michael = users(:michael)
    archer = users(:archer)
    orange = microposts(:orange)
    @favorite = favorites(:one)
    log_in_as(archer)
    assert_no_difference 'Favorite.count' do
      delete  favorite_path(@favorite)
    end
  end
end
