ActiveAdmin.register Teacher do
  permit_params :name, :bio, :education, :phone_number, :grade ,address_attributes: [:id, :street, :city, :state, :zipcode, :country], pictures_attributes: [:id, :image,:_destroy]

  form do |f|
    f.inputs "Teacher Details" do
      f.input :name
      f.input :phone_number
      f.input :education
      f.input :grade
      f.input :bio
      f.inputs "Address", for: [:address, f.object.address || Address.new] do |address_form|
        address_form.input :street
        address_form.input :city
        address_form.input :state
        address_form.input :zipcode
      end
      f.has_many :pictures do |p|
        p.input :image, as: :file, label: 'Image'
        p.input :_destroy, as: :boolean, label: 'Remove Image'
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :bio
      row :education
      row :grade
      row :phone_number
      row :picture do |teacher|
        image_tag teacher.pictures.first.image if teacher.pictures.present?
      end
    end
  end
end
