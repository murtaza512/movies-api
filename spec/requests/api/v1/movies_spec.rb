# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Api::V1::MoviesController, type: :controller do
  let(:movie)   { FactoryBot.create(:movie) }
  let!(:movies) { FactoryBot.create_list(:movie, 10) }

  describe 'GET #index' do
    it 'returns first 9 movies in ascending order' do
      get :index
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['movies'].count).to eq(9)
      expect(parsed_response['pages']).to eq(2)
      expect(parsed_response['movies'][0]['name']).to eq(movies.first.name)
      expect(parsed_response['movies'][1]['name']).to eq(movies.second.name)
    end

    context 'when page number is 2' do
      it 'returns response successfully' do
        get :index, params: { page: 2 }
        expect(response).to be_successful
        json = JSON.parse(response.body)
        expect(json['movies'].count).to eq(1)
        expect(json['pages']).to eq(2)
      end
    end

    context 'when page number is invalid' do
      it 'returns no movie' do
        get :index, params: { page: 10 }
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['movies'].count).to eq(0)
        expect(parsed_response['pages']).to eq(2)
      end
    end
  end

  describe 'GET #show' do
    context 'when movie exists' do
      it 'returns a movie' do
        get :show, params: { id: movie.id }
        expect(response).to be_successful
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['name']).to eq(movie.name)
      end
    end

    context 'when movie is not found' do
      it 'returns an error response' do
        get :show, params: { id: 999 }
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['error']).to eq('Movie not found')
        expect(response.status).to eq(404)
      end
    end
  end
end
