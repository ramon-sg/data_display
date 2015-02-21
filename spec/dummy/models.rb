class Article < ActiveRecord::Base
  acts_as_displayable
end

class User < ActiveRecord::Base
  acts_as_displayable :birthday, :admin, :created_at
end
