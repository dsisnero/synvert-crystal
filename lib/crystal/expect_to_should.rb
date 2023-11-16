Synvert::Rewriter.new 'group', 'name' do
  description <<~EOS
    It converts expect().to eq to ().should eq
    ```ruby
    expect().to
     ```

    =>

    ```crystal
      ().should
    ```
  EOS
  
  configure(parser: Synvert::PARSER_PARSER)
  within_files 'spec/**/*.{rb,cr}' do
    find_node '.send[receiver=.send[receiver=nil][message=expect][arguments.size=1][arguments.0=.send]][message=to][arguments.size=1][arguments.0=.send[receiver=nil][message=eq][arguments.size=1]]' do
      group do
        replace :message, with: 'should'
        replace :receiver, with: '{{receiver.arguments.0}}'
      end
    end
    
    find_node '.send[receiver=.send[receiver=nil][message=expect][arguments.size=1][arguments.0=.send[receiver=nil][arguments.size=0]]][message=to][arguments.size=1][arguments.0=.send[receiver=nil][message=eq][arguments.size=1]]' do
      group do
        replace :message, with: 'should'
        replace :receiver, with: '{{receiver.arguments.0}}'
      end
    end
  end
end
