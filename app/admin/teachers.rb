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

  index do
    selectable_column
    id_column
    column :name
    column :phone_number
    column :education
    column :grade
    column "Zip Code" do |teacher|
      teacher.address&.zipcode
    end
    column :picture do |teacher|
    if teacher.pictures.present?
      image_tag teacher.pictures.first.image, size: '50x50'
    else
      image_tag 'team-2.jpg', size: '50x50'
    end
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :bio
      row :education
      row :grade
      row :phone_number
      row :picture do |teacher|
        if teacher.pictures.present?
          image_tag teacher.pictures.first.image, size: '50x50'
        else
          image_tag 'team-2.jpg', size: '50x50'
        end
      end
      row "Street" do |teacher|
        teacher.address.street
      end
      row "City" do |teacher|
        teacher.address.city
      end
      row "State" do |teacher|
        teacher.address.state
      end
      row "Zip Code" do |teacher|
        teacher.address.zipcode
      end
    end
  end
end
