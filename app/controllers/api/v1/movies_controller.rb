# frozen_string_literal: true

module Api
  module V1
    # API for fetching movies data
    class MoviesController < ApplicationController
      before_action :set_movie, only: :show

      def index
        movies = Movie.page(params[:page]).per(9)
        render json: { movies:, pages: movies.total_pages }, status: :ok
      end

      def show
        render json: @movie, status: :ok
      end

      private

      def set_movie
        @movie ||= Movie.find_by(id: params[:id])
        render json: { error: 'Movie not found' }, status: :not_found unless @movie
      end
    end
  end
end
