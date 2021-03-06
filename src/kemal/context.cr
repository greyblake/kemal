# Context is the environment which holds request/response specific
# information such as params, content_type e.g
class Kemal::Context
  getter request
  getter response
  getter params
  getter content_type

  def initialize(@request, @params)
    @response = Kemal::Response.new
  end

  def response_headers
    @response.headers
  end

  def add_header(name, value)
    @response.headers.add name, value
  end

  def content_type
    @response.content_type
  end

  delegate headers, @request
  delegate status_code, :"status_code=", :"content_type=", @response
end
