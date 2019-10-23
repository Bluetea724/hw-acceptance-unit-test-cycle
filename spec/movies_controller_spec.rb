require 'rails_helper'

describe Movie do
    it 'should find movies with the same director' do
        movie1 = Movie.create(title: 'test', director: 'test')
        movie2 = Movie.create(title: 'test123', director: 'test')
        results = Movie.similar_movies(movie1.id)
        expect(results).to eq([movie1, movie2])
    end
    
    it 'should return nil when no director present ' do
        movie1 = Movie.create(title: 'test4')
        results = Movie.similar_movies(movie1.id)
        expect(results).to eq(nil)
    end
end