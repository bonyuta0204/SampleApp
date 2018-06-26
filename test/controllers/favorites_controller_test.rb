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

end
