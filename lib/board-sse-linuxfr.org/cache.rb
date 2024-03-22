class BoardSseLinuxfrOrg
  class Cache
    CAPACITY = 10

    class Entry < Array
      def push(item)
        super item
        shift if size > CAPACITY
      end

      def from(id, &blk)
        found = false
        each do |item|
          blk.call item if found
          found ||= item.first == id
        end
      end
    end

    def initialize
      @keys = Entry.new
      @vals = Entry.new
    end

    def [](key)
      n = @keys.index(key)
      unless n
        @keys.push key
        @vals.push Entry.new
        n = @keys.length - 1
      end
      @vals[n]
    end
  end
end
