%w[parser priority store stream version].each do |file|
  require_relative "flagdoc/#{file}"
end
