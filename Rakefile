task default: :test

task test: 'Gemfile.lock' do
  sh "rspec"
  sh "cucumber"
end

task rspec: 'Gemfile.lock' do
  sh "rspec"
end

task cucumber: 'Gemfile.lock' do
  sh "cucumber"
end

file 'Gemfile.lock' => 'Gemfile' do
  sh "bundle"
end
