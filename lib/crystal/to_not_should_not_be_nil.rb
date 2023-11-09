
Synvert::Rewriter.new 'crystal', 'to_not_should_not_be_nil.rb' do
  description <<~EOS
    It converts expect().to eq to ().should eq
    ```ruby
    expect().to_not
     ```

    =>

    ```crystal
      ().should_not
    ```
  EOS
  
  configure(parser: Synvert::PARSER_PARSER)
  within_files '**/*.rb' do
    find_node '.send[receiver=.send[receiver=nil][message=expect][arguments.size=1][arguments.0=.send[message=default_instance][arguments.size=0]]][message=to_not][arguments.size=1][arguments.0=.send[receiver=nil][message=be_nil][arguments.size=0]]' do
      group do
        replace :message, with: 'should_not'
        replace :receiver, with: '{{receiver.arguments.0}}'
      end
    end
  end
end
