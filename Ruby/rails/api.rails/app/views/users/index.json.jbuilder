json.users User.all do |user|
  json.extract! user, :name, :age
end