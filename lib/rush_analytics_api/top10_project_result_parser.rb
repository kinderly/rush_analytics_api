module RushAnalyticsApi
  class Top10ProjectResultParser
    def initialize(url)
      @url = url
    end

    def call
      tmp_file = open(@url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE)
      file = Roo::Spreadsheet.open(tmp_file, extension: 'xlsx')
      sheet = file.sheet(0)
      res = {}
      sheet.each_row_streaming(offset: 1) do |row|
        res[row[0].cell_value] = row[3..-1].map(&:cell_value)
      end
      res
    end
  end
end
