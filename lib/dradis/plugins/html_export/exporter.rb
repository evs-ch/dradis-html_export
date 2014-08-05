module Dradis
  module Plugins
    module HtmlExport
      class Processor
        def self.generate(params={})
          category_name = params.fetch(:category_name, Configuration.category)
          reporting_cat = Dradis::Category.find_by_name(category_name)
          reporting_notes_num = Dradis::Note.count(:all, :conditions => {:category_id => reporting_cat})
          title = "Dradis Framework - v#{Core::VERSION::STRING}"
          notes = Dradis::Note.find( :all, :conditions => {:category_id => reporting_cat} )

          erb = ERB.new( File.read(Configuration.template) )
          erb.result( binding )
        end
      end
    end
  end
end