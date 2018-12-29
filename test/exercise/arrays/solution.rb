module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |x| x.negative? ? x : array.max }
      end

      def search(array, query)
        iter = lambda do |left, right|
          return -1 if left > right

          mid = (left + right) / 2
          return mid if array[mid] == query

          new_params = array[mid] > query ? [left, mid - 1] : [mid + 1, right]
          iter.call(*new_params)
        end
        iter.call(0, array.length - 1)
      end
    end
  end
end
