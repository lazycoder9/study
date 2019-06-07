module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        films = array
                .select { |film| film['country'] && film['country'].split(',').length > 1 }
                .select { |film| film['rating_kinopoisk']&.to_f&.positive? }

        total_rating = films.reduce(0) { |acc, film| acc + film['rating_kinopoisk'].to_f }

        total_rating / films.count
      end

      def chars_count(films, threshold)
        films
          .select { |film| film['rating_kinopoisk'] && film['rating_kinopoisk'].to_f > threshold }
          .map { |film| film['name'].scan(/и/).count }
          .reduce(:+)
      end
    end
  end
end
