crumb :home do
  link "Home", root_path
end

crumb :users do
  link 'プロフィール', users_path
  parent :home
end

crumb :likes do
  link 'お気に入り一覧', likes_path
  parent :home
end

crumb :my_posts do
  link '自分の投稿一覧', my_posts_posts_path
  parent :home
end

crumb :password_resets do
  link 'アカウント設定', new_password_reset_path
  parent :home
end

crumb :new_post do
  link '投稿', new_post_path
  parent :home
end

crumb :show_post do |post|
  link '投稿詳細', post_path(post)
  parent :home
end

crumb :edit_post do |post|
  link '投稿編集画面'
  parent :show_post, post
end


crumb :rakuten_search do
  link '楽天で検索' ,items_search_path
  parent :home
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).