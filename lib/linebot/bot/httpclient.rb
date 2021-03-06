# Copyright 2016 LINE
#
# LINE Corporation licenses this file to you under the Apache License,
# version 2.0 (the "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at:
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

require 'linebot/bot/api/version'
require 'json'
require 'net/http'
require 'uri'

module LineBot
  module Bot
    class HTTPClient

      # @return [Net::HTTP]
      def http(uri)
        http = Net::HTTP.new(uri.host, uri.port)
        if uri.scheme == "https"
          http.use_ssl = true
        end

        http
      end

      def get(url, header = {})
        uri = URI(url)
        http(uri).get(uri.request_uri, header)
      end

      def post(url, payload, header = {})
        uri = URI(url)
        http(uri).post(uri.request_uri, payload, header)
      end
    end
  end
end
