require 'sinatra'
require 'signalwire/sdk'


class FaxClient
  def self.send(destination)
    client = Signalwire::REST::Client.new ENV['SIGNALWIRE_PROJECT'], ENV['SIGNALWIRE_TOKEN'], signalwire_space_url: ENV['SIGNALWIRE_SPACE']

    client.fax.faxes
      .create(
        from: ENV['FAX_FROM'],
        to: destination,
        media_url: 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf'
      )
  end
end

use Rack::Auth::Basic, "Go Away" do |username, password|
  username == ENV['BASIC_USER'] && password == ENV['BASIC_PASS']
end

get '/' do
  erb :index
end

post '/send' do
  destination = params[:destination] || ENV['FAX_TO']
  @fax = FaxClient.send(destination)
  erb :send
end