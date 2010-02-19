module AccessControls
  module ActionViewExtensions
    def visible_with_permission(*permissions, &block)
      yield if block_given? && Role.get_user.has_permission?(*permissions)
    end

    def visible_with_role(*roles, &block)
      yield if block_given? && Role.get_user.has_role?(*role)
    end
  end
end
