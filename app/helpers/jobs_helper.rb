module JobsHelper
	def uri_parse(uri)
	  URI.parse(uri).host
	end
end
