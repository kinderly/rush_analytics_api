module RushAnalyticsApi
  class SuggestProjectResultParser
    def initialize(url)
      @url = url
    end

    def call
      tmp_file = open(@url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE)
      file = Roo::Spreadsheet.open(tmp_file, extension: 'xlsx')
      sheet = file.sheet(0)
      sheet.each_row_streaming(offset: 1).map { |row| row[0].cell_value }
    end
  end
end
