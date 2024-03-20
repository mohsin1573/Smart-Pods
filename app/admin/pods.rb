ActiveAdmin.register Pod do
  permit_params :name, :phone_number, :grade, :status, :teacher_id,
                address_attributes: [:id, :street, :city, :state, :zipcode, :country],
                pictures_attributes: [:id, :image, :_destroy]

  index do
    selectable_column
    id_column
    column :name
    column :phone_number
    column :grade
    column :status
    column "Zip Code" do |pod|
      pod.address&.zipcode
    end
    column :picture do |pod|
      if pod.pictures.present? && pod.pictures.first.image.attached?
        image_tag pod.pictures.first.image, size: '50x50'
      else
        image_tag 'classes-3.jpg', size: '50x50'
      end
    end
    column :teacher
    actions
  end

  show do
    attributes_table do
      row :name
      row :grade
      row :status
      row :phone_number
      row :picture do |pod|
        if pod.pictures.present? && pod.pictures.first.image.attached?
          image_tag pod.pictures.first.image, size: '50x50'
        else
          image_tag 'classes-3.jpg', size: '50x50'
        end
      end
      row "Street" do |pod|
        pod.address.street
      end
      row "City" do |pod|
        pod.address.city
      end
      row "State" do |pod|
        pod.address.state
      end
      row "Zip Code" do |pod|
        pod.address.zipcode
      end
    end
  end


  form do |f|
    f.inputs "Pod Details" do
      f.input :name
      f.input :phone_number
      f.input :grade
      f.input :status
      f.input :teacher, collection: Teacher.all.map { |t| ["#{t.name} - Grade #{t.grade}", t.id] }
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
end
