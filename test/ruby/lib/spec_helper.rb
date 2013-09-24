Spec.configure do |config|
  config.after(:each) do
#    MongoMapper.database.collections.each(&:remove)
  end
end
