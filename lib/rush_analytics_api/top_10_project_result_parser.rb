module RushAnalyticsApi
  class Top10ProjectResultParser
    def initialize(url)
      @url = url
    end

    def call
      file = Roo::Spreadsheet.open(@url, extension: 'xlsx')
      sheet = file.sheet(0)
      res = {}
      sheet.each_row_streaming(offset: 1) do |row|
        res[row[0].cell_value] = row[3..-1].map(&:cell_value)
      end
      res
    end
  end
end
