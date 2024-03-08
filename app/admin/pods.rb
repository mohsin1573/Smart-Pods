ActiveAdmin.register Pod do
  permit_params :title, :description, :location, :grade, :status, :teacher_id, pictures_attributes: [:id, :image, :_destroy]

  index do
    selectable_column
    id_column
    column :name
    column :phone_number
    column :grade
    column :status
    column :teacher
    actions
  end

  form do |f|
    f.inputs "Pod Details" do
      f.input :name
      f.input :phone_number
      f.input :grade
      f.input :status
      f.input :teacher
      f.has_many :pictures do |p|
        p.input :image, as: :file, label: 'Image'
        p.input :_destroy, as: :boolean, label: 'Remove Image'
      end
    end
    f.actions
  end
end
