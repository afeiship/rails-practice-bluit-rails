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

    def flash_message_output(content)
        if content.is_a? Array
            flash_list content
        else
            content
        end
    end
end
