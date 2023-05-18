object @ranking
attributes :id, :month, :year, :distance_traveled
child :user do
  attributes :id, :name, :email
end
