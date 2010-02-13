require 'test_helper'

class VolunteerProfilesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => VolunteerProfile.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    VolunteerProfile.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    VolunteerProfile.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to volunteer_profile_url(assigns(:volunteer_profile))
  end
  
  def test_edit
    get :edit, :id => VolunteerProfile.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    VolunteerProfile.any_instance.stubs(:valid?).returns(false)
    put :update, :id => VolunteerProfile.first
    assert_template 'edit'
  end
  
  def test_update_valid
    VolunteerProfile.any_instance.stubs(:valid?).returns(true)
    put :update, :id => VolunteerProfile.first
    assert_redirected_to volunteer_profile_url(assigns(:volunteer_profile))
  end
  
  def test_destroy
    volunteer_profile = VolunteerProfile.first
    delete :destroy, :id => volunteer_profile
    assert_redirected_to volunteer_profiles_url
    assert !VolunteerProfile.exists?(volunteer_profile.id)
  end
end
