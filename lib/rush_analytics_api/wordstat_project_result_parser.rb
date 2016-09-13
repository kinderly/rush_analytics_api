module RushAnalyticsApi
  class WordstatProjectResultParser
    def initialize(url)
      @url = url
    end

    def call
      tmp_file = open(@url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE)
      file = Roo::Spreadsheet.open(tmp_file, extension: 'xlsx')
      sheet = file.sheet(0)
      sheet.parse(word: sheet.row(1)[0], count: sheet.row(1)[1])[1..-1]
    end
  end
end
