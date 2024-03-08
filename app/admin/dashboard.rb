ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Pods" do
          ul do
            Pod.last(5).map do |pod|
              li link_to(pod.title, admin_pod_path(pod))
            end
          end
        end
      end

      column do
        panel "Recent Teachers" do
          ul do
            Teacher.last(5).map do |teacher|
              li link_to(teacher.name, admin_teacher_path(teacher))
            end
          end
        end
      end

      columns do
        column do
          panel "Recent Applications" do
            table_for Application.last(5) do
              column("Parent Email") { |application| application.parent.email }
              column("Status") { |application| application.status }
            end
          end
        end
      end
    end
  end
end
