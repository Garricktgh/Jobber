class AddDefaultPicUrlToUsersAndCompanies < ActiveRecord::Migration[5.2]
  def change
    change_column :companies, :display_picture, :text, default: "https://www.pngfind.com/pngs/m/665-6659827_enterprise-comments-default-company-logo-png-transparent-png.png"
    change_column :users, :display_picture, :text, default: "http://www.baytekent.com/wp-content/uploads/2016/12/facebook-default-no-profile-pic1.jpg"
  end
end
