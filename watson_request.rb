require 'rubygems'
require 'rest-client'
require 'pry'
require 'vcr'
require 'webmock'

VCR.configure do |config|
  config.cassette_library_dir = "."
  config.hook_into :webmock
end

# request = RestClient::Request.new(
#   method: :post,
#   url: "https://gateway.watsonplatform.net/document-conversion/api/v1/convert_document?version=2015-12-15",
#   user: "6215eb69-4b15-4a95-857d-5e77cd610da9",
#   password: "nidHwTSGSM3j",
#   config: {conversion_target: "ANSWER_UNITS" },
#   payload: {multipart: true, file: File.new('sample.pdf', 'rb')
#   }).execute

# curl -u "6215eb69-4b15-4a95-857d-5e77cd610da9":"nidHwTSGSM3j" \
# -F 'config={"conversion_target":"ANSWER_UNITS"}' \
# -F 'file=@sample.pdf' \
# "https://gateway.watsonplatform.net/document-conversion/api/v1/convert_document?version=2015-12-15"
# -v


request = nil
VCR.use_cassette("rest-client") do
  request = RestClient.post(
    'https://gateway.watsonplatform.net/document-conversion/api/v1/convert_document?version=2015-12-15',
    {
      "config": { conversion_target: "ANSWER_UNITS" },
      "file": File.new('sample.pdf', 'rb')
    },
    {
      Authorization: 'Basic NjIxNWViNjktNGIxNS00YTk1LTg1N2QtNWU3N2NkNjEwZGE5Om5pZEh3VFNHU00zag=='
    }
  )
end

# binding.pry

# request = RestClient.post(
#   'https://gateway.watsonplatform.net/document-conversion/api/v1/convert_document?version=2015-12-15',
#   {
#     config: { conversion_target: "ANSWER_UNITS" },
#     file: File.new('sample.pdf'),
#   },
#   {
#     Authorization: { user:'6215eb69-4b15-4a95-857d-5e77cd610da9', password: 'nidHwTSGSM3j' }
#   }
# )
# request = nil
# VCR.use_cassette("test") do
#   request = RestClient::Request.execute(
#     method: :post,
#     url: "https://gateway.watsonplatform.net/document-conversion/api/v1/convert_document?version=2015-12-15",
#     config: { "conversion_target" => "ANSWER_UNITS" },
#     payload: {
#       config: { "conversion_target" => "ANSWER_UNITS" },
#       file: File.new('sample.pdf'),
#     },
#     headers: {
#       Authorization: "Basic NjIxNWViNjktNGIxNS00YTk1LTg1N2QtNWU3N2NkNjEwZGE5Om5pZEh3VFNHU00zag=="
#     }
#   )
# end




puts JSON.parse(request)
