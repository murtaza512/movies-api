# frozen_string_literal: true

require 'csv'

# Class for reading movies data from csv file
class MoviesReader
  def self.import_csv(csv_path = 'db/data/the-movies-collection-dummies.csv')
    new.import_csv(csv_path)
  end

  def import_csv(_csv_path)
    movies_collection = File.read('db/data/the-movies-collection-dummies.csv')

    file = CSV.parse(movies_collection, headers: true)

    # This query will make only one database call and store all the movies in the database.
    Movie.create(movies_list_from_file(file))
  end

  private

  # We're extracting the movies from the file and set it to the array of movies object
  # so that we can make only one call to database
  def movies_list_from_file(file)
    file.map do |row|
      id, name, genre, thumbnail, image, owner, market_price = row.fields
      image = correct_image_url(image) if image.present?

      { name:, genre:, thumbnail:, image:, owner:, market_price: }
    end
  end

  # In CSV file, the url provided for the image has incomplete dimensions, here
  # we are extracting the dimensions and making it length x width
  def correct_image_url(image)
    numbers = image.scan(/\d+/).first
    image.sub!("/#{numbers}x", "/#{numbers}x#{numbers}")
  end
end
