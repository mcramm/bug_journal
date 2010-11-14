Given /^the following user record$/ do |table|
  # table is a Cucumber::Ast::Table
  # express the regexp above with the code you wish you had
  table.hashes.each do |user|
      user['password'] = Digest::MD5.hexdigest( user['password'] ) 
      User.create(user)
  end
end
