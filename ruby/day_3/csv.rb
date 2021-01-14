module ActsAsCsv
    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    module InstanceMethods
        include Enumerable

        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')

            file.each do |row|
                @csv_contents << row.chomp.split(', ')
            end
        end

        attr_accessor :headers, :csv_contents
        def initialize
            read
        end

        def each
            @csv_contents.each do |row|
                fields = @headers.zip(row).to_h
                yield CsvRow.new(fields)
            end
        end
    end
end

class RubyCsv  # no inheritance! You can mix it in
    include ActsAsCsv
    acts_as_csv
end

class CsvRow
    def initialize(fields)
        @fields = fields
    end

    def method_missing(name, *args)
        @fields.fetch(name.to_s, "column not found")
    end

    def inspect
        @fields.to_s
    end
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

m.each { |row| puts row.first }
