require_relative 'searchable_module'
require 'active_support/inflector'

module Associatable
  def belongs_to(name, options = {})
    self.assoc_options[name] = BelongsToOptions.new(name, options)
    define_method(name) do
      options = self.class.assoc_options[name]

      key_val = self.send(options.foreign_key)
      options
        .model_class
        .where(options.primary_key => key_val)
        .first
    end
  end

  def has_many(name, options = {})
    self.assoc_options[name] = HasManyOptions.new(name, self.name, options)
    define_method(name) do
      options = self.class.assoc_options[name]

      key_val = self.send(options.primary_key)
      options
        .model_class
        .where(options.foreign_key => key_val)
    end
  end

  def assoc_options
    @assoc_options ||= {}
  end

  def has_one_through(name, through_name, source_name)
    define_method(name) do
      through_options = self.class.assoc_options[through_name]
      source_options = through_options.model_class.assoc_options[source_name]

      through_table = through_options.table_name
      through_pri_key = through_options.primary_key
      through_for_key = through_options.foreign_key

      source_table = source_options.table_name
      source_pri_key = source_options.primary_key
      source_for_key = source_options.foreign_key

      key_val = self.send(through_for_key)
      data = DBConnection.execute(<<-SQL, key_val)
        SELECT
          #{source_table}.*
        FROM
          #{through_table}
        JOIN
          #{source_table}
        ON
          #{through_table}.#{source_for_key} = #{source_table}.#{source_pri_key}
        WHERE
          #{through_table}.#{through_pri_key} = ?
      SQL
      source_options.model_class.parse_all(data).first
    end
  end
end

class SQLObject
  extend Associatable
end
