Synvert::Rewriter.new 'crystal', 'eq_false_be_false' do
  description <<~EOS
    It converts expect().to eq to ().should eq
    ```ruby
    expect().to eq(false)
     ```

    =>

    ```crystal
      ().should be_false
    ```
  EOS
  
  configure(parser: Synvert::PARSER_PARSER)
  within_files 'spec/**/*.{cr,rb}' do
    with_node node_type: 'send', receiver: { node_type: 'send', receiver: nil, message: 'expect', arguments: { size: 1, '0': { node_type: 'send' } } }, message: 'to', arguments: { size: 1, '0': { node_type: 'send', receiver: nil, message: 'eq', arguments: { size: 1, '0': false } } } do
      group do
        replace :arguments, with: 'be_false'
        replace :message, with: 'should'
        replace :receiver, with: '{{receiver.arguments.0}}'
      end
    end
    
    with_node node_type: 'send', receiver: { node_type: 'send', receiver: nil, message: 'expect', arguments: { size: 1, '0': { node_type: 'send' } } }, message: 'to', arguments: { size: 1, '0': { node_type: 'send', receiver: nil, message: 'eq', arguments: { size: 1, '0': true } } } do
      group do
        replace :arguments, with: 'be_true'
        replace :message, with: 'should'
        replace :receiver, with: '{{receiver.arguments.0}}'
      end
    end
  end
end
