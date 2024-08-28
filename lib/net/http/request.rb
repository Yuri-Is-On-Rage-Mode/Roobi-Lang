module Net
  class HTTP
    class Request
      attr_accessor :method, :protocol, :body, :content_length, :transfer_encoding, :host, :path, :url, :params
      attr_reader   :headers

      def initialize(headers = {})
        @headers = headers
      end

      def set_header(key, value)
        if @headers.nil?
          @headers = {}
        end
        @headers[key] = value
      end

      def get_header(key)
        @headers[key]
      end

      def remove_header(key)
        @headers.delete(key)
      end
    end
  end
end
