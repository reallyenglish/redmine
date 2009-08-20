# Hooks to attach to the Redmine Issues.
class AutoWatchHook < Redmine::Hook::Listener
  def controller_issues_edit_before_save(context = { })
    @issue = context[:issue]
    if @issue.assigned_to_id_was
      previous_assignee = User.find(@issue.assigned_to_id_was)
      unless previous_assignee == nil || @issue.watched_by?(previous_assignee) || @issue.author == previous_assignee
        @issue.add_watcher(previous_assignee)
      end
    end
  end
end
