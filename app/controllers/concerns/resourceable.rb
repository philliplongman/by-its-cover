module Resourceable

  private

  def access_resources(resource)
    resource = resource.to_s.downcase.singularize

    # getter - collection
    define_private_method resource.pluralize  do
      instance_variable_get("@#{resource.pluralize}") ||
        instance_variable_set("@#{resource.pluralize}", resource.capitalize.constantize.all)
    end

    # getter - single record
    define_private_method resource do
      instance_variable_get("@#{resource}") ||
        instance_variable_set("@#{resource}", send("load_#{resource}"))
    end

    # find or create resource, then assign any params
    define_private_method "load_#{resource}" do
      record = send("existing_#{resource}") || send("new_#{resource}")
      if params[resource].present?
        record.assign_attributes send("#{resource}_params")
      end
      record
    end

    # find existing resource or return nil
    define_private_method "existing_#{resource}" do
      id = send "#{resource}_id_from_params"
      id.present? ? resource.capitalize.constantize.find(id) : nil
    end

    # new resource
    define_private_method "new_#{resource}" do
      resource.capitalize.constantize.new
    end

    # find id for resource from params
    define_private_method "#{resource}_id_from_params" do
      params["#{resource}_id"] || (params[:id] if controller_name == resource) || nil
    end

    # return strong params for resource
    define_private_method "#{resource}_params" do
      params.require(resource).permit()
    end
  end

end
