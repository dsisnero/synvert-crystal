
Synvert::Rewriter.new 'crystal', 'expect_to_should_be_nil' do
  description <<~EOS
    It converts expect().to eq to ().should eq
    ```ruby
    expect().to be_nil
     ```

    =>

    ```crystal
      ().should be_nil
     ```
  EOS
  
  configure(parser: Synvert::PARSER_PARSER)
  within_files '**/*.rb' do
    find_node '.send[receiver=.send[receiver=nil][message=expect][arguments.size=1][arguments.0=.send[receiver=.send[receiver=.send[receiver=nil][message=request_info][arguments.size=0]][message=query_parameters][arguments.size=0]][message=[]][arguments.size=1][arguments.0="select"]]][message=to][arguments.size=1][arguments.0=.send[receiver=nil][message=be_nil][arguments.size=0]]' do
      group do
        replace :message, with: 'should'
        replace :receiver, with: '{{receiver.arguments.0}}'
      end
    end
  end
end
