class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  include ImageAttach
end
