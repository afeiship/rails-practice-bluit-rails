module ApplicationHelper

    def post_link(post)
        return post.link if post.link?
        return post_path(post) if post.text?
    end


    def flash_messages(flash)
        flash.map do |name, msg|
            content_tag :div, class: "alert #{name}" do
                flash_message_output msg
            end
        end.join.html_safe
    end

    def flash_list(messages)
        content_tag :ul do
        messages.map do |message|
            content_tag(:li, message)
        end.join.html_safe
        end
    end

    def flash_message_output(content)
        if content.is_a? Array
            flash_list content
        else
            content
        end
    end


    def sidebar(sidebar_content)
        content_for(:sidebar) { sidebar_content }
    end
end
