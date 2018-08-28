module Mulang::PHP
  module SexpParser
    Parser::Builders::Default.emit_lambda = true
    Parser::Builders::Default.emit_procarg0 = true

    def self.parser(ruby_code)
      parser = Parser::CurrentRuby.new
      parser.diagnostics.consumer = lambda {|it|}
      buffer = Parser::Source::Buffer.new('(string)')
      buffer.source = ruby_code
      parser.parse(buffer).tap do |result|
        raise "Syntax error" if result.eql? false
      end
    end
  end
end
