# frozen_string_literal: true
SNIPPET_DIR = "F:/programming/source/repos/git/dsisnero/synvert/lib/crystal"
Synvert::Rewriter.new 'crystal', 'convert_to_crystal' do
   configure(parser: Synvert::PARSER_PARSER)
   description 'It converts ruby code to crystal, it calls all crystal sub snippets.'

  add_snippet "#{SNIPPET_DIR}/expect_to_should.rb"
  add_snippet "#{SNIPPET_DIR}/not_to_should_not.rb"
  add_snippet "#{SNIPPET_DIR}/rspec_describe_to_describe.rb"
  add_snippet "#{SNIPPET_DIR}/raise_error_to_expect_raises.rb"
  add_snippet "#{SNIPPET_DIR}/eq_false_be_false.rb"
  add_snippet "#{SNIPPET_DIR}/spec_raises.rb"
  add_snippet "#{SNIPPET_DIR}/to_not_should_not_be_nil.rb"
  add_snippet "#{SNIPPET_DIR}/to_should.rb"
  add_snippet "#{SNIPPET_DIR}/expect_to_should_be_nil.rb"
end
