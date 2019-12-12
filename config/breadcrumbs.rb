crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", mypage_users_path
end

crumb :profile do
  link "プロフィール", pfofile_user_path
  parent :mypage
end