# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe '#validations' do
    it { should validate_presence_of(:name) }
  end

  describe '#schema' do
    it { should have_db_column(:name).of_type(:string).with_options(null: false) }
    it { should have_db_column(:genre).of_type(:string) }
    it { should have_db_column(:thumbnail).of_type(:string) }
    it { should have_db_column(:owner).of_type(:string) }
    it { should have_db_column(:market_price).of_type(:string) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end
end
