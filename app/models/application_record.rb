# frozen_string_literal: true

# Class for ApplicationRecord
class ApplicationRecord < ActiveRecord::Base
  # It is introduced in Rails 7.0. This is useful if your application uses a different class
  # than ApplicationRecord for your primary abstract class. This class will share a database
  # connection with Active Record. It is the class that connects to your primary database.
  primary_abstract_class
end
