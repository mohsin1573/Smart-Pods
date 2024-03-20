ActiveAdmin.register Application do
  permit_params :status

  controller do
    def scoped_collection
      super.includes(:pod, :parent)
    end
  end

  index do
    selectable_column
    id_column
    column :pod
    column :parent
    column :child
    column :status
    actions defaults: false do |application|
      if application.pending?
        item " Approve   ", approve_admin_application_path(application), method: :put
        item " Reject ", reject_admin_application_path(application), method: :put
      end
    end
  end

  member_action :approve, method: :put do
    resource.approved!
    redirect_back fallback_location: admin_applications_path, notice: "Application approved."
  end

  member_action :reject, method: :put do
    resource.rejected!
    redirect_back fallback_location: admin_applications_path, notice: "Application rejected."
  end
end
