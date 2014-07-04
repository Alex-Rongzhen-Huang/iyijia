# encoding: UTF-8

ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
  #  div :class => "blank_slate_container", :id => "dashboard_default_message" do
  #    span :class => "blank_slate" do
  #      span I18n.t("active_admin.dashboard_welcome.welcome")
  #      small I18n.t("active_admin.dashboard_welcome.call_to_action")
  #    end
  #  end

    columns do
      column do
        panel "最近的样板房" do

          table_for ShowHouse.order('id desc').limit(5) do |s|
            column("链接") {|s| link_to(s.title, admin_show_house_path(s))}
            column("创建时间") {|s| s.created_at}
          end

        end
        #panel "second on column 1" do
        #  # some code
        #end
        #panel "last on column 1" do
        #  # some code
        #end
      end
      column do
        panel "最近的订单" do
          table_for Order.order('id desc').limit(5) do |order|

            column("订单号") { |order| link_to(order.id, admin_order_path(order))}
            column("客户") { |order| order.user}
            column("上门测量") { |order| status_tag(order.measure_status, order.measure_status=='未测量'?:orange : :green)}
            column("给报价单") { |order| status_tag(order.quotation_status, order.quotation_status=='未报价'?:red : :green)}
            column("装修公司") { |order| order.decorate_company }
            # column("装修公司") { |order| link_to(order.decorate_company, admin_decorate_company_path(order.decorate_company)) }
            # column("待装修房")   {|order| number_to_currency order.total_price                       }
            column("待装修房") { |order| order.house_fitment }
          end
        end

      end
    end

    columns do

      column do
        panel "原报价系统" do

          div do
            br
            text_node %{<iframe src="http://21jia.net" width="100%" height="500" scrolling="no" frameborder="no"></iframe>}.html_safe
          end
        end
      end

    end # columns

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
