ActiveAdmin.register Post do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :slug, :author, :description, :body
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do
    column :title
    column :slug
    column :author
    column :description
    actions
  end

  form do |f|
    f.inputs "" do
      f.input :title
      f.input :slug
      f.input :author
      f.input :description
      f.input :body
    end
    f.actions
  end

  filter :title
  filter :author
end
