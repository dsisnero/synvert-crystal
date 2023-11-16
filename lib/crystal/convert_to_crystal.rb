# frozen_string_literal: true

  Synvert::Rewriter.new 'crystal', 'convert_to_crystal' do
  URL = "https://github.com/dsisnero/synvert-crystal/raw/main/lib/crystal"
  puts "director is #{URL}"
   configure(parser: Synvert::PARSER_PARSER)
   description 'It converts ruby code to crystal, it calls all crystal sub snippets.'

  add_snippet "#{URL}/expect_to_should.rb"
  add_snippet "#{URL}/not_to_should_not.rb"
  add_snippet "#{URL}/rspec_describe_to_describe.rb"
  add_snippet "#{URL}/raise_error_to_expect_raises.rb"
  add_snippet "#{URL}/eq_false_be_false.rb"
  add_snippet "#{URL}/spec_raises.rb"
  add_snippet "#{URL}/to_not_should_not_be_nil.rb"
  add_snippet "#{URL}/to_should.rb"
  add_snippet "#{URL}/expect_to_should_be_nil.rb" 
end
