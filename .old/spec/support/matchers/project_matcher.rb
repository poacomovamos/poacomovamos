RSpec::Matchers.define :match_project do |expected|
  match do |actual|
      actual[:number].should eq(expected[:number])
      actual[:year].should eq(expected[:year])
      actual[:type].should eq(expected[:type])
      actual[:materia].should eq(expected[:materia])
      actual[:ementa].should eq(expected[:ementa])
      actual[:processingDate].should eq(expected[:processingDate])
      actual[:sector].should eq(expected[:sector])
      actual[:authors].should eq(expected[:authors])
      actual[:status].should eq(expected[:status])
      actual[:veto].should eq(expected[:veto])
  end

  failure_message_for_should do |actual|
    "expected that project in course #{actual}, would contain the following data: #{expected}"
  end

  failure_message_for_should_not do |actual|
    "expected that project in course #{actual} would not contain the following data: #{expected}"
  end

  description do
    "contains the following data: #{expected}"
  end
end
