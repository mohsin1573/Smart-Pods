ActiveAdmin.register Teacher do
  permit_params :name, :bio, pictures_attributes: [:id, :image]

  form do |f|
    f.inputs "Teacher Details" do
      f.input :name
      f.input :bio
      f.has_many :pictures do |p|
        p.input :image, as: :file, hint: p.object.image.present? ? image_tag(p.object.image.url, size: "200x200") : content_tag(:span, "Upload JPG/PNG/GIF image")
      end
    end
    f.actions
  end
end
