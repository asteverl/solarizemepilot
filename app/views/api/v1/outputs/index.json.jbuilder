json.array! @outputs do |output|
  json.extract! output, :date, :quantity, :project
end
