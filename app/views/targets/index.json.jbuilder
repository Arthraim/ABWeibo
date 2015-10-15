json.array!(@targets) do |target|
  json.extract! target, :id, :wb_uid
  json.url target_url(target, format: :json)
end
