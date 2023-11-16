
Synvert::Rewriter.new 'crystal', 'raise_error_to_expect_raises' do
  description <<~EOS
    It converts expect().to eq to ().should eq
    ```ruby
    expect().to_raise Error
     ```

    =>

    ```crystal
      expect_raises(Error){ }
    ```
  EOS
  
  configure(parser: Synvert::PARSER_PARSER)
  within_files 'spec/**/*.{rb,cr}' do
    find_node '.send[receiver=.block[caller=.send[receiver=nil][message=expect][arguments.size=0]][arguments.size=0]][message=to][arguments.size=1][arguments.0=.send[receiver=nil][message=raise_error][arguments.size=1][arguments.0=ISO8601::Errors::UnknownPattern]]' do
      replace_with 'expect_raises({{arguments.0.arguments.0}}){ {{receiver.body.0}} }'
    end
  end
end
