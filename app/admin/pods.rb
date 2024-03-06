ActiveAdmin.register Pod do
  permit_params :title, :description, :location, :grade, :status, :teacher_id, pictures_attributes: [:id, :image, :_destroy]

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :location
    column :grade
    column :status
    column :teacher
    actions
  end

  form do |f|
    f.inputs "Pod Details" do
      f.input :title
      f.input :description
      f.input :location
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
