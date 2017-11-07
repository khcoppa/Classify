require_relative 'db_connection'
require 'active_support/inflector'

class SQLObject

  def initialize(params = {})
    params.each do |name, value|
      name = name.to_sym
      if self.class.columns.include?(name)
        self.send("#{name}=", value)
      else
        raise "unknown attribute '#{name}'"
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.name.tableize
  end

  

end
