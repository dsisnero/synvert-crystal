# frozen_string_literal: true
Synvert::Rewriter.new 'crystal', 'rspec_describe_to_describe' do
  description <<~EOS
    It converts Rspec.describe to describe

    ```ruby
    Rspec.describe TestClass do
     ```

    =>

    ```crystal
      describe TestClass do
    ```
  EOS
  
  configure(parser: Synvert::PARSER_PARSER)
  within_files '**/*.rb' do
    find_node '.send[receiver=RSpec][message=describe][arguments.size=1]' do
      delete :receiver, :dot
    end
  end
end
