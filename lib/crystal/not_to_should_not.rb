
Synvert::Rewriter.new 'group', 'name' do
  description <<~EOS
    It converts expect().not_to to ().should_not
  
    ```ruby
    expect().not_to be nil
     ```

    =>

    ```crystal
      ().should_not be_nil
    ```
  EOS
  
  configure(parser: Synvert::PARSER_PARSER)
  within_files 'spec/**/*.{rb,cr}' do
    find_node '.send[receiver=.send[receiver=nil][message=expect][arguments.size=1]][message=not_to][arguments.size=1][arguments.0=.send[receiver=nil][message=be][arguments.size=1][arguments.0=nil]]' do
      group do
        replace :arguments, with: 'be_nil'
        replace :message, with: 'should_not'
        replace :receiver, with: '{{receiver.arguments.0}}'
      end
    end
  end
end
