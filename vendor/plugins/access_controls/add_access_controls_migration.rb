class AccessControlsPermissionRole < ActiveRecord::Base
end

class AccessControlsRolesUser < ActiveRecord::Base
end

class AccessControlsRole < ActiveRecord::Base
end

class AccessControlsPermission < ActiveRecord::Base
end

class AddAccessControls < ActiveRecord::Migration
  def self.up
    create_table( :access_controls_permissions_roles, :id => false ) do |t|
      t.integer :permission_id
      t.integer :role_id
    end

    create_table( :access_controls_roles_users, :id => false ) do |t|
      t.integer :role_id
      t.integer :user_id
    end

    create_table( :access_controls_permissions ) do |t|
      t.string :name
      t.string :description
    end

    create_table( :access_controls_roles ) do |t|
      t.string :name
      t.string :description
    end

    # make default permission set?
    # @admin_role = AccessControlsRole.new(:name => "admin")
  end

  def self.down
    drop_table :access_controls_roles
    drop_table :access_controls_permissions
    drop_table :access_controls_roles_users
    drop_table :access_controls_permissions_roles
  end
end
