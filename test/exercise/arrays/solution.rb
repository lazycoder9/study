module Exercise
  module Arrays
    class << self
      def replace(array)
        max_number = array.reduce(array[0]) { |a, e| e > a ? e : a }
        array.map { |x| x.negative? ? x : max_number }
      end

      def search(array, query)
        left = 0
        right = array.length - 1

        while left <= right
          mid = (left + right) / 2
          return mid if array[mid] == query
          left, right = array[mid] > query ? [left, mid - 1] : [mid + 1, right]
        end

        -1
      end
    end
  end
end
