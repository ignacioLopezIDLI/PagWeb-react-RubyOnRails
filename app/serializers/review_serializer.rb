class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :score, :lenguaje_id
end
