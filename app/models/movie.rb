# frozen_string_literal: true

# Class for Movie Model
class Movie < ApplicationRecord
  validates :name, presence: true
end
