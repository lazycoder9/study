module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for i in 0..(length - 1)
          yield(self[i])
        end
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        my_each { |e| result << yield(e) }
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_each { |e| result << e unless e.nil? }
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        for i in 0..(length - 1)
          acc = yield(acc, self[i])
        end
        acc
      end
    end
  end
end
