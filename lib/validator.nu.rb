$:.unshift File.dirname(__FILE__)

module Validator

  # INPUT
  #
  # Document URL as a GET parameter; the service retrieves the document by URL over HTTP or HTTPS.
  # Document POSTed as the HTTP entity body; parameters in query string as with GET.
  # Document POSTed as a textarea value.
  # Document POSTed as a form-based file upload.

  # OUTPUT
  #
  # HTML with microformat-style class annotations (default output; should not be assumed to be forward-compatibly stable).
  # XHTML with microformat-style class annotations (append &out=xhtml to URL; should not be assumed to be forward-compatibly stable).
  # XML (append &out=xml to URL).
  # JSON (append &out=json to URL).
  # GNU error format (append &out=gnu to URL).
  # Human-readably plain text (append &out=text to URL; should not be assumed to be forward-compatibly stable for machine parsing—use the GNU format for that).
 
  # COMPRESSION

  # Request Compression
  # Validator.nu supports HTTP request compression. To use it, compress the request entity body using gzip and specify Content-Encoding: gzip as a request header.
  #
  # Response Compression
  # Validator.nu supports HTTP response compression. Please use it. Response compression is orthogonal to the input methods and output formats.
  # The standard HTTP gzip mechanism is used. To indicated that you prepared to handle gzipped responses, include the Accept-Encoding: gzip request header. When the header is present, Validator.nu will gzip compress the response. You should also be prepared to receive an uncompressed, though, since in the future it may make sense to turn off compression under heavy CPU load.
  

  class << self
    
    def nu(url_or_document)
      "test" 
    end

  end

end
